import 'package:get/get.dart';
import 'package:trippinr/presentation/search_tab_bar/controller/search_tab_bar_controller.dart';

class SearchTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchTabBarController());
  }
}
