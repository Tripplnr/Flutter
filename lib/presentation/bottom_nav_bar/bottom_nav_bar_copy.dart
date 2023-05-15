// // ignore_for_file: must_be_immutable
//
// import 'package:trippinr/core/app_export.dart';
// import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
//
// import 'controller/bottom_nav_bar_controller.dart';
//
// class BottomNavBar extends GetWidget<BottomNavBarController> {
//   BottomNavBarHelperMethods _bottomNavBarHelperMethods =
//       BottomNavBarHelperMethods();
//   var index;
//   BottomNavBar({Key? key, this.index}) : super(key: key);
//
//   List navBarIcons = [
//     ImageConstant.imgHomeGray60001,
//     ImageConstant.imgSearch,
//     ImageConstant.imgFavoriteGray6000124x24,
//     ImageConstant.imgUser,
//   ];
//   List navBarIconsActive = [
//     ImageConstant.homeFilled,
//     ImageConstant.searchFilled,
//     ImageConstant.heartFilled,
//     ImageConstant.accountFilled,
//   ];
//
//   List navBarLabel = [
//     "lbl_home".tr,
//     "lbl_search".tr,
//     "lbl_favorites".tr,
//     "lbl_account".tr,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Obx(() {
//         return WillPopScope(
//             onWillPop: () async {
//               if (controller.navigationQueue.isEmpty) {
//                 return _bottomNavBarHelperMethods.showExitPopUp();
//               }
//               controller.navigationQueue.removeLast();
//               int position = controller.navigationQueue.isEmpty
//                   ? 0
//                   : controller.navigationQueue.last;
//               controller.currentScreen.value = position;
//               return false;
//             },
//             child: Scaffold(
//               backgroundColor: ColorConstant.gray50,
//               body: Center(
//                 child: controller.screenList[controller.currentScreen.value],
//               ),
//               bottomNavigationBar: SizedBox(
//                 // height: SizedBoxConstant.bottomNavBarHeight,
//                 child: BottomNavigationBar(
//                   currentIndex: controller.currentScreen.value,
//                   onTap: (index) {
//                     print(
//                         'Cuurent Screen ==> ${controller.currentScreen.value}');
//                     if (index != controller.currentScreen.value) {
//                       controller.navigationQueue
//                           .removeWhere((element) => element == index);
//                       controller.navigationQueue.addLast(index);
//                       print('Test $index');
//                       if (index == 2) {
//                         controller.currentScreen.value = 2;
//                         Future.delayed(Duration(seconds: 3), () async {
//                           await _bottomNavBarHelperMethods.loginPopUp();
//                         });
//                         // Future.delayed(Duration(seconds: 1), () async {
//                         //   // controller.currentScreen.value = 0;
//                         // });
//                       } else {
//                         controller.currentScreen.value = index;
//                       }
//                       print("Test");
//                       // controller.currentScreen.value = index;
//                     } else {}
//                     // if (controller.indexController.selectedIndex == 1) {
//                     //   controller.currentScreen.value ==
//                     //       controller.indexController.selectedIndex.value;
//                     // }
//                   },
//                   // unselectedItemColor: ColorConstant.grey,
//                   showUnselectedLabels: true,
//                   showSelectedLabels: true,
//                   selectedItemColor: ColorConstant.yellow900,
//                   elevation: 0,
//                   type: BottomNavigationBarType.fixed,
//                   iconSize: 24,
//                   // backgroundColor: ColorConstant.grey100,
//                   enableFeedback: true,
//                   items: List.generate(navBarIcons.length, (index) {
//                     return BottomNavigationBarItem(
//                       icon: CustomImageView(
//                         svgPath: navBarIcons[index],
//                         height: getSize(
//                           24.00,
//                         ),
//                         width: getSize(
//                           24.00,
//                         ),
//                         color: ColorConstant.gray60001,
//                       ),
//                       activeIcon: CustomImageView(
//                         imagePath: navBarIconsActive[index],
//                         height: getSize(
//                           24.00,
//                         ),
//                         width: getSize(
//                           24.00,
//                         ),
//                         color: ColorConstant.yellow900,
//                       ),
//                       label: navBarLabel[index],
//                     );
//                   }),
//                 ),
//               ),
//             ));
//       }),
//     );
//   }
// }
