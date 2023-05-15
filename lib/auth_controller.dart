import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AuthController extends GetxController {
  late final Completer<GoogleMapController> controller;
  @override
  void onInit() {
    // TODO: implement onInit
    controller = Completer<GoogleMapController>();
    // refreshController;
    super.onInit();
  }

  var isLoggedIn = false.obs;

  var isLoggedInSocial = false.obs;
  var latitude = "".obs;
  var longitude = "".obs;
  var currencyCode = "".obs;
  var token = "".obs;
  var logoutLoader = false.obs;
}
