import 'package:get/get.dart';

import '../controller/hotel_controller.dart';

class HotelBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HotelController());
  }
}
