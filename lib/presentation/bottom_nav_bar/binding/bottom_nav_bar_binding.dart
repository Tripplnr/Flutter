import 'package:get/get.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/hotel/controller/controller.dart';

import '../controller/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    print('Bindingkldasfjf');
    Get.put(BottomNavBarController());
    Get.put(HomeController());
    Get.put(HotelController());
    Get.put(DestinationController());
  }
}
