import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/home/widgets/home_hotel_list_container_widget.dart';

import '../../hotel/hotel.dart';

class DestinationHotelListWidget extends GetView<HomeController> {
  const DestinationHotelListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetX<HomeController>(
            init: HomeController(),
            builder: (_) {
              return _.recentlyViewHotelsList.length == 0
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
                                  "Recently Viewed".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  // style: AppTextStyle.txtPoppinsSemiBold16Black900,
                                  style: AppTextStyle.txtPoppinsBold20,
                                ),
                              ),
                              // Spacer(),
                            ],
                          ),
                        ),
                        GetBuilder<HomeController>(
                            init: HomeController(),
                            builder: (__) {
                              return Container(
                                height: Get.width > 450 ? 250 : 211,
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
                                  itemCount: _.recentlyViewHotelsList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          // Get.toNamed(AppRoutes.hotel_home);
                                          PersistentNavBarNavigator.pushNewScreen(
                                            context,
                                            screen: Hotel(
                                              longitude: controller.recentlyViewHotelsList.value[index].longitude,
                                              latitude: controller.recentlyViewHotelsList.value[index].latitude,
                                              distance: controller.recentlyViewHotelsList.value[index].distance,
                                              checkIn:
                                                  "${controller.recentlyViewHotelsList.value[index].checkin.from}-${controller.recentlyViewHotelsList.value[index].checkin.until}",
                                              checkOut:
                                                  "${controller.recentlyViewHotelsList.value[index].checkout.from}-${controller.recentlyViewHotelsList.value[index].checkout.until}",
                                              address: controller.recentlyViewHotelsList.value[index].address,
                                              unitConfiguration: controller.recentlyViewHotelsList.value[index].unitConfigurationLabel,
                                              urgencyMessage: controller.recentlyViewHotelsList.value[index].urgencyMessage,
                                              callFrom: 'Home',
                                              url: controller.recentlyViewHotelsList.value[index].url.toString(),
                                              // price:
                                              //     "${controller.popularHotelsList[index].compositePriceBreakdown.allInclusiveAmount.currency}"
                                              //     "${(controller.popularHotelsList[index].compositePriceBreakdown.allInclusiveAmount.value).toStringAsFixed(0)}",
                                              price: controller.recentlyViewHotelsList.value[index].compositePriceBreakdown.allInclusiveAmount.value,
                                            ),
                                            withNavBar: true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                          );

                                          _.onTapPopularHotel(controller.recentlyViewHotelsList.value[index].hotelId.toString());
                                        },
                                        child: RecentlyViewedlListContainerWidget(index: index));
                                  },
                                ),
                              );
                            }),
                      ],
                    );
            }),
        // Container(
        //   padding: getPadding(
        //     left: 20,
        //     top: 14, //! Please Uncooment This If overflow issues
        //     right: 20,
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding: getPadding(
        //           top: 1,
        //         ),
        //         child: Text(
        //           "Recommended".tr,
        //           overflow: TextOverflow.ellipsis,
        //           textAlign: TextAlign.left,
        //           style: AppTextStyle.txtPoppinsSemiBold16Black900,
        //         ),
        //       ),
        //       // Spacer(),
        //       // Padding(
        //       //   padding: getPadding(
        //       //     bottom: 4,
        //       //   ),
        //       //   child: Text(
        //       //     "lbl_see_all".tr,
        //       //     overflow: TextOverflow.ellipsis,
        //       //     textAlign: TextAlign.left,
        //       //     style: AppTextStyle.txtPoppinsRegular14,
        //       //   ),
        //       // ),
        //       // CustomImageView(
        //       //   svgPath: ImageConstant.imgArrowright,
        //       //   height: getSize(
        //       //     22.00,
        //       //   ),
        //       //   width: getSize(
        //       //     22.00,
        //       //   ),
        //       //   margin: getMargin(
        //       //     left: 1,
        //       //     bottom: 3,
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
        // Container(
        //   height: 208.00,
        //   margin: getMargin(bottom: 20),
        //   child: ListView.separated(
        //     padding: getPadding(
        //       left: 20,
        //       top: 5,
        //     ),
        //     scrollDirection: Axis.horizontal,
        //     physics: BouncingScrollPhysics(),
        //     separatorBuilder: (context, index) {
        //       return SizedBox(
        //         height: getVerticalSize(
        //           8.00,
        //         ),
        //       );
        //     },
        //     // itemCount: 5,
        //     itemCount: controller.popularHotelsList.take(4).length,
        //     itemBuilder: (context, index) {
        //       return controller.popularHotelsList.length == 0
        //           ? Align(
        //               alignment: Alignment.center,
        //               child: Container(
        //                 height: size.height,
        //                 width: size.width,
        //                 color: Colors.red,
        //                 child: Center(child: Text('Something Went Wrong!')),
        //               ),
        //             )
        //           : InkWell(
        //               onTap: () {
        //                 // Get.toNamed(AppRoutes.hotel_home);
        //                 // Get.toNamed(AppRoutes.hotel_home);
        //                 if (controller.recentlyViewHotelsList.length != 0 &&
        //                     !controller.recentlyViewHotelsList.contains(controller.popularHotelsList[index])) {
        //                   // Add the new hotel to the list if it's not already present
        //                   controller.recentlyViewHotelsList.add(controller.popularHotelsList[index]);
        //                 } else if (controller.recentlyViewHotelsList.length == 0) {
        //                   controller.recentlyViewHotelsList.add(controller.popularHotelsList[index]);
        //                 }
        //                 PersistentNavBarNavigator.pushNewScreen(
        //                   context,
        //                   screen: Hotel(
        //                     longitude: controller.popularHotelsList[index].longitude,
        //                     latitude: controller.popularHotelsList[index].latitude,
        //                     distance: controller.popularHotelsList[index].distance,
        //                     checkIn:
        //                         "${controller.popularHotelsList[index].checkin.from}-${controller.popularHotelsList[index].checkin.until}",
        //                     checkOut:
        //                         "${controller.popularHotelsList[index].checkout.from}-${controller.popularHotelsList[index].checkout.until}",
        //                     address: controller.popularHotelsList[index].address,
        //                     unitConfiguration: controller.popularHotelsList[index].unitConfigurationLabel,
        //                     urgencyMessage: controller.popularHotelsList[index].urgencyMessage,
        //                     callFrom: 'Home',
        //                     url: controller.popularHotelsList[index].url.toString(),
        //                     price: controller.popularHotelsList[index].compositePriceBreakdown.allInclusiveAmount.value,
        //                   ),
        //                   withNavBar: true, // OPTIONAL VALUE. True by default.
        //                   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        //                 );
        //                 controller.onTapPopularHotel(controller.popularHotelsList[index].hotelId.toString());
        //               },
        //               child: HomeHotelListContainerWidget(index: index));
        //     },
        //   ),
        // ),
      ],
    );
  }
}
