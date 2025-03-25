using Microsoft.Maui.ApplicationModel;

namespace app_impresora.Permissions
{
    public class BluetoothPermissions : Microsoft.Maui.ApplicationModel.Permissions.BasePlatformPermission
    {
#if ANDROID
        public override (string androidPermission, bool isRuntime)[] RequiredPermissions
        {
            get
            {
                return new[]
                {
                    (Android.Manifest.Permission.Bluetooth, true),
                    (Android.Manifest.Permission.BluetoothAdmin, true), 
                    (Android.Manifest.Permission.BluetoothConnect, true),
                    (Android.Manifest.Permission.BluetoothScan, true),
                    (Android.Manifest.Permission.AccessFineLocation, true),
                    (Android.Manifest.Permission.AccessCoarseLocation, true)
                };
            }
        }
#endif
    }
}