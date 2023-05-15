
// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:trippinr/core/app_export.dart';
// import 'package:trippinr/presentation/destination/repository/repository.dart';
// import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

// import 'hotel_details.dart';

// export 'package:flutter_html/src/style/fontsize.dart';

// // ignore_for_file: must_be_immutable
// class HotelDealsPage extends GetView<HotelController> {
//   String? callFrom;
//   var controllerr, checkIn, checkOut, address, price, distance;

//   String? adultCount, roomCount, url, startDate, endDate, urgencyMessage, unitConfiguration;

//   HotelDealsPage({
//     this.url,
//     this.price,
//     this.urgencyMessage,
//     this.unitConfiguration,
//     required this.callFrom,
//     required this.distance,
//     this.roomCount,
//     this.adultCount,
//     this.startDate,
//     this.endDate,
//     this.controllerr,
//     required this.address,
//     required this.checkIn,
//     required this.checkOut,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: size.width,
//       height: size.height,
//       child: SingleChildScrollView(
//         // physics: NeverScrollableScrollPhysics(),
//         child: Container(
//           width: size.width,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text("msg_our_recommended".tr,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.left,
//                   style: AppTextStyle.txtPoppinsSemiBold16Black900),
//               ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   // physics: AlwaysScrollableScrollPhysics(),
//                   // physics: ScrollPhysics(),
//                   shrinkWrap: true,
//                   padding: EdgeInsets.zero,
//                   scrollDirection: Axis.vertical,
//                   itemCount: controller.hotelRooms.take(5).length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                         onTap: () {
//                           DestinationRepository().openViewDealsBottomSheet(context, url: url);
//                         },
//                         child: Container(
//                             // height: getVerticalSize(93),
//                             margin: getMargin(top: 9),
//                             padding: getPadding(all: 10),
//                             decoration: AppDecoration.outlineLightblue100
//                                 .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
//                             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//                               Expanded(
//                                 child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("Booking.com".tr,
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.left,
//                                           style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 16)),
//                                       SizedBox(
//                                         height: size.height * 0.005,
//                                       ),
//                                       // SizedBox(
//                                       //   // height: 100,
//                                       //   // width: size.width * 0.3,
//                                       //   child: Html(
//                                       //     data: "",
//                                       //     shrinkWrap: true,
//                                       //     style: {
//                                       //       "": Style(
//                                       //         fontSize: FontSize(12),
//                                       //       ),
//                                       //     },
//                                       //   ),
//                                       // ),

//                                       // overflow: TextOverflow.ellipsis,
//                                       // textAlign: TextAlign.left,
//                                       // style: AppTextStyle
//                                       //     .txtPoppinsRegular12Gray50001),
//                                       // SizedBox(
//                                       //   height: size.height * 0.005,
//                                       // ),
//                                       Container(
//                                         width: size.width * 0.4,
//                                         child:
//                                             // Text(urgencyMessage ?? "",
//                                             Text(
//                                                 controller.hotelRooms.length != 0
//                                                     ? controller.hotelRooms[index]['name'].replaceAll('-', '\n-')
//                                                     : urgencyMessage,
//                                                 // overflow: TextOverflow.ellipsis,
//                                                 textAlign: TextAlign.left,
//                                                 style: AppTextStyle.txtPoppinsMedium12Blue600
//                                                     .copyWith(color: ColorConstant.yellow900)),
//                                       )
//                                     ]),
//                               ),
//                               Row(
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                           controller.hotelRooms.length != 0
//                                               ? "${controller.hotelRooms[index]['price_breakdown']['currency'].toString()} ${controller.hotelRooms[index]['price_breakdown']['all_inclusive_price'].toString()}"
//                                               : price!,
//                                           // Text(price ?? "",
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.left,
//                                           style: AppTextStyle.txtPoppinsSemiBold26
//                                               .copyWith(color: ColorConstant.yellow900)),
//                                       Text("Per Night\nBook now".tr,
//                                           overflow: TextOverflow.ellipsis,
//                                           textAlign: TextAlign.right,
//                                           style: AppTextStyle.txtPoppinsSemiBold12Blue500
//                                               .copyWith(color: ColorConstant.yellow900)),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 7,
//                                   ),
//                                   CustomImageView(
//                                     svgPath: ImageConstant.imgArrowrightBlue600,
//                                     height: getSize(24.00),
//                                     width: getSize(24.00),
//                                   ),
//                                 ],
//                               )
//                             ])));
//                   }),

//               // Padding(
//               //     padding: getPadding(top: 15),
//               //     child: Text("lbl_more_deals".tr,
//               //         overflow: TextOverflow.ellipsis,
//               //         textAlign: TextAlign.left,
//               //         style: AppTextStyle.txtPoppinsSemiBold16Black900)),
//               // Container(
//               //     height: getVerticalSize(93),
//               //     margin: getMargin(top: 9),
//               //     padding: getPadding(left: 12, right: 12),
//               //     decoration: AppDecoration.outlineGray40066.copyWith(
//               //         borderRadius: BorderRadiusStyle.circleBorder9),
//               //     child: Row(
//               //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //         crossAxisAlignment: CrossAxisAlignment.center,
//               //         children: [
//               //           Column(
//               //               crossAxisAlignment: CrossAxisAlignment.start,
//               //               mainAxisAlignment: MainAxisAlignment.center,
//               //               children: [
//               //                 Text("lbl_travel_com".tr,
//               //                     overflow: TextOverflow.ellipsis,
//               //                     textAlign: TextAlign.left,
//               //                     style: AppTextStyle
//               //                         .txtPoppinsSemiBold16Black900),
//               //                 Text("msg_classic_room_pay".tr,
//               //                     overflow: TextOverflow.ellipsis,
//               //                     textAlign: TextAlign.left,
//               //                     style: AppTextStyle
//               //                         .txtPoppinsRegular12Gray50001),
//               //                 Text("msg_classic_room_pay".tr,
//               //                     overflow: TextOverflow.ellipsis,
//               //                     textAlign: TextAlign.left,
//               //                     style: AppTextStyle
//               //                         .txtPoppinsRegular12Gray50001)
//               //               ]),
//               //           Column(
//               //             mainAxisAlignment: MainAxisAlignment.center,
//               //             children: [
//               //               Row(
//               //                 mainAxisAlignment: MainAxisAlignment.center,
//               //                 crossAxisAlignment: CrossAxisAlignment.center,
//               //                 children: [
//               //                   Column(
//               //                     crossAxisAlignment:
//               //                         CrossAxisAlignment.end,
//               //                     mainAxisAlignment:
//               //                         MainAxisAlignment.center,
//               //                     children: [
//               //                       Text("lbl_au_90".tr,
//               //                           overflow: TextOverflow.ellipsis,
//               //                           textAlign: TextAlign.left,
//               //                           style: AppTextStyle
//               //                               .txtPoppinsSemiBold24),
//               //                       Text(
//               //                         "Per Night",
//               //                         style: AppTextStyle
//               //                             .txtPoppinsSemiBold12OrangeA20001,
//               //                       ),
//               //                       Text(
//               //                         "Book Now",
//               //                         style: AppTextStyle
//               //                             .txtPoppinsSemiBold12OrangeA20001,
//               //                       ),
//               //                     ],
//               //                   ),
//               //                   SizedBox(
//               //                     width: 7,
//               //                   ),
//               //                   CustomImageView(
//               //                     svgPath: ImageConstant.imgArrowright,
//               //                     height: getSize(24.00),
//               //                     width: getSize(24.00),
//               //                   ),
//               //                 ],
//               //               ),
//               //             ],
//               //           )
//               //         ])),
//               // SizedBox(
//               //   width: 30,
//               // ),

//               // ListView(
//               //   children: [
//               //     HotelDealsPage(),
//               //     HotalReviewPage(),
//               //   ],
//               // ),
//               SizedBox(
//                 height: 20,
//               ),
//               HotalDetailsPage(
//                 // physics: NeverScrollableScrollPhysics(),
//                 distance: "${distance}",
//                 price: "${price}",
//                 neabyCities: controller.nearByPlaces,
//                 mapLink: controller.mapLocationLink.value,
//                 checkIn: checkIn,
//                 checkOut: checkOut,
//                 address: address,
//                 callFrom: callFrom!,
//                 controllerrr: controllerr,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
