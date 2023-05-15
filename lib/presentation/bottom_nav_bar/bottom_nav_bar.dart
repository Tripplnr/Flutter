// ignore_for_file: must_be_immutable

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/favourite/favourite.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/home/home.dart';
import 'package:trippinr/presentation/hotel/controller/controller.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';
import 'package:trippinr/presentation/settings/settings.dart';

import '../search_tab_bar/controller/search_tab_bar_controller.dart';
import 'controller/bottom_nav_bar_controller.dart';

class BottomNavBar extends StatefulWidget {
  var index;

  BottomNavBar({Key? key, this.index}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    print("kjafshdlkajhssk");
    Get.put(DestinationController());

    Get.put(HomeController());
    Get.put(HotelController());
  }

  var controller = Get.put(BottomNavBarController());

  BottomNavBarHelperMethods _bottomNavBarHelperMethods =
      BottomNavBarHelperMethods();

  List navBarIcons = [
    ImageConstant.imgHomeGray60001,
    ImageConstant.imgSearch,
    ImageConstant.imgFavoriteGray6000124x24,
    ImageConstant.imgUser,
  ];

  List navBarIconsActive = [
    ImageConstant.homeFilled,
    ImageConstant.searchFilled,
    ImageConstant.heartFilled,
    ImageConstant.accountFilled,
  ];

  List navBarLabel = [
    "lbl_home".tr,
    "lbl_search".tr,
    "lbl_favorites".tr,
    "lbl_account".tr,
  ];

  @override
  Widget build(BuildContext context) {
    final PersistentTabController _controller =
        PersistentTabController(initialIndex: controller.initialIndex.value);
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          // MaterialApp(
          // backgroundColor: ColorConstant.gray50,
          body: Obx(
        () => WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: PersistentTabView(
            context,
            // onWillPop: (_) async {
            //   return false;
            // },
            controller: _controller,
            items: _navBarsItems(),
            screens: _buildScreens(),
            confineInSafeArea: true,

            // padding: NavBarPadding.all(0),
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            padding: NavBarPadding.only(bottom: 5, top: 8),
            navBarHeight: 65,
            popAllScreensOnTapAnyTabs: true,
            decoration: NavBarDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            onItemSelected: (index) async {
              print('Cuurent Index ==> $index');
              if (index == 1) {
                final _controller = await Get.put(SearchTabBarController());
                _controller.tabController.index = 0;
                _controller.index.value = 0;
                print(_controller.tabController.index);
                print("==>> ${_controller.index.value}");
              }
            },
            navBarStyle: NavBarStyle.simple,
          ),
        ),
      )

          // body: Center(
          //   child: controller.screenList[controller.currentScreen.value],
          // ),
          ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final authController = Get.find<AuthController>();
    return authController.isLoggedIn.value
        ? [
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgHomeGray60001,
                height: 28,
                width: 28,
              ),
              icon: CustomImageView(
                svgPath: ImageConstant.active_home,
                height: 28,
                width: 28,
                color: ColorConstant.yellow900,
              ),
              title: "lbl_home".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: ColorConstant.gray700,
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgSearch,
                height: 28,
                width: 28,
              ),
              icon: CustomImageView(
                svgPath: ImageConstant.active_search,
                height: 28,
                width: 28,
                color: ColorConstant.yellow900,
              ),
              title: "lbl_search".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: ColorConstant.gray700,
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgFavoriteGray6000124x24,
                height: 28,
                width: 28,
              ),
              icon: CustomImageView(
                svgPath: ImageConstant.active_fav,
                height: 28,
                width: 28,
                color: ColorConstant.yellow900,
              ),
              title: "lbl_favorites".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: ColorConstant.gray700,
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgUser,
                height: 28,
                width: 28,
              ),
              icon: CustomImageView(
                svgPath: ImageConstant.active_account,
                height: 28,
                width: 28,
                color: ColorConstant.yellow900,
              ),
              title: "lbl_account".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: ColorConstant.gray700,
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ]
        : [
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgHomeGray60001,
                height: 28,
                width: 28,
              ),
              icon: CustomImageView(
                svgPath: ImageConstant.active_home,
                height: 28,
                width: 28,
                color: ColorConstant.yellow900,
              ),
              // contentPadding: 0,

              title: "lbl_home".tr,
              contentPadding: 1,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: ColorConstant.gray700,
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: SizedBox(
                height: 28,
                width: 28,
                child: CustomImageView(
                  svgPath: ImageConstant.imgSearch,
                ),
              ),
              icon: CustomImageView(
                svgPath: ImageConstant.active_search,
                height: 28,
                width: 28,
                color: ColorConstant.yellow900,
              ),
              title: "lbl_search".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: ColorConstant.gray700,
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            PersistentBottomNavBarItem(
              inactiveIcon: CustomImageView(
                svgPath: ImageConstant.imgUser,
                height: 28,
                width: 28,
              ),
              icon: CustomImageView(
                svgPath: ImageConstant.active_account,
                height: 28,
                width: 28,
                color: ColorConstant.yellow900,
              ),
              title: "lbl_account".tr,
              activeColorPrimary: ColorConstant.yellow900,
              inactiveColorPrimary: ColorConstant.gray700,
              textStyle: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ];
  }

  List<Widget> _buildScreens() {
    final authController = Get.find<AuthController>();
    return authController.isLoggedIn.value
        ? [
            Home(),
            SearchTabBar(),
            Favourite(),
            Settings(),
          ]
        : [
            Home(),
            SearchTabBar(),
            Settings(),
          ];
  }
}
