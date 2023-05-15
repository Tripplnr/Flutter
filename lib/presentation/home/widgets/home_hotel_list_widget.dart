import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';

import '../../../core/app_export.dart';
import '../../hotel/hotel.dart';
import 'home_hotel_list_container_widget.dart';

class HomeHotelListWidget extends StatelessWidget {
  final controller;

  const HomeHotelListWidget({
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.popularHotelsList.length == 0
        ? Container()
        : Column(
            children: [
              Container(
                padding: getPadding(
                  left: 20,
                  top: 14,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Text(
                        "Stays Near Me".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        // style: AppTextStyle.txtPoppinsSemiBold16Black900,
                        style: AppTextStyle.txtPoppinsBold20,
                      ),
                    ),
                    // Spacer(),
                    // Padding(
                    //   padding: getPadding(
                    //     bottom: 4,
                    //   ),
                    //   child: Text(
                    //     "lbl_see_all".tr,
                    //     overflow: TextOverflow.ellipsis,
                    //     textAlign: TextAlign.left,
                    //     style: AppTextStyle.txtPoppinsRegular14,
                    //   ),
                    // ),
                    // CustomImageView(
                    //   svgPath: ImageConstant.imgArrowright,
                    //   height: getSize(
                    //     22.00,
                    //   ),
                    //   width: getSize(
                    //     22.00,
                    //   ),
                    //   margin: getMargin(
                    //     left: 1,
                    //     bottom: 3,
                    //   ),
                    // ),
                  ],
                ),
              ),
              controller.popularHotelsList.length == 0
                  ? Container(
                      child: Text(
                        // 'Something Went Wrong!',
                        "",
                        // 'No Data Found',
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    )
                  : Container(
                      height: Get.width > 450 ? 240 : 211,
                      child: ListView.separated(
                        padding: getPadding(
                          left: 20,
                          top: 5,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getVerticalSize(
                              8.00,
                            ),
                          );
                        },
                        // itemCount: 5,
                        itemCount: controller.nearByHotels.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                var _userCon = Get.find<UserSessionController>();
                                // controller.recentlyViewHotelsList.clear();

                                // Loop through each new hotel and check if it's already in the list

                                if (controller.recentlyViewHotelsList.length != 0 &&
                                    !controller.recentlyViewHotelsList.contains(controller.nearByHotels[index])) {
                                  // Add the new hotel to the list if it's not already present
                                  controller.recentlyViewHotelsList.add(controller.nearByHotels[index]);
                                  // _userCon.hotelList
                                  //     .add(controller.popularHotelsList[index]);
                                } else if (controller.recentlyViewHotelsList.length == 0) {
                                  controller.recentlyViewHotelsList.add(controller.nearByHotels[index]);
                                  // _userCon.hotelList
                                  //     .add(controller.popularHotelsList[index]);
                                  // print("sjkldfgjfgdl; ${_userCon.hotelList}");
                                }
                                // controller.recentlyViewHotelsList
                                //     .add(controller.popularHotelsList.value[index]);
                                print(controller.recentlyViewHotelsList.length);
                                // Get.toNamed(AppRoutes.hotel_home);
                                print('object');
                                print(controller.nearByHotels.value[index].url.toString());
                                controller.onTapPopularHotel(controller.nearByHotels.value[index].hotelId.toString());
                                print("======>>> ${controller.nearByHotels.value[index].resultClass}");
                                print(
                                    "======>>> ${controller.nearByHotels.value[index].checkout.until} ${controller.nearByHotels.value[index].checkout.from}");
                                print(
                                    "======>>> ${controller.nearByHotels.value[index].checkin.from} ${controller.nearByHotels.value[index].checkin.from}");
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: Hotel(
                                    longitude: controller.nearByHotels[index].longitude,
                                    latitude: controller.nearByHotels[index].latitude,
                                    distance: controller.nearByHotels[index].distance,
                                    checkIn:
                                        "${controller.nearByHotels[index].checkin.from}-${controller.nearByHotels[index].checkin.until}",
                                    checkOut:
                                        "${controller.nearByHotels[index].checkout.from}-${controller.nearByHotels[index].checkout.until}",
                                    address: controller.nearByHotels[index].address,
                                    unitConfiguration: controller.nearByHotels.value[index].unitConfigurationLabel,
                                    urgencyMessage: controller.nearByHotels.value[index].urgencyMessage,
                                    callFrom: 'Home',
                                    url: controller.nearByHotels.value[index].url.toString(),
                                    price: controller.nearByHotels[index].compositePriceBreakdown.allInclusiveAmount.value,
                                  ),
                                  withNavBar: true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                                //
                                // controller.onTapPopularHotel(controller
                                //     .popularHotelsList.value[index].hotelId
                                //     .toString());
                              },
                              child: HomeHotelListContainerWidget(index: index));
                        },
                      ),
                    ),
              //   Container(
              //     padding: getPadding(
              //       left: 20,
              //       top: 14,
              //       right: 20,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: getPadding(
              //             top: 1,
              //           ),
              //           child: Text(
              //             "Trending Hotels".tr,
              //             overflow: TextOverflow.ellipsis,
              //             textAlign: TextAlign.left,
              //             style: AppTextStyle.txtPoppinsSemiBold16Black900,
              //           ),
              //         ),
              //         // Spacer(),
              //         // Padding(
              //         //   padding: getPadding(
              //         //     bottom: 4,
              //         //   ),
              //         //   child: Text(
              //         //     "lbl_see_all".tr,
              //         //     overflow: TextOverflow.ellipsis,
              //         //     textAlign: TextAlign.left,
              //         //     style: AppTextStyle.txtPoppinsRegular14,
              //         //   ),
              //         // ),
              //         // CustomImageView(
              //         //   svgPath: ImageConstant.imgArrowright,
              //         //   height: getSize(
              //         //     22.00,
              //         //   ),
              //         //   width: getSize(
              //         //     22.00,
              //         //   ),
              //         //   margin: getMargin(
              //         //     left: 1,
              //         //     bottom: 3,
              //         //   ),
              //         // ),
              //       ],
              //     ),
              //   ),
              //   Container(
              //     height: getVerticalSize(
              //       159.00,
              //     ),
              //     child: ListView.separated(
              //       padding: getPadding(
              //         left: 20,
              //         top: 5,
              //       ),
              //       scrollDirection: Axis.horizontal,
              //       physics: BouncingScrollPhysics(),
              //       separatorBuilder: (context, index) {
              //         return SizedBox(
              //           height: getVerticalSize(
              //             8.00,
              //           ),
              //         );
              //       },
              //       // itemCount: 5,
              //       itemCount: controller.popularHotelsList.length,
              //       itemBuilder: (context, index) {
              //         return InkWell(
              //             onTap: () {
              //               controller.onTapPopularHotel(controller
              //                   .popularHotelsList.value[index].hotelId
              //                   .toString());
              //               PersistentNavBarNavigator.pushNewScreen(
              //                 context,
              //                 screen: Hotel(callFrom: 'Home'),
              //                 withNavBar: true, // OPTIONAL VALUE. True by default.
              //                 pageTransitionAnimation:
              //                     PageTransitionAnimation.cupertino,
              //               );
              //               // controller.onTapPopularHotel(controller
              //               //     .popularHotelsList.value[index].hotelId
              //               //     .toString());
              //             },
              //             child: HomeHotelListContainerWidget(index: index));
              //       },
              //     ),
              //   ),
            ],
          );
  }
}

class HomeHotelListTrendingWidget extends StatelessWidget {
  final controller;

  const HomeHotelListTrendingWidget({
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.trendingHotelsList.length == 0
        ? Container()
        : Column(
            children: [
              Container(
                padding: getPadding(
                  left: 20,
                  top: 14,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Text(
                        "Trending Hotels".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        // style: AppTextStyle.txtPoppinsSemiBold16Black900,
                        style: AppTextStyle.txtPoppinsBold20,
                      ),
                    ),
                    // Spacer(),
                    // Padding(
                    //   padding: getPadding(
                    //     bottom: 4,
                    //   ),
                    //   child: Text(
                    //     "lbl_see_all".tr,
                    //     overflow: TextOverflow.ellipsis,
                    //     textAlign: TextAlign.left,
                    //     style: AppTextStyle.txtPoppinsRegular14,
                    //   ),
                    // ),
                    // CustomImageView(
                    //   svgPath: ImageConstant.imgArrowright,
                    //   height: getSize(
                    //     22.00,
                    //   ),
                    //   width: getSize(
                    //     22.00,
                    //   ),
                    //   margin: getMargin(
                    //     left: 1,
                    //     bottom: 3,
                    //   ),
                    // ),
                  ],
                ),
              ),
              controller.trendingHotelsList.length == 0
                  ? Container(
                      child: Text(
                        // 'Something Went Wrong!',
                        "",
                        // 'No Data Found',
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    )
                  : Container(
                      height: Get.width > 450 ? 325 : 300,
                      child: ListView.separated(
                        padding: getPadding(
                          left: 20,
                          top: 5,
                        ),
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: getVerticalSize(
                              8.00,
                            ),
                          );
                        },
                        // itemCount: 5,
                        itemCount: controller.trendingHotelsList.take(5).length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                var _userCon = Get.find<UserSessionController>();
                                // controller.recentlyViewHotelsList.clear();

                                // Loop through each new hotel and check if it's already in the list

                                if (controller.recentlyViewHotelsList.length != 0 &&
                                    !controller.recentlyViewHotelsList.contains(controller.trendingHotelsList[index])) {
                                  // Add the new hotel to the list if it's not already present
                                  controller.recentlyViewHotelsList.add(controller.trendingHotelsList[index]);
                                  // _userCon.hotelList
                                  //     .add(controller.trendingHotelsList[index]);
                                } else if (controller.recentlyViewHotelsList.length == 0) {
                                  controller.recentlyViewHotelsList.add(controller.trendingHotelsList[index]);
                                  // _userCon.hotelList
                                  //     .add(controller.trendingHotelsList[index]);
                                  // print("sjkldfgjfgdl; ${_userCon.hotelList}");
                                }
                                // controller.recentlyViewHotelsList
                                //     .add(controller.trendingHotelsList.value[index]);
                                print(controller.recentlyViewHotelsList.length);
                                // Get.toNamed(AppRoutes.hotel_home);
                                print('object');
                                print(controller.trendingHotelsList.value[index].url.toString());
                                controller.onTapPopularHotel(controller.trendingHotelsList.value[index].hotelId.toString());
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: Hotel(
                                    longitude: controller.trendingHotelsList[index].longitude,
                                    latitude: controller.trendingHotelsList[index].latitude,
                                    distance: controller.trendingHotelsList[index].distance,
                                    checkIn:
                                        "${controller.trendingHotelsList[index].checkin.from}-${controller.trendingHotelsList[index].checkin.until}",
                                    checkOut:
                                        "${controller.trendingHotelsList[index].checkout.from}-${controller.trendingHotelsList[index].checkout.until}",
                                    address: controller.trendingHotelsList[index].address,
                                    unitConfiguration: controller.trendingHotelsList.value[index].unitConfigurationLabel,
                                    urgencyMessage: controller.trendingHotelsList.value[index].urgencyMessage,
                                    callFrom: 'Home',
                                    url: controller.trendingHotelsList.value[index].url.toString(),
                                    price: controller.trendingHotelsList[index].compositePriceBreakdown.allInclusiveAmount.value,
                                  ),
                                  withNavBar: true, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                                //
                                // controller.onTapPopularHotel(controller
                                //     .popularHotelsList.value[index].hotelId
                                //     .toString());
                              },
                              child: HomeTrendingHotelListContainerWidget(index: index));
                        },
                      ),
                    ),
              //   Container(
              //     padding: getPadding(
              //       left: 20,
              //       top: 14,
              //       right: 20,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: getPadding(
              //             top: 1,
              //           ),
              //           child: Text(
              //             "Trending Hotels".tr,
              //             overflow: TextOverflow.ellipsis,
              //             textAlign: TextAlign.left,
              //             style: AppTextStyle.txtPoppinsSemiBold16Black900,
              //           ),
              //         ),
              //         // Spacer(),
              //         // Padding(
              //         //   padding: getPadding(
              //         //     bottom: 4,
              //         //   ),
              //         //   child: Text(
              //         //     "lbl_see_all".tr,
              //         //     overflow: TextOverflow.ellipsis,
              //         //     textAlign: TextAlign.left,
              //         //     style: AppTextStyle.txtPoppinsRegular14,
              //         //   ),
              //         // ),
              //         // CustomImageView(
              //         //   svgPath: ImageConstant.imgArrowright,
              //         //   height: getSize(
              //         //     22.00,
              //         //   ),
              //         //   width: getSize(
              //         //     22.00,
              //         //   ),
              //         //   margin: getMargin(
              //         //     left: 1,
              //         //     bottom: 3,
              //         //   ),
              //         // ),
              //       ],
              //     ),
              //   ),
              //   Container(
              //     height: getVerticalSize(
              //       159.00,
              //     ),
              //     child: ListView.separated(
              //       padding: getPadding(
              //         left: 20,
              //         top: 5,
              //       ),
              //       scrollDirection: Axis.horizontal,
              //       physics: BouncingScrollPhysics(),
              //       separatorBuilder: (context, index) {
              //         return SizedBox(
              //           height: getVerticalSize(
              //             8.00,
              //           ),
              //         );
              //       },
              //       // itemCount: 5,
              //       itemCount: controller.popularHotelsList.length,
              //       itemBuilder: (context, index) {
              //         return InkWell(
              //             onTap: () {
              //               controller.onTapPopularHotel(controller
              //                   .popularHotelsList.value[index].hotelId
              //                   .toString());
              //               PersistentNavBarNavigator.pushNewScreen(
              //                 context,
              //                 screen: Hotel(callFrom: 'Home'),
              //                 withNavBar: true, // OPTIONAL VALUE. True by default.
              //                 pageTransitionAnimation:
              //                     PageTransitionAnimation.cupertino,
              //               );
              //               // controller.onTapPopularHotel(controller
              //               //     .popularHotelsList.value[index].hotelId
              //               //     .toString());
              //             },
              //             child: HomeHotelListContainerWidget(index: index));
              //       },
              //     ),
              //   ),
            ],
          );
  }
}
