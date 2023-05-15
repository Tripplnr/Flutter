import 'package:trippinr/core/app_export.dart';

class SearchTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController =
      TabController(length: 2, initialIndex: 0, vsync: this);

  var index = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    tabController =
        TabController(vsync: this, length: 2, initialIndex: index.value);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
