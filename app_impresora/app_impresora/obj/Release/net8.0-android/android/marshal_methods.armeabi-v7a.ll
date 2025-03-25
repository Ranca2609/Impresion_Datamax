; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [126 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [252 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 117
	i32 67008169, ; 1: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 2: Microsoft.Maui.Graphics.dll => 0x44bb714 => 57
	i32 117431740, ; 3: System.Runtime.InteropServices => 0x6ffddbc => 110
	i32 165246403, ; 4: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 63
	i32 182336117, ; 5: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 81
	i32 195452805, ; 6: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 7: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 8: System.ComponentModel => 0xc38ff48 => 93
	i32 254259026, ; 9: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 35
	i32 273568582, ; 10: Plugin.BLE => 0x104e5346 => 58
	i32 280992041, ; 11: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 59
	i32 336156722, ; 14: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 70
	i32 356389973, ; 16: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 17: System.Threading.Thread.dll => 0x16a510e1 => 117
	i32 385762202, ; 18: System.Memory.dll => 0x16fe439a => 101
	i32 395744057, ; 19: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 20: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 21: System.Collections => 0x1a61054f => 90
	i32 450948140, ; 22: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 69
	i32 469710990, ; 23: System.dll => 0x1bff388e => 121
	i32 498788369, ; 24: System.ObjectModel => 0x1dbae811 => 106
	i32 500358224, ; 25: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 26: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 27: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 51
	i32 539058512, ; 28: Microsoft.Extensions.Logging => 0x20216150 => 48
	i32 571435654, ; 29: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 45
	i32 592146354, ; 30: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 31: Xamarin.AndroidX.CustomView => 0x2568904f => 67
	i32 627931235, ; 32: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 33: System.Text.Encodings.Web.dll => 0x27787397 => 114
	i32 672442732, ; 34: System.Collections.Concurrent => 0x2814a96c => 88
	i32 688181140, ; 35: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 36: System.Xml.Linq.dll => 0x29293ff5 => 119
	i32 706645707, ; 37: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 38: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 39: System.Runtime.Loader.dll => 0x2b15ed29 => 111
	i32 759454413, ; 40: System.Net.Requests => 0x2d445acd => 104
	i32 775507847, ; 41: System.IO.Compression => 0x2e394f87 => 97
	i32 777317022, ; 42: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 43: Microsoft.Extensions.Options => 0x2f0980eb => 50
	i32 804008546, ; 44: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 38
	i32 823281589, ; 45: System.Private.Uri.dll => 0x311247b5 => 107
	i32 830298997, ; 46: System.IO.Compression.Brotli => 0x317d5b75 => 96
	i32 864477724, ; 47: Plugin.BLE.dll => 0x3386e21c => 58
	i32 904024072, ; 48: System.ComponentModel.Primitives.dll => 0x35e25008 => 91
	i32 926902833, ; 49: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 50: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 70
	i32 992768348, ; 51: System.Collections.dll => 0x3b2c715c => 90
	i32 999186168, ; 52: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 47
	i32 1012816738, ; 53: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 80
	i32 1028951442, ; 54: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 42
	i32 1029334545, ; 55: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 56: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 60
	i32 1044663988, ; 57: System.Linq.Expressions.dll => 0x3e444eb4 => 99
	i32 1052210849, ; 58: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 72
	i32 1082857460, ; 59: System.ComponentModel.TypeConverter => 0x408b17f4 => 92
	i32 1084122840, ; 60: Xamarin.Kotlin.StdLib => 0x409e66d8 => 85
	i32 1098259244, ; 61: System => 0x41761b2c => 121
	i32 1118262833, ; 62: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 63: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 64: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 43
	i32 1178241025, ; 65: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 77
	i32 1203215381, ; 66: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 67: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 68: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 69: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 68
	i32 1324164729, ; 70: System.Linq => 0x4eed2679 => 100
	i32 1373134921, ; 71: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 72: Xamarin.AndroidX.SavedState => 0x52114ed3 => 80
	i32 1406073936, ; 73: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 64
	i32 1430672901, ; 74: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1454105418, ; 75: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 44
	i32 1461004990, ; 76: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 77: System.IO.Compression.dll => 0x57261233 => 97
	i32 1469204771, ; 78: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 61
	i32 1470490898, ; 79: Microsoft.Extensions.Primitives => 0x57a5e912 => 51
	i32 1480492111, ; 80: System.IO.Compression.Brotli.dll => 0x583e844f => 96
	i32 1493001747, ; 81: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 82: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1521091094, ; 83: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 47
	i32 1543031311, ; 84: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 116
	i32 1546581739, ; 85: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 38
	i32 1551623176, ; 86: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 87: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 74
	i32 1624863272, ; 88: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 83
	i32 1636350590, ; 89: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 66
	i32 1639515021, ; 90: System.Net.Http.dll => 0x61b9038d => 102
	i32 1639986890, ; 91: System.Text.RegularExpressions => 0x61c036ca => 116
	i32 1654881142, ; 92: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 37
	i32 1657153582, ; 93: System.Runtime => 0x62c6282e => 112
	i32 1658251792, ; 94: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 84
	i32 1677501392, ; 95: System.Net.Primitives.dll => 0x63fca3d0 => 103
	i32 1679769178, ; 96: System.Security.Cryptography => 0x641f3e5a => 113
	i32 1729485958, ; 97: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 62
	i32 1736233607, ; 98: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 99: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1760259689, ; 100: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 36
	i32 1766324549, ; 101: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 81
	i32 1770582343, ; 102: Microsoft.Extensions.Logging.dll => 0x6988f147 => 48
	i32 1773133525, ; 103: app_impresora.dll => 0x69afded5 => 87
	i32 1780572499, ; 104: Mono.Android.Runtime.dll => 0x6a216153 => 124
	i32 1782862114, ; 105: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 106: Xamarin.AndroidX.Fragment => 0x6a96652d => 69
	i32 1793755602, ; 107: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 108: Xamarin.AndroidX.Loader => 0x6bcd3296 => 74
	i32 1813058853, ; 109: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 85
	i32 1813201214, ; 110: Xamarin.Google.Android.Material => 0x6c13413e => 84
	i32 1818569960, ; 111: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 78
	i32 1828688058, ; 112: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 49
	i32 1842015223, ; 113: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 114: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 115: System.Linq.Expressions => 0x6ec71a65 => 99
	i32 1875935024, ; 116: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 117: System.Collections.NonGeneric.dll => 0x71dc7c8b => 89
	i32 1939592360, ; 118: System.Private.Xml.Linq => 0x739bd4a8 => 108
	i32 1968388702, ; 119: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 39
	i32 2003115576, ; 120: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 121: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 72
	i32 2025202353, ; 122: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 123: System.Private.Xml => 0x79eb68ee => 109
	i32 2055257422, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 71
	i32 2066184531, ; 125: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2072397586, ; 126: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 46
	i32 2079903147, ; 127: System.Runtime.dll => 0x7bf8cdab => 112
	i32 2090596640, ; 128: System.Numerics.Vectors => 0x7c9bf920 => 105
	i32 2127167465, ; 129: System.Console => 0x7ec9ffe9 => 94
	i32 2159891885, ; 130: Microsoft.Maui => 0x80bd55ad => 55
	i32 2169148018, ; 131: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 132: Microsoft.Extensions.Options.dll => 0x820d22b3 => 50
	i32 2192057212, ; 133: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 49
	i32 2193016926, ; 134: System.ObjectModel.dll => 0x82b6c85e => 106
	i32 2201107256, ; 135: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 86
	i32 2201231467, ; 136: System.Net.Http => 0x8334206b => 102
	i32 2207618523, ; 137: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 138: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 40
	i32 2270573516, ; 139: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 140: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 79
	i32 2303942373, ; 141: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 142: System.Private.CoreLib.dll => 0x896b7878 => 122
	i32 2353062107, ; 143: System.Net.Primitives => 0x8c40e0db => 103
	i32 2368005991, ; 144: System.Xml.ReaderWriter.dll => 0x8d24e767 => 120
	i32 2371007202, ; 145: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 39
	i32 2395872292, ; 146: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2411328690, ; 147: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 35
	i32 2427813419, ; 148: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 149: System.Console.dll => 0x912896e5 => 94
	i32 2442556106, ; 150: Microsoft.JSInterop.dll => 0x919672ca => 52
	i32 2475788418, ; 151: Java.Interop.dll => 0x93918882 => 123
	i32 2480646305, ; 152: Microsoft.Maui.Controls => 0x93dba8a1 => 53
	i32 2550873716, ; 153: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 154: System.Text.Encodings.Web => 0x9930ee42 => 114
	i32 2592341985, ; 155: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 43
	i32 2593496499, ; 156: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 157: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 86
	i32 2617129537, ; 158: System.Private.Xml.dll => 0x9bfe3a41 => 109
	i32 2620871830, ; 159: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 66
	i32 2626831493, ; 160: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 161: System.Runtime.Loader => 0x9ec4cf01 => 111
	i32 2692077919, ; 162: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 37
	i32 2732626843, ; 163: Xamarin.AndroidX.Activity => 0xa2e0939b => 59
	i32 2737747696, ; 164: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 61
	i32 2752995522, ; 165: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 166: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 54
	i32 2764765095, ; 167: Microsoft.Maui.dll => 0xa4caf7a7 => 55
	i32 2778768386, ; 168: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 82
	i32 2785988530, ; 169: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 170: Microsoft.Maui.Graphics => 0xa7008e0b => 57
	i32 2806116107, ; 171: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 172: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 64
	i32 2831556043, ; 173: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 174: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 82
	i32 2861189240, ; 175: Microsoft.Maui.Essentials => 0xaa8a4878 => 56
	i32 2892341533, ; 176: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 36
	i32 2909740682, ; 177: System.Private.CoreLib => 0xad6f1e8a => 122
	i32 2911054922, ; 178: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 46
	i32 2916838712, ; 179: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 83
	i32 2919462931, ; 180: System.Numerics.Vectors.dll => 0xae037813 => 105
	i32 2959614098, ; 181: System.ComponentModel.dll => 0xb0682092 => 93
	i32 2978675010, ; 182: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 68
	i32 3038032645, ; 183: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 184: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 75
	i32 3059408633, ; 185: Mono.Android.Runtime => 0xb65adef9 => 124
	i32 3059793426, ; 186: System.ComponentModel.Primitives => 0xb660be12 => 91
	i32 3077302341, ; 187: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 188: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 76
	i32 3215883813, ; 189: app_impresora => 0xbfae7e25 => 87
	i32 3220365878, ; 190: System.Threading => 0xbff2e236 => 118
	i32 3258312781, ; 191: Xamarin.AndroidX.CardView => 0xc235e84d => 62
	i32 3305363605, ; 192: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 193: System.Net.Requests.dll => 0xc5b097e4 => 104
	i32 3317135071, ; 194: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 67
	i32 3346324047, ; 195: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 77
	i32 3357674450, ; 196: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 197: System.Text.Json => 0xc82afec1 => 115
	i32 3362522851, ; 198: Xamarin.AndroidX.Core => 0xc86c06e3 => 65
	i32 3366347497, ; 199: Java.Interop => 0xc8a662e9 => 123
	i32 3374999561, ; 200: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 79
	i32 3381016424, ; 201: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3406629867, ; 202: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 44
	i32 3428513518, ; 203: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 41
	i32 3463511458, ; 204: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 205: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 92
	i32 3476120550, ; 206: Mono.Android => 0xcf3163e6 => 125
	i32 3479583265, ; 207: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 208: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 209: System.Text.Json.dll => 0xcfbaacae => 115
	i32 3500000672, ; 210: Microsoft.JSInterop => 0xd09dc5a0 => 52
	i32 3509114376, ; 211: System.Xml.Linq => 0xd128d608 => 119
	i32 3580758918, ; 212: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 213: System.Linq.dll => 0xd715a361 => 100
	i32 3641597786, ; 214: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 71
	i32 3643446276, ; 215: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 216: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 76
	i32 3657292374, ; 217: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 40
	i32 3672681054, ; 218: Mono.Android.dll => 0xdae8aa5e => 125
	i32 3697841164, ; 219: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 220: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 75
	i32 3748608112, ; 221: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 95
	i32 3786282454, ; 222: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 63
	i32 3792276235, ; 223: System.Collections.NonGeneric => 0xe2098b0b => 89
	i32 3823082795, ; 224: System.Security.Cryptography.dll => 0xe3df9d2b => 113
	i32 3841636137, ; 225: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 42
	i32 3849253459, ; 226: System.Runtime.InteropServices.dll => 0xe56ef253 => 110
	i32 3889960447, ; 227: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 228: System.Collections.Concurrent.dll => 0xe839deed => 88
	i32 3896760992, ; 229: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 65
	i32 3928044579, ; 230: System.Xml.ReaderWriter => 0xea213423 => 120
	i32 3931092270, ; 231: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 78
	i32 3955647286, ; 232: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 60
	i32 3980434154, ; 233: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 234: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 235: System.Memory => 0xeff49a63 => 101
	i32 4046471985, ; 236: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 54
	i32 4068434129, ; 237: System.Private.Xml.Linq.dll => 0xf27f60d1 => 108
	i32 4073602200, ; 238: System.Threading.dll => 0xf2ce3c98 => 118
	i32 4094352644, ; 239: Microsoft.Maui.Essentials.dll => 0xf40add04 => 56
	i32 4100113165, ; 240: System.Private.Uri => 0xf462c30d => 107
	i32 4102112229, ; 241: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 242: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 243: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 41
	i32 4127667938, ; 244: System.IO.FileSystem.Watcher => 0xf60736e2 => 98
	i32 4150914736, ; 245: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4164802419, ; 246: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 98
	i32 4182413190, ; 247: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 73
	i32 4213026141, ; 248: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 95
	i32 4271975918, ; 249: Microsoft.Maui.Controls.dll => 0xfea12dee => 53
	i32 4292120959, ; 250: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 73
	i32 4294648842 ; 251: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 45
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [252 x i32] [
	i32 117, ; 0
	i32 33, ; 1
	i32 57, ; 2
	i32 110, ; 3
	i32 63, ; 4
	i32 81, ; 5
	i32 30, ; 6
	i32 31, ; 7
	i32 93, ; 8
	i32 35, ; 9
	i32 58, ; 10
	i32 2, ; 11
	i32 30, ; 12
	i32 59, ; 13
	i32 15, ; 14
	i32 70, ; 15
	i32 14, ; 16
	i32 117, ; 17
	i32 101, ; 18
	i32 34, ; 19
	i32 26, ; 20
	i32 90, ; 21
	i32 69, ; 22
	i32 121, ; 23
	i32 106, ; 24
	i32 13, ; 25
	i32 7, ; 26
	i32 51, ; 27
	i32 48, ; 28
	i32 45, ; 29
	i32 21, ; 30
	i32 67, ; 31
	i32 19, ; 32
	i32 114, ; 33
	i32 88, ; 34
	i32 1, ; 35
	i32 119, ; 36
	i32 16, ; 37
	i32 4, ; 38
	i32 111, ; 39
	i32 104, ; 40
	i32 97, ; 41
	i32 25, ; 42
	i32 50, ; 43
	i32 38, ; 44
	i32 107, ; 45
	i32 96, ; 46
	i32 58, ; 47
	i32 91, ; 48
	i32 28, ; 49
	i32 70, ; 50
	i32 90, ; 51
	i32 47, ; 52
	i32 80, ; 53
	i32 42, ; 54
	i32 3, ; 55
	i32 60, ; 56
	i32 99, ; 57
	i32 72, ; 58
	i32 92, ; 59
	i32 85, ; 60
	i32 121, ; 61
	i32 16, ; 62
	i32 22, ; 63
	i32 43, ; 64
	i32 77, ; 65
	i32 20, ; 66
	i32 18, ; 67
	i32 2, ; 68
	i32 68, ; 69
	i32 100, ; 70
	i32 32, ; 71
	i32 80, ; 72
	i32 64, ; 73
	i32 0, ; 74
	i32 44, ; 75
	i32 6, ; 76
	i32 97, ; 77
	i32 61, ; 78
	i32 51, ; 79
	i32 96, ; 80
	i32 10, ; 81
	i32 5, ; 82
	i32 47, ; 83
	i32 116, ; 84
	i32 38, ; 85
	i32 25, ; 86
	i32 74, ; 87
	i32 83, ; 88
	i32 66, ; 89
	i32 102, ; 90
	i32 116, ; 91
	i32 37, ; 92
	i32 112, ; 93
	i32 84, ; 94
	i32 103, ; 95
	i32 113, ; 96
	i32 62, ; 97
	i32 23, ; 98
	i32 1, ; 99
	i32 36, ; 100
	i32 81, ; 101
	i32 48, ; 102
	i32 87, ; 103
	i32 124, ; 104
	i32 17, ; 105
	i32 69, ; 106
	i32 9, ; 107
	i32 74, ; 108
	i32 85, ; 109
	i32 84, ; 110
	i32 78, ; 111
	i32 49, ; 112
	i32 29, ; 113
	i32 26, ; 114
	i32 99, ; 115
	i32 8, ; 116
	i32 89, ; 117
	i32 108, ; 118
	i32 39, ; 119
	i32 5, ; 120
	i32 72, ; 121
	i32 0, ; 122
	i32 109, ; 123
	i32 71, ; 124
	i32 4, ; 125
	i32 46, ; 126
	i32 112, ; 127
	i32 105, ; 128
	i32 94, ; 129
	i32 55, ; 130
	i32 12, ; 131
	i32 50, ; 132
	i32 49, ; 133
	i32 106, ; 134
	i32 86, ; 135
	i32 102, ; 136
	i32 14, ; 137
	i32 40, ; 138
	i32 8, ; 139
	i32 79, ; 140
	i32 18, ; 141
	i32 122, ; 142
	i32 103, ; 143
	i32 120, ; 144
	i32 39, ; 145
	i32 13, ; 146
	i32 35, ; 147
	i32 10, ; 148
	i32 94, ; 149
	i32 52, ; 150
	i32 123, ; 151
	i32 53, ; 152
	i32 11, ; 153
	i32 114, ; 154
	i32 43, ; 155
	i32 20, ; 156
	i32 86, ; 157
	i32 109, ; 158
	i32 66, ; 159
	i32 15, ; 160
	i32 111, ; 161
	i32 37, ; 162
	i32 59, ; 163
	i32 61, ; 164
	i32 21, ; 165
	i32 54, ; 166
	i32 55, ; 167
	i32 82, ; 168
	i32 27, ; 169
	i32 57, ; 170
	i32 6, ; 171
	i32 64, ; 172
	i32 19, ; 173
	i32 82, ; 174
	i32 56, ; 175
	i32 36, ; 176
	i32 122, ; 177
	i32 46, ; 178
	i32 83, ; 179
	i32 105, ; 180
	i32 93, ; 181
	i32 68, ; 182
	i32 34, ; 183
	i32 75, ; 184
	i32 124, ; 185
	i32 91, ; 186
	i32 12, ; 187
	i32 76, ; 188
	i32 87, ; 189
	i32 118, ; 190
	i32 62, ; 191
	i32 7, ; 192
	i32 104, ; 193
	i32 67, ; 194
	i32 77, ; 195
	i32 24, ; 196
	i32 115, ; 197
	i32 65, ; 198
	i32 123, ; 199
	i32 79, ; 200
	i32 3, ; 201
	i32 44, ; 202
	i32 41, ; 203
	i32 11, ; 204
	i32 92, ; 205
	i32 125, ; 206
	i32 24, ; 207
	i32 23, ; 208
	i32 115, ; 209
	i32 52, ; 210
	i32 119, ; 211
	i32 31, ; 212
	i32 100, ; 213
	i32 71, ; 214
	i32 28, ; 215
	i32 76, ; 216
	i32 40, ; 217
	i32 125, ; 218
	i32 33, ; 219
	i32 75, ; 220
	i32 95, ; 221
	i32 63, ; 222
	i32 89, ; 223
	i32 113, ; 224
	i32 42, ; 225
	i32 110, ; 226
	i32 32, ; 227
	i32 88, ; 228
	i32 65, ; 229
	i32 120, ; 230
	i32 78, ; 231
	i32 60, ; 232
	i32 27, ; 233
	i32 9, ; 234
	i32 101, ; 235
	i32 54, ; 236
	i32 108, ; 237
	i32 118, ; 238
	i32 56, ; 239
	i32 107, ; 240
	i32 22, ; 241
	i32 17, ; 242
	i32 41, ; 243
	i32 98, ; 244
	i32 29, ; 245
	i32 98, ; 246
	i32 73, ; 247
	i32 95, ; 248
	i32 53, ; 249
	i32 73, ; 250
	i32 45 ; 251
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
