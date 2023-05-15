import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/favourite/favourite.dart';
import 'package:trippinr/presentation/home/home.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';

import '../../settings/settings.dart';

class BottomNavBarController extends GetxController {
  // var indexController = HomeController();
  var _userSessionController = UserSessionController();
  var initialIndex = 0.obs;
  // final PersistentTabController controlle =
  //     PersistentTabController(initialIndex: initialIndex.value);
  var hotelController = Get.lazyPut(() => HotelController());
  // final PersistentTabController _controller =
  //     Get.put(PersistentTabController(initialIndex: 0));
  List<Widget> screenList = [
    Home(),
    // Hotel(),

    SearchTabBar(),
    // UserSessionController().isLogin == true
    //     ?
    Favourite(),
    //     :
    // Container(
    //     height: size.height,
    //     width: size.width,
    //     color: Colors.transparent,
    //     child: BackdropFilter(
    //       filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
    //       child: Container(
    //         height: size.height,
    //         width: size.width,
    //       ),
    //     )),
    Settings(),
    // Center(
    //   child: Text("Account",
    //       overflow: TextOverflow.ellipsis,
    //       textAlign: TextAlign.left,
    //       style: AppTextStyle.txtPoppinsMedium16),
    // )
  ];
  // var currentScreen = 0.obs;



  // ListQueue navigationQueue = ListQueue();
  @override
  void onInit() {
// TODO: implement onInit
// Get.put(RoomSearchController());
// Get.put(FilterController());
    Get.lazyPut(() => HotelController());
    // _controller;
    super.onInit();
  }
}
