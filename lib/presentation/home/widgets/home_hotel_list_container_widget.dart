import 'package:trippinr/core/app_export.dart';

import '../controller/home_controller.dart';

class HomeHotelListContainerWidget extends GetView<HomeController> {
  int? index;

  HomeHotelListContainerWidget({this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        // color: Colors.black,
        // height: 100,
        width: Get.width > 450 ? 300 : 230.00,

        margin: getMargin(
          right: 8,
        ),
        padding: getPadding(
          left: 5,
          top: 4,
          right: 5,
          bottom: 4,
        ),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder9,
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              url: controller.nearByHotels[index!].maxPhotoUrl,
              // imagePath: ImageConstant.imgRectangle23915,
              height: 142,
              fit: BoxFit.cover,
              width: Get.width > 450 ? 300 : 230.00,
              radius: BorderRadius.circular(
                getHorizontalSize(
                  10.00,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(top: 5, left: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        // "lbl_marriott".tr,
                        controller.nearByHotels[index!].hotelName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium14,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgStar,
                      height: getSize(
                        14.00,
                      ),
                      width: getSize(
                        14.00,
                      ),
                      margin: getMargin(
                        left: 3,
                        top: 4,
                        bottom: 2,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 4,
                        top: 2,
                      ),
                      child: Text(
                        controller.nearByHotels[index!].reviewScore.toString(),
                        // "lbl_3_5".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 5,
                top: 4,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgLocation,
                    height: getSize(
                      16.00,
                    ),
                    width: getSize(
                      16.00,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: getPadding(
                        left: 6,
                      ),
                      child: Text(
                        // "jsdh",
                        "${controller.nearByHotels[index!].city}, ${controller.nearByHotels[index!].countryTrans}".toUpperCase(),
                        // "lbl_milan_italy".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentlyViewedlListContainerWidget extends GetView<HomeController> {
  int? index;

  RecentlyViewedlListContainerWidget({this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        // color: Colors.black,
        // height: 100,
        width: Get.width > 450 ? 290 : 230,
        margin: getMargin(
          right: 8,
        ),
        padding: getPadding(
          left: 5,
          top: 4,
          right: 5,
          bottom: 4,
        ),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder9,
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              url: controller.recentlyViewHotelsList[index!].maxPhotoUrl,
              // imagePath: ImageConstant.imgRectangle23915,
              height: Get.width > 450 ? 156 : 142,
              fit: BoxFit.cover,
              width: Get.width > 450 ? 290 : 230.00,
              radius: BorderRadius.circular(
                getHorizontalSize(
                  10.00,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(top: 5, left: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        // "lbl_marriott".tr,
                        controller.recentlyViewHotelsList.value[index!].hotelName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium14,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgStar,
                      height: getSize(
                        14.00,
                      ),
                      width: getSize(
                        14.00,
                      ),
                      margin: getMargin(
                        left: 3,
                        top: 4,
                        bottom: 2,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 4,
                        top: 2,
                      ),
                      child: Text(
                        controller.recentlyViewHotelsList.value[index!].reviewScore.toString(),
                        // "lbl_3_5".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 5,
                top: 4,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgLocation,
                    height: getSize(
                      16.00,
                    ),
                    width: getSize(
                      16.00,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: getPadding(
                        left: 6,
                      ),
                      child: Text(
                        // "jsdh",
                        "${controller.recentlyViewHotelsList.value[index!].city}, ${controller.recentlyViewHotelsList.value[index!].countryTrans}"
                            .toUpperCase(),
                        // "lbl_milan_italy".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeTrendingHotelListContainerWidget extends GetView<HomeController> {
  int? index;

  HomeTrendingHotelListContainerWidget({this.index});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        // color: Colors.black,
        // height: 100,
        width: Get.width > 450 ? 320 : 275.00,

        margin: getMargin(
          right: 8,
        ),
        padding: getPadding(
          left: 5,
          top: 4,
          right: 5,
          bottom: 4,
        ),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder9,
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomImageView(
                  url: controller.trendingHotelsList.value[index!].maxPhotoUrl,
                  // imagePath: ImageConstant.imgRectangle23915,
                  height: 230,
                  fit: BoxFit.cover,
                  width: Get.width > 450 ? 320 : 275.00,
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      10.00,
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 25,
                      width: Get.width > 450 ? 70 : 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: ColorConstant.yellow900),
                          color: ColorConstant.black),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.trendingHotelsList.value[index!].resultClass.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomImageView(
                                svgPath: ImageConstant.imgStar,
                                height: getSize(
                                  14.00,
                                )),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: getPadding(top: 5, left: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        // "lbl_marriott".tr,
                        controller.trendingHotelsList.value[index!].hotelName,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium14,
                      ),
                    ),
                    // CustomImageView(
                    //   svgPath: ImageConstant.imgStar,
                    //   height: getSize(
                    //     14.00,
                    //   ),
                    //   width: getSize(
                    //     14.00,
                    //   ),
                    //   margin: getMargin(
                    //     left: 3,
                    //     top: 4,
                    //     bottom: 2,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: getPadding(
                    //     left: 4,
                    //     top: 2,
                    //   ),
                    //   child: Text(
                    //     controller.trendingHotelsList.value[index!].reviewScore.toString(),
                    //     // "lbl_3_5".tr,
                    //     overflow: TextOverflow.ellipsis,
                    //     textAlign: TextAlign.left,
                    //     style: AppTextStyle.txtPoppinsMedium12,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                left: 5,
                top: 4,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgLocation,
                    height: getSize(
                      16.00,
                    ),
                    width: getSize(
                      16.00,
                    ),
                    margin: getMargin(
                      bottom: 1,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: getPadding(
                        left: 6,
                      ),
                      child: Text(
                        // "jsdh",
                        "${controller.trendingHotelsList.value[index!].city}, ${controller.trendingHotelsList.value[index!].countryTrans}"
                            .toUpperCase(),
                        // "lbl_milan_italy".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class RecentlyViewedlListContainerWidget extends GetView<HomeController> {
//   int? index;

//   RecentlyViewedlListContainerWidget({this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.center,
//       child: Container(
//         // color: Colors.black,
//         // height: 100,
//         width: 192,
//         margin: getMargin(
//           right: 8,
//         ),
//         padding: getPadding(
//           left: 5,
//           top: 4,
//           right: 5,
//           bottom: 4,
//         ),
//         decoration: AppDecoration.fillWhiteA700.copyWith(
//           borderRadius: BorderRadiusStyle.circleBorder9,
//         ),
//         child: Column(
//           // mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CustomImageView(
//               url: controller.recentlyViewHotelsList.value[index!].maxPhotoUrl,
//               // imagePath: ImageConstant.imgRectangle23915,
//               height: getVerticalSize(
//                 95.00,
//               ),
//               fit: BoxFit.cover,
//               width: 182.00,
//               radius: BorderRadius.circular(
//                 getHorizontalSize(
//                   10.00,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Padding(
//                 padding: getPadding(top: 5, left: 7),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         // "lbl_marriott".tr,
//                         controller
//                             .recentlyViewHotelsList.value[index!].hotelName,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppTextStyle.txtPoppinsMedium14,
//                       ),
//                     ),
//                     CustomImageView(
//                       svgPath: ImageConstant.imgStar,
//                       height: getSize(
//                         14.00,
//                       ),
//                       width: getSize(
//                         14.00,
//                       ),
//                       margin: getMargin(
//                         left: 3,
//                         top: 4,
//                         bottom: 2,
//                       ),
//                     ),
//                     Padding(
//                       padding: getPadding(
//                         left: 4,
//                         top: 2,
//                       ),
//                       child: Text(
//                         controller
//                             .recentlyViewHotelsList.value[index!].reviewScore
//                             .toString(),
//                         // "lbl_3_5".tr,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppTextStyle.txtPoppinsMedium12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: getPadding(
//                 left: 5,
//                 top: 4,
//               ),
//               child: Row(
//                 children: [
//                   CustomImageView(
//                     svgPath: ImageConstant.imgLocation,
//                     height: getSize(
//                       16.00,
//                     ),
//                     width: getSize(
//                       16.00,
//                     ),
//                     margin: getMargin(
//                       bottom: 1,
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: getPadding(
//                         left: 6,
//                       ),
//                       child: Text(
//                         // "jsdh",
//                         "${controller.recentlyViewHotelsList.value[index!].city}, ${controller.recentlyViewHotelsList.value[index!].countryTrans}"
//                             .toUpperCase(),
//                         // "lbl_milan_italy".tr,
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppTextStyle.txtPoppinsMedium12,
//                       ),
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
