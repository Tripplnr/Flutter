// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:trippinr/core/app_export.dart';

// import '../controller/hotel_controller.dart';
// import '../models/sliderrectangle23908_item_model.dart';

// // ignore: must_be_immutable
// class Sliderrectangle23908ItemWidget extends StatelessWidget {
//   Sliderrectangle23908ItemWidget(this.sliderrectangle23908ItemModelObj);

//   Sliderrectangle23908ItemModel sliderrectangle23908ItemModelObj;

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
//               imagePath: ImageConstant.imgRectangle23908,
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
//             Padding(
//               padding: getPadding(
//                 top: 11,
//               ),
//               child: Text(
//                 "msg_capital_o_hotel".tr,
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.left,
//                 style: AppTextStyle.txtPoppinsBold18,
//               ),
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomImageView(
//                   svgPath: ImageConstant.imgLocation,
//                   height: getSize(
//                     18.00,
//                   ),
//                   width: getSize(
//                     18.00,
//                   ),
//                   margin: getMargin(
//                     bottom: 1,
//                   ),
//                 ),
//                 Padding(
//                   padding: getPadding(
//                     left: 6,
//                   ),
//                   child: Text(
//                     "lbl_milan_italy".tr,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: AppTextStyle.txtPoppinsMedium12,
//                   ),
//                 ),
//                 Container(
//                   height: getSize(
//                     5.00,
//                   ),
//                   width: getSize(
//                     5.00,
//                   ),
//                   margin: getMargin(
//                     left: 10,
//                     top: 6,
//                     bottom: 7,
//                   ),
//                   decoration: BoxDecoration(
//                     color: ColorConstant.yellow900,
//                     borderRadius: BorderRadius.circular(
//                       getHorizontalSize(
//                         2.00,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: getPadding(
//                     left: 10,
//                     top: 1,
//                   ),
//                   child: Text(
//                     "lbl_4km_away".tr,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: AppTextStyle.txtPoppinsMedium12Gray700,
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: getPadding(
//                 top: 4,
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: getPadding(
//                       bottom: 2,
//                     ),
//                     child: Text(
//                       "lbl_6_5".tr,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.left,
//                       style: AppTextStyle.txtPoppinsSemiBold14Gray90001,
//                     ),
//                   ),
//                   Padding(
//                     padding: getPadding(
//                       left: 4,
//                       top: 2,
//                       bottom: 3,
//                     ),
//                     child: Text(
//                       "lbl_good".tr,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.left,
//                       style: AppTextStyle.txtPoppinsRegular12,
//                     ),
//                   ),
//                   Padding(
//                     padding: getPadding(
//                       left: 12,
//                     ),
//                     child: RatingBar.builder(
//                       initialRating: 0,
//                       minRating: 0,
//                       direction: Axis.horizontal,
//                       allowHalfRating: false,
//                       itemSize: getVerticalSize(
//                         24.00,
//                       ),
//                       itemCount: 5,
//                       updateOnDrag: true,
//                       onRatingUpdate: (rating) {},
//                       itemBuilder: (context, _) {
//                         return Icon(
//                           Icons.star,
//                         );
//                       },
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
//                         style: AppTextStyle.txtPoppinsSemiBold18Blue600,
//                       ),
//                       Text(
//                         "lbl_per_night_on".tr,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppTextStyle.txtPoppinsMedium12Gray50001,
//                       ),
//                     ],
//                   ),
//                   CustomButton(
//                     height: 41,
//                     width: 99,
//                     text: "lbl_view_deal".tr,
//                     margin: getMargin(
//                       bottom: 1,
//                     ),
//                     padding: ButtonPadding.PaddingAll9,
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
