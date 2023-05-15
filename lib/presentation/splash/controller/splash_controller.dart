import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';

class SplashController extends GetxController {
  RxBool googleSignedInLogin = false.obs;
  UserSessionController _userSessionController = Get.find();

  @override
  void onReady() {
    super.onReady();
    splashInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // var homeRepository = HomeRepository();
  Future<void> splashInit() async {
    final _authController = Get.find<AuthController>();
    final _blogController = Get.put(BlogsController());
    await Future.delayed(Duration(seconds: 4));
// UserSessionController().token ==null&& UserSessionController().token==""?_blogController.getBlog()
    // SharedPref.getAuthToken().then((token) {

    //   _blogController.getBlog();
    if (_userSessionController.token == null ||
        _userSessionController.token == "") {
      _authController.isLoggedIn(false);
      Get.toNamed(AppRoutes.bottom_nav_bar);
    } else {
      /*  homeRepository.fetchPopularHotels().then((value) {
              if (value) {
                Get.toNamed(AppRoutes.bottom_nav_bar);
              }
              print("=>$value");

            });*/
      print("First Name ${_userSessionController.token}");
      _authController.isLoggedIn(true);
      _blogController.getBlog(token: _userSessionController.token);

      Get.toNamed(AppRoutes.bottom_nav_bar);
    }
    // });
  }
}
