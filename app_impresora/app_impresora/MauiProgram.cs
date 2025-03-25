#if ANDROID
using Android.App;
using Microsoft.Maui.ApplicationModel; 
using app_impresora.Services;
#endif

using Microsoft.Extensions.Logging;

namespace app_impresora
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            builder.Services.AddMauiBlazorWebView();

#if DEBUG
            builder.Services.AddBlazorWebViewDeveloperTools();
            builder.Logging.AddDebug();
#endif

#if ANDROID
            
            builder.Services.AddSingleton<BluetoothClassicService>(sp =>
            {
                var context = Platform.CurrentActivity ?? Android.App.Application.Context;
                return new BluetoothClassicService(context);
            });
#endif

            return builder.Build();
        }
    }
}
