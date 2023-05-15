import 'package:get/get.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';

class DestinationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DestinationController());
  }
}
