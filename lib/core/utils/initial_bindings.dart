import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

import '../../presentation/splash/controller/splash_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(AuthController());
    Get.put(UserSessionController());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    // ====
    // Get.put(DestinationController());
    // // Get.put(HotelController(), permanent: false);
    // Get.lazyPut(() => HotelController());
    // Get.lazyPut(() => SearchTabBarController());
    //
    // Get.put(HomeController());
    // // Get.put(SearchTabBarController());
    // Get.put(SettingsController());
    Get.put(SplashController());
    Get.put(PersistentTabController());
    Get.put(BottomNavBarController());
  }
}
