// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import 'package:trippinr/core/app_export.dart';
// import 'package:trippinr/presentation/settings/privacy_policy.dart';
// import 'package:trippinr/presentation/settings/term_of_use.dart';

// class LegalInformation extends GetWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Scaffold(
//         backgroundColor: ColorConstant.gray100,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               color: ColorConstant.yellow900,
//               height: getVerticalSize(100.00),
//               child: SafeArea(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Container(
//                     // margin: getMargin(left: 20),
//                     // ),
//                     Container(
//                       margin: getMargin(left: 20),
//                       height: 34,
//                       width: 34,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Color(0xFFFFA254)),
//                       child: AppbarImage(
//                           height: 20.00,
//                           width: 20.00,
//                           svgPath: ImageConstant.imgArrowleft,
//                           color: ColorConstant.whiteA700,
//                           // margin: getMargin(
//                           //   left: 20,
//                           // ),
//                           onTap: () {
//                             // Get.back(canPop: true);
//                             Navigator.pop(context);
//                           }),
//                     ),
//                     AppbarSubtitle(
//                         margin: getMargin(right: 0),
//                         text: "Legal Information".tr),
//                     Container(
//                       margin: getMargin(right: 20),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: 5,
//             ),
//             InkWell(
//               onTap: () {
//                 PersistentNavBarNavigator.pushNewScreen(
//                   context,
//                   screen: TermOfUse(),
//                   withNavBar: true, // OPTIONAL VALUE. True by default.
//                   pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                 );
//               },
//               child: Container(
//                 padding: getPadding(left: 18, top: 19, right: 18, bottom: 19),
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Padding(
//                       padding: getPadding(left: 6),
//                       child: Text("Term of use".tr,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.left,
//                           style: AppTextStyle.txtPoppinsRegular18)),
//                   Spacer(),
//                   CustomImageView(
//                       svgPath: ImageConstant.imgArrowrightGray60001,
//                       // color: ColorConstant.yellow900,
//                       height: getSize(24.00),
//                       width: getSize(24.00))
//                 ]),
//               ),
//             ),
//             Container(
//                 width: size.width,
//                 height: 1,
//                 margin: getMargin(
//                   left: 18,
//                   right: 18,
//                 ),
//                 decoration: BoxDecoration(color: ColorConstant.gray200)),
//             InkWell(
//               onTap: () {
//                 // _onShare(context);
//                 PersistentNavBarNavigator.pushNewScreen(
//                   context,
//                   screen: PrivacyPolicy(),
//                   withNavBar: true, // OPTIONAL VALUE. True by default.
//                   pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                 );
//               },
//               child: Container(
//                 padding: getPadding(left: 18, top: 19, right: 18, bottom: 19),
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Padding(
//                       padding: getPadding(left: 6),
//                       child: Text("Privacy Policy".tr,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.left,
//                           style: AppTextStyle.txtPoppinsRegular18)),
//                   Spacer(),
//                   CustomImageView(
//                       svgPath: ImageConstant.imgArrowrightGray60001,
//                       // color: ColorConstant.yellow900,
//                       height: getSize(24.00),
//                       width: getSize(24.00))
//                 ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
