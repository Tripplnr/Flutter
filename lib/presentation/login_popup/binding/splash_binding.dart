import 'package:get/get.dart';

import '../controller/login_popup_controller.dart';

class LogoinPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoinPopupController());
  }
}
