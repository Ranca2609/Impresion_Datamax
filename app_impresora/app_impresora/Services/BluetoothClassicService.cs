#if ANDROID
using Android.Bluetooth;
using Android.Content;
using Android.OS;
using Java.Lang.Reflect;
using Java.Util;
using System.Text;

namespace app_impresora.Services
{
    public class BluetoothClassicService : BroadcastReceiver
    {
        private BluetoothAdapter _adapter;
        private BluetoothSocket _socket;
        private readonly Context _context;
        private bool _isDiscovering;

        public event Action<string, string> DeviceDiscovered; 
        // Se dispara con (deviceName, macAddress)

        public BluetoothClassicService(Context context)
        {
            _context = context;
            _adapter = BluetoothAdapter.DefaultAdapter;

            // Registrar para descubrir dispositivos
            var filterFound = new IntentFilter(BluetoothDevice.ActionFound);
            _context.RegisterReceiver(this, filterFound);

            // Registrar para cuando termine la búsqueda
            var filterFinish = new IntentFilter(BluetoothAdapter.ActionDiscoveryFinished);
            _context.RegisterReceiver(this, filterFinish);
        }

        // Inicia escaneo Bluetooth
        public void StartDiscovery()
        {
            if (_adapter == null)
            {
                return;
            }

            if (_adapter.IsDiscovering)
            {
                _adapter.CancelDiscovery();
            }

            _isDiscovering = _adapter.StartDiscovery();
        }

        // Detiene el escaneo
        public void StopDiscovery()
        {
            if (_adapter.IsDiscovering)
            {
                _adapter.CancelDiscovery();
            }
        }

        // BroadcastReceiver: al encontrar dispositivos o al terminar
        public override void OnReceive(Context context, Intent intent)
        {
            var action = intent.Action;
            if (action == BluetoothDevice.ActionFound)
            {
                // Se descubrió un dispositivo
                BluetoothDevice device = (BluetoothDevice)intent.GetParcelableExtra(BluetoothDevice.ExtraDevice);
                if (device != null)
                {
                    string name = device.Name ?? "Sin Nombre";
                    string mac = device.Address; // MAC real del dispositivo a conectar
                    DeviceDiscovered?.Invoke(name, mac);
                }
            }
            else if (action == BluetoothAdapter.ActionDiscoveryFinished)
            {
                _isDiscovering = false;
            }
        }

        // Se conecta a un dispositivo SPP usando su MAC real
        public bool ConnectToDevice(string macAddress)
        {
            try
            {
                if (_adapter.IsDiscovering)
                    _adapter.CancelDiscovery();

                var device = _adapter.GetRemoteDevice(macAddress);
                if (device == null)
                {
                    return false;
                }

                // Emparejar si no está bond
                if (device.BondState != Bond.Bonded)
                {
                    try
                    {
                        var method = device.Class.GetMethod("setPin", new Java.Lang.Class[] {
                            Java.Lang.Class.FromType(typeof(byte[]))
                        });
                        if (method != null)
                        {
                            byte[] pinBytes = Encoding.UTF8.GetBytes("0000");
                            method.Invoke(device, new Java.Lang.Object[] { pinBytes });
                        }
                    }
                    catch (Exception ex)
                    {
                    }

                    bool bondResult = device.CreateBond();
                    System.Threading.Thread.Sleep(2000);
                }

                // Se crea el socket SPP
                var sppUuid = UUID.FromString("00001101-0000-1000-8000-00805F9B34FB");
                _socket = device.CreateRfcommSocketToServiceRecord(sppUuid);
                _socket.Connect();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // Envía texto ASCII + salto de línea
        public bool PrintText(string text)
        {
            if (_socket == null || !_socket.IsConnected)
            {
                return false;
            }
            try
            {
                var buffer = Encoding.ASCII.GetBytes(text);
                _socket.OutputStream.Write(buffer, 0, buffer.Length);
                // Salto de línea final
                _socket.OutputStream.Write(new byte[] { 0x0D, 0x0A }, 0, 2);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // Envio de comandos DPL, en uno o varios paquetes
        public bool PrintDPL(string dplCommand)
        {
            if (_socket == null || !_socket.IsConnected)
            {
                return false;
            }
            try
            {
                var data = Encoding.ASCII.GetBytes(dplCommand);
                // Dividir en chunks si es muy grande el texto
                const int CHUNK_SIZE = 100;
                int offset = 0;
                while (offset < data.Length)
                {
                    int writeSize = Math.Min(CHUNK_SIZE, data.Length - offset);
                    _socket.OutputStream.Write(data, offset, writeSize);
                    offset += writeSize;
                    System.Threading.Thread.Sleep(50);
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        // Desconexión del socket
        public void Disconnect()
        {
            if (_socket != null)
            {
                try
                {
                    _socket.Close();
                    _socket.Dispose();
                    _socket = null;
                }
                catch (Exception ex)
                {
                }
            }
        }

        // Llamar a esto cuando la app se destruya para dejar de recibir broadcasts
        public void Cleanup()
        {
            try
            {
                _context.UnregisterReceiver(this);
            }
            catch { }
        }
    }
}
#endif
