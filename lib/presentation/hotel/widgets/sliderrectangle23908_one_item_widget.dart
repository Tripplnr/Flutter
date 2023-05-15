// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:trippinr/core/app_export.dart';

// import '../controller/hotel_controller.dart';
// import '../models/sliderrectangle23908_one_item_model.dart';

// // ignore: must_be_immutable
// class Sliderrectangle23908OneItemWidget extends StatelessWidget {
//   Sliderrectangle23908OneItemWidget(this.sliderrectangle23908OneItemModelObj);

//   Sliderrectangle23908OneItemModel sliderrectangle23908OneItemModelObj;

//   var controller = Get.find<HotelController>();

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Container(
//         padding: getPadding(
//           left: 12,
//           top: 11,
//           right: 12,
//           bottom: 11,
//         ),
//         decoration: AppDecoration.fillWhiteA700.copyWith(
//           borderRadius: BorderRadiusStyle.roundedBorder16,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CustomImageView(
//               imagePath: ImageConstant.imgRectangle23908130x311,
//               height: getVerticalSize(
//                 130.00,
//               ),
//               width: getHorizontalSize(
//                 311.00,
//               ),
//               radius: BorderRadius.circular(
//                 getHorizontalSize(
//                   16.00,
//                 ),
//               ),
//             ),
//             Container(
//               height: getVerticalSize(
//                 75.00,
//               ),
//               width: getHorizontalSize(
//                 237.00,
//               ),
//               margin: getMargin(
//                 top: 9,
//               ),
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "msg_hotel_sifat_international".tr,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.left,
//                           style: AppTextStyle.txtPoppinsBold18,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomImageView(
//                               svgPath: ImageConstant.imgLocation,
//                               height: getSize(
//                                 18.00,
//                               ),
//                               width: getSize(
//                                 18.00,
//                               ),
//                               margin: getMargin(
//                                 bottom: 1,
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 left: 6,
//                               ),
//                               child: Text(
//                                 "lbl_paris_france".tr,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppTextStyle.txtPoppinsMedium12,
//                               ),
//                             ),
//                             Container(
//                               height: getSize(
//                                 5.00,
//                               ),
//                               width: getSize(
//                                 5.00,
//                               ),
//                               margin: getMargin(
//                                 left: 10,
//                                 top: 6,
//                                 bottom: 7,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: ColorConstant.yellow900,
//                                 borderRadius: BorderRadius.circular(
//                                   getHorizontalSize(
//                                     2.00,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 left: 10,
//                                 top: 1,
//                               ),
//                               child: Text(
//                                 "lbl_4km_away".tr,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppTextStyle.txtPoppinsMedium12Gray700,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: getPadding(
//                             top: 4,
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: getPadding(
//                                   bottom: 2,
//                                 ),
//                                 child: Text(
//                                   "lbl_6_5".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppTextStyle
//                                       .txtPoppinsSemiBold14Gray90001,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: getPadding(
//                                   left: 4,
//                                   top: 2,
//                                   bottom: 3,
//                                 ),
//                                 child: Text(
//                                   "lbl_good".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppTextStyle.txtPoppinsRegular12,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: getPadding(
//                                   left: 12,
//                                 ),
//                                 child: RatingBar.builder(
//                                   initialRating: 0,
//                                   minRating: 0,
//                                   direction: Axis.horizontal,
//                                   allowHalfRating: false,
//                                   itemSize: getVerticalSize(
//                                     24.00,
//                                   ),
//                                   itemCount: 5,
//                                   updateOnDrag: true,
//                                   onRatingUpdate: (rating) {},
//                                   itemBuilder: (context, _) {
//                                     return Icon(
//                                       Icons.star,
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Container(
//                       margin: getMargin(
//                         left: 73,
//                         top: 28,
//                         bottom: 6,
//                       ),
//                       padding: getPadding(
//                         left: 13,
//                         top: 8,
//                         right: 13,
//                         bottom: 8,
//                       ),
//                       decoration: AppDecoration.outlineYellow900.copyWith(
//                         borderRadius: BorderRadiusStyle.roundedBorder20,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CustomImageView(
//                             svgPath: ImageConstant.imgLocationWhiteA700,
//                             height: getSize(
//                               20.00,
//                             ),
//                             width: getSize(
//                               20.00,
//                             ),
//                             margin: getMargin(
//                               top: 1,
//                               bottom: 1,
//                             ),
//                           ),
//                           Padding(
//                             padding: getPadding(
//                               left: 5,
//                               top: 2,
//                             ),
//                             child: Text(
//                               "lbl_map".tr,
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.left,
//                               style: AppTextStyle.txtPoppinsMedium14WhiteA700,
//                             ),
//                           ),
//                           Container(
//                             height: getVerticalSize(
//                               12.00,
//                             ),
//                             width: getHorizontalSize(
//                               1.00,
//                             ),
//                             margin: getMargin(
//                               left: 10,
//                               top: 5,
//                               bottom: 5,
//                             ),
//                             decoration: BoxDecoration(
//                               color: ColorConstant.blueGray10001,
//                             ),
//                           ),
//                           CustomImageView(
//                             svgPath: ImageConstant.imgFilter,
//                             height: getSize(
//                               20.00,
//                             ),
//                             width: getSize(
//                               20.00,
//                             ),
//                             margin: getMargin(
//                               left: 10,
//                               top: 1,
//                               bottom: 1,
//                             ),
//                           ),
//                           Padding(
//                             padding: getPadding(
//                               left: 5,
//                               right: 3,
//                               bottom: 2,
//                             ),
//                             child: Text(
//                               "lbl_filter".tr,
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.left,
//                               style: AppTextStyle.txtPoppinsMedium14WhiteA700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: getVerticalSize(
//                 1.00,
//               ),
//               width: getHorizontalSize(
//                 311.00,
//               ),
//               margin: getMargin(
//                 top: 6,
//               ),
//               decoration: BoxDecoration(
//                 color: ColorConstant.gray200,
//               ),
//             ),
//             Padding(
//               padding: getPadding(
//                 top: 6,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "lbl_au_114".tr,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppTextStyle.txtPoppinsSemiBold18Blue700,
//                       ),
//                       Text(
//                         "lbl_per_night_on".tr,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppTextStyle.txtPoppinsMedium12Gray50001,
//                       ),
//                     ],
//                   ),
//                   Container(
//                     margin: getMargin(
//                       bottom: 1,
//                     ),
//                     padding: getPadding(
//                       left: 16,
//                       top: 9,
//                       right: 16,
//                       bottom: 9,
//                     ),
//                     decoration: AppDecoration.fillYellow900.copyWith(
//                       borderRadius: BorderRadiusStyle.circleBorder9,
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: getPadding(
//                             bottom: 1,
//                           ),
//                           child: Text(
//                             "lbl_view_deal".tr,
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: AppTextStyle.txtPoppinsMedium14WhiteA700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
