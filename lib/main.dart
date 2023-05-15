import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';

import 'core/app_export.dart';

Future<void> _requestLocationPermission() async {
  final PermissionStatus permissionStatus = await Permission.location.request();
  if (permissionStatus == PermissionStatus.granted) {
    print("_requestLocationPermission Granted");
    _getCurrentLocation();
  } else if (permissionStatus == PermissionStatus.denied) {
    await Permission.location.request();
    _getCurrentLocation();
  } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
    await Permission.location.request();
    // openAppSettings();
    _getCurrentLocation();
  }
}

Future<void> _getCurrentLocation() async {
  var _controller = Get.put(AuthController());
  // Get.put(HomeController());

  final Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  _controller.latitude.value = position.latitude.toStringAsFixed(4);
  _controller.longitude.value = position.longitude.toStringAsFixed(4);

  print(position.longitude.toStringAsFixed(4));
  print(position.latitude.toStringAsFixed(4));
  print(_controller.latitude.value);

  // Get Currency
  // String countryCode = await Geocoder.local;
  List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemark[0];
  // await getCurrencyCode(place.isoCountryCode.toString());
  print("================== ${place.isoCountryCode}");
  print("================== ${place.locality} ${place.administrativeArea}");

  var countryCode = await getCurrencyCode(place.isoCountryCode.toString());
  print("==================>>> $countryCode");
  _controller.currencyCode.value = countryCode;
// print(place.);

// String localCurrencySymbol=await
}

getCurrencyCode(String isoCountryCode) async {
  final response = await http.get(Uri.parse('https://restcountries.com/v2/alpha/$isoCountryCode'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final currencyCode = data['currencies'][0]['code'];
    return currencyCode;
  } else {
    throw Exception('Failed to get currency code for $isoCountryCode');
  }
}

Future init() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  var userSession = Get.put(UserSessionController());
  await _requestLocationPermission();

  userSession.setCurrency("USD");
  await userSession.init();
  print(userSession.email);

  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return Scaffold(
  //     body: Container(
  //         color: Colors.green,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               details.exception.toString(),
  //               style: const TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 30,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ],
  //         )),
  //   );
  // };

  // Get.put(DestinationController());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

void main() async {
  init();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () =>
          WaterDropHeader(), // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
      footerBuilder: () => ClassicFooter(), // Configure default bottom indicator
      headerTriggerDistance: 80.0, // header trigger refresh trigger distance
      springDescription:
          SpringDescription(stiffness: 170, damping: 16, mass: 1.9), // custom spring back animate,the props meaning see the flutter api
      maxOverScrollExtent: 100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
      maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted:
          true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed: true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
      hideFooterWhenNotFull: false, // Disable pull-up to load more functionality when Viewport is less than one screen
      enableBallisticLoad: true, // tr
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            visualDensity: VisualDensity.standard,
          ),
          translations: AppLocalization(),
          locale: Get.deviceLocale, //for setting localization strings
          fallbackLocale: Locale('en', 'US'),
          title: 'TripPLNR',
          // home: BottomNavBar(),
          initialBinding: InitialBindings(),
          // initialRoute: AppRoutes.bottom_nav_bar,
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.pages,
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.copyWith(textScaleFactor: 1.0);
            // final scale = mediaQueryData.textScaleFactor.clamp(0.8, 0.9);
            // child = EasyLoading.init()(context, child);
            child = MediaQuery(
                // data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
                data: scale,
                child: child!);
            return child;
          }
          // home: LogoinPopup(),
          ),
    );
  }
}
// builder:(context,child){return MediaQuery(
//
// data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
// child: child);}
