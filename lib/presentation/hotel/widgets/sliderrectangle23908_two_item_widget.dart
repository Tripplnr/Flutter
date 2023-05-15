// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:trippinr/core/app_export.dart';

// import '../controller/hotel_controller.dart';
// import '../models/sliderrectangle23908_two_item_model.dart';

// // ignore: must_be_immutable
// class Sliderrectangle23908TwoItemWidget extends StatelessWidget {
//   Sliderrectangle23908TwoItemWidget(this.sliderrectangle23908TwoItemModelObj);

//   Sliderrectangle23908TwoItemModel sliderrectangle23908TwoItemModelObj;

//   var controller = Get.find<HotelController>();

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         elevation: 0,
//         margin: EdgeInsets.all(0),
//         color: ColorConstant.whiteA700,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadiusStyle.roundedBorder16,
//         ),
//         child: Container(
//           height: getVerticalSize(
//             295.00,
//           ),
//           width: getHorizontalSize(
//             335.00,
//           ),
//           padding: getPadding(
//             left: 7,
//             top: 12,
//             right: 7,
//             bottom: 12,
//           ),
//           decoration: AppDecoration.fillWhiteA700.copyWith(
//             borderRadius: BorderRadiusStyle.roundedBorder16,
//           ),
//           child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               CustomImageView(
//                 imagePath: ImageConstant.imgRectangle23908130x311,
//                 height: getVerticalSize(
//                   130.00,
//                 ),
//                 width: getHorizontalSize(
//                   311.00,
//                 ),
//                 radius: BorderRadius.circular(
//                   getHorizontalSize(
//                     16.00,
//                   ),
//                 ),
//                 alignment: Alignment.topCenter,
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: getPadding(
//                     left: 4,
//                     right: 4,
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "msg_hotel_sifat_international".tr,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppTextStyle.txtPoppinsBold18,
//                       ),
//                       Row(
//                         children: [
//                           CustomImageView(
//                             svgPath: ImageConstant.imgLocation,
//                             height: getSize(
//                               18.00,
//                             ),
//                             width: getSize(
//                               18.00,
//                             ),
//                           ),
//                           Padding(
//                             padding: getPadding(
//                               left: 6,
//                             ),
//                             child: Text(
//                               "lbl_paris_france".tr,
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.left,
//                               style: AppTextStyle.txtPoppinsMedium12,
//                             ),
//                           ),
//                           Container(
//                             height: getSize(
//                               5.00,
//                             ),
//                             width: getSize(
//                               5.00,
//                             ),
//                             margin: getMargin(
//                               left: 10,
//                               top: 6,
//                               bottom: 6,
//                             ),
//                             decoration: BoxDecoration(
//                               color: ColorConstant.yellow900,
//                               borderRadius: BorderRadius.circular(
//                                 getHorizontalSize(
//                                   2.00,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: getPadding(
//                               left: 10,
//                             ),
//                             child: Text(
//                               "lbl_4km_away".tr,
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.left,
//                               style: AppTextStyle.txtPoppinsMedium12Gray700,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: getPadding(
//                           top: 6,
//                         ),
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: getPadding(
//                                 top: 1,
//                                 bottom: 1,
//                               ),
//                               child: Text(
//                                 "lbl_6_5".tr,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style:
//                                     AppTextStyle.txtPoppinsSemiBold14Gray90001,
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 left: 4,
//                                 top: 3,
//                                 bottom: 3,
//                               ),
//                               child: Text(
//                                 "lbl_good".tr,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppTextStyle.txtPoppinsRegular12,
//                               ),
//                             ),
//                             Padding(
//                               padding: getPadding(
//                                 left: 12,
//                               ),
//                               child: RatingBar.builder(
//                                 initialRating: 0,
//                                 minRating: 0,
//                                 direction: Axis.horizontal,
//                                 allowHalfRating: false,
//                                 itemSize: getVerticalSize(
//                                   24.00,
//                                 ),
//                                 itemCount: 5,
//                                 updateOnDrag: true,
//                                 onRatingUpdate: (rating) {},
//                                 itemBuilder: (context, _) {
//                                   return Icon(
//                                     Icons.star,
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: getVerticalSize(
//                           1.00,
//                         ),
//                         width: getHorizontalSize(
//                           311.00,
//                         ),
//                         margin: getMargin(
//                           top: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           color: ColorConstant.gray200,
//                         ),
//                       ),
//                       Padding(
//                         padding: getPadding(
//                           top: 6,
//                         ),
//                         child: Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "lbl_au_114".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style:
//                                       AppTextStyle.txtPoppinsSemiBold18Blue700,
//                                 ),
//                                 Text(
//                                   "lbl_per_night_on".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style:
//                                       AppTextStyle.txtPoppinsMedium12Gray50001,
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               margin: getMargin(
//                                 left: 142,
//                                 top: 1,
//                                 bottom: 1,
//                               ),
//                               padding: getPadding(
//                                 left: 16,
//                                 top: 10,
//                                 right: 16,
//                                 bottom: 10,
//                               ),
//                               decoration: AppDecoration.fillYellow900.copyWith(
//                                 borderRadius: BorderRadiusStyle.circleBorder9,
//                               ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "lbl_view_deal".tr,
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppTextStyle
//                                         .txtPoppinsMedium14WhiteA700,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Container(
//                   height: getVerticalSize(
//                     224.00,
//                   ),
//                   width: getHorizontalSize(
//                     310.00,
//                   ),
//                   margin: getMargin(
//                     top: 14,
//                   ),
//                   decoration: BoxDecoration(
//                     color: ColorConstant.blueGray10001,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
