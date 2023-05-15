import 'dart:developer';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

import '../../core/app_export.dart';
import 'hotel.dart';

class HomeHotelListSimilarWidget extends StatefulWidget {
  final controller, callFrom, back;
  var price, distance;

  HomeHotelListSimilarWidget({
    this.controller,
    this.callFrom,
    required this.price,
    required this.back,
    required this.distance,
    super.key,
  });

  @override
  State<HomeHotelListSimilarWidget> createState() => _HomeHotelListSimilarWidgetState();
}

class _HomeHotelListSimilarWidgetState extends State<HomeHotelListSimilarWidget> {
  var similarHotelsList1 = [];
  var similarHotelsList2 = [];

  similarHotelList() {
    final double minPrice = (double.parse(widget.price)) * 0.75;
    final double maxPrice = (double.parse(widget.price)) * 1.25;
    print("hello ${widget.distance}");

    print("hello similarHotelList ${minPrice.toString()} ${maxPrice}");

    similarHotelsList1 = widget.controller.similarHotelsList.where((hotel) {
      print("hello ssimilarHotelList Price => ${hotel.compositePriceBreakdown.allInclusiveAmount.value}");
      print("hello ssimilarHotelList Distance => ${hotel.distance}");
      print("hello ssimilarHotelListii => ${hotel.compositePriceBreakdown.allInclusiveAmount.value}");
      return ((hotel.compositePriceBreakdown.allInclusiveAmount.value >= minPrice) &&
              (hotel.compositePriceBreakdown.allInclusiveAmount.value <= maxPrice)) &&
          (((double.parse(hotel.distance) >= (double.parse(widget.distance) * 0.75)) &&
              (double.parse(hotel.distance) <= (double.parse(widget.distance) * 1.25)))) &&
          (hotel.compositePriceBreakdown.allInclusiveAmount.value != (double.parse(widget.price)));
    }).toList();
    similarHotelsList2 = widget.controller.similarHotelsList.where((hotel) {
      return (hotel.compositePriceBreakdown.allInclusiveAmount.value != (double.parse(widget.price)));
    }).toList();
    print("hello simi ${similarHotelsList1.length}");

    return similarHotelsList1;
  }

  @override
  void initState() {
    // TODO: implement initState
    log("widget.bac ${widget.back}");

    print("hello si ${widget.price.toString()}");

    similarHotelList();
    print("hello si ${similarHotelsList1.length}");
    print("hello simi ${similarHotelsList2.length}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // calculate the price range for 25% more and 25% less than the selected hotel's price
    print("hello si ${similarHotelsList1.length}");

    // controller.si
    return Column(
      children: [
        Container(
          padding: getPadding(
            // left: 20,
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
                  "Similar hotels".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        similarHotelsList1.length == 0 ? _similarHotelEmpty() : _similarNotEmpty(),
      ],
    );
  }

  Container _similarHotelEmpty() {
    return Container(
      height: Get.width > 450 ? 250 : 211,
      child: ListView.separated(
        padding: getPadding(
          // left: 20,
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
        itemCount: similarHotelsList2.take(3).length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                log("Widget.back ${widget.back}");
                var _userCon = Get.find<UserSessionController>();
                // controller.recentlyViewHotelsList.clear();

                // Loop through each new hotel and check if it's already in the list

                // if (controller.recentlyViewHotelsList.length != 0 &&
                //     !controller.recentlyViewHotelsList.contains(
                //         controller.similarHotelsList2[index])) {
                //   // Add the new hotel to the list if it's not already present
                //   controller.recentlyViewHotelsList
                //       .add(controller.similarHotelsList2[index]);
                //   // _userCon.hotelList
                //   //     .add(controller.similarHotelsList2[index]);
                // } else if (controller.recentlyViewHotelsList.length ==
                //     0) {
                //   controller.recentlyViewHotelsList
                //       .add(controller.similarHotelsList2[index]);
                //   // _userCon.hotelList
                //   //     .add(controller.similarHotelsList2[index]);
                //   // print("sjkldfgjfgdl; ${_userCon.hotelList}");
                // }
                // // controller.recentlyViewHotelsList
                // //     .add(controller.similarHotelsList2.value[index]);
                // print(controller.recentlyViewHotelsList.length);
                // // Get.toNamed(AppRoutes.hotel_home);
                // print('object');
                // print(controller.similarHotelsList2.value[index].url
                //     .toString());
                // controller.onTapPopularHotel(controller
                //     .similarHotelsList2.value[index].hotelId
                //     .toString());
                // print(
                //     "======>>> ${controller.similarHotelsList2.value[index].resultClass}");
                // print(
                //     "======>>> ${controller.similarHotelsList2.value[index].checkout.until} ${controller.similarHotelsList2.value[index].checkout.from}");
                // print(
                //     "======>>> ${controller.similarHotelsList2.value[index].checkin.until} ${controller.similarHotelsList2.value[index].checkin.from}");
                widget.callFrom == "Home"
                    ? PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: Hotel(
                          longitude: similarHotelsList2[index].longitude,
                          latitude: similarHotelsList2[index].latitude,
                          distance: similarHotelsList2[index].distance,
                          checkIn: "${similarHotelsList2[index].checkin.from}-${similarHotelsList2[index].checkin.until}",
                          checkOut: "${similarHotelsList2[index].checkout.from}-${similarHotelsList2[index].checkout.until}",
                          address: similarHotelsList2[index].address,
                          controller: widget.controller,
                          unitConfiguration: similarHotelsList2[index].unitConfigurationLabel,
                          urgencyMessage: similarHotelsList2[index].urgencyMessage,
                          callFrom: widget.callFrom,
                          url: similarHotelsList2[index].url.toString(),
                          price: widget.controller.similarHotelsList[index].compositePriceBreakdown.allInclusiveAmount.value,
                        ),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      )
                    : PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: Hotel(
                          longitude: similarHotelsList2[index].longitude,
                          latitude: similarHotelsList2[index].latitude,
                          distance: similarHotelsList2[index].distance,
                          checkIn: "${similarHotelsList2[index].checkin.from}-${similarHotelsList2[index].checkin.until}",
                          checkOut: "${similarHotelsList2[index].checkout.from}-${similarHotelsList2[index].checkout.until}",
                          address: similarHotelsList2[index].address,
                          controller: widget.controller,
                          unitConfiguration: similarHotelsList2[index].unitConfigurationLabel,
                          urgencyMessage: similarHotelsList2[index].urgencyMessage,
                          callFrom: widget.callFrom,
                          back: widget.back,
                          url: similarHotelsList2[index].url.toString(),
                          price: widget.controller.similarHotelsList[index].compositePriceBreakdown.allInclusiveAmount.value,
                          adultCount: widget.controller.adultCount.value.toString(),
                          roomCount: widget.controller.roomsCount.value.toString(),
                          startDate: widget.controller.startDate.value,
                          endDate: widget.controller.endDate.value,
                        ),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                //
                var hotelController = Get.find<HotelController>();
                widget.callFrom == "Home"
                    ? widget.controller.onTapPopularHotel(similarHotelsList2[index].hotelId.toString())
                    : hotelController.fetchHotelDetails(
                        hotelId: similarHotelsList2[index].hotelId.toString(),
                        checkIn: widget.controller.startDate.value,
                        checkOut: widget.controller.endDate.value,
                      );
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  // color: Colors.black,
                  // height: 100,
                  width: Get.width > 450 ? 290 : 230.00,

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
                        url: similarHotelsList2[index].maxPhotoUrl,
                        // imagePath: ImageConstant.imgRectangle23915,
                        height: 142,
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
                                  similarHotelsList2[index].hotelName,
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
                                  similarHotelsList2[index].reviewScore.toString(),
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
                                  "${similarHotelsList2[index].city}, ${similarHotelsList2[index].countryTrans}".toUpperCase(),
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
              ));
        },
      ),
    );
  }

  Container _similarNotEmpty() {
    return Container(
      height: Get.width > 450 ? 250 : 211,
      child: ListView.separated(
        padding: getPadding(
          // left: 20,
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
        itemCount: similarHotelsList1.take(5).length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                log("Widget.back ${widget.back}");

                var _userCon = Get.find<UserSessionController>();
                // controller.recentlyViewHotelsList.clear();

                // Loop through each new hotel and check if it's already in the list

                // if (controller.recentlyViewHotelsList.length != 0 &&
                //     !controller.recentlyViewHotelsList.contains(
                //         controller.similarHotelsList1[index])) {
                //   // Add the new hotel to the list if it's not already present
                //   controller.recentlyViewHotelsList
                //       .add(controller.similarHotelsList1[index]);
                //   // _userCon.hotelList
                //   //     .add(controller.similarHotelsList1[index]);
                // } else if (controller.recentlyViewHotelsList.length ==
                //     0) {
                //   controller.recentlyViewHotelsList
                //       .add(controller.similarHotelsList1[index]);
                //   // _userCon.hotelList
                //   //     .add(controller.similarHotelsList1[index]);
                //   // print("sjkldfgjfgdl; ${_userCon.hotelList}");
                // }
                // // controller.recentlyViewHotelsList
                // //     .add(controller.similarHotelsList1.value[index]);
                // print(controller.recentlyViewHotelsList.length);
                // // Get.toNamed(AppRoutes.hotel_home);
                // print('object');
                // print(controller.similarHotelsList1.value[index].url
                //     .toString());
                // controller.onTapPopularHotel(controller
                //     .similarHotelsList1.value[index].hotelId
                //     .toString());
                // print(
                //     "======>>> ${controller.similarHotelsList1.value[index].resultClass}");
                // print(
                //     "======>>> ${controller.similarHotelsList1.value[index].checkout.until} ${controller.similarHotelsList1.value[index].checkout.from}");
                // print(
                //     "======>>> ${controller.similarHotelsList1.value[index].checkin.until} ${controller.similarHotelsList1.value[index].checkin.from}");
                widget.callFrom == "Home"
                    ? PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: Hotel(
                          longitude: similarHotelsList1[index].longitude,
                          latitude: similarHotelsList1[index].latitude,
                          distance: similarHotelsList1[index].distance,
                          checkIn: "${similarHotelsList2[index].checkin.from}-${similarHotelsList2[index].checkin.until}",
                          checkOut: "${similarHotelsList2[index].checkout.from}-${similarHotelsList2[index].checkout.until}",
                          address: similarHotelsList1[index].address,
                          controller: widget.controller,
                          unitConfiguration: similarHotelsList1[index].unitConfigurationLabel,
                          urgencyMessage: similarHotelsList1[index].urgencyMessage,
                          callFrom: widget.callFrom,
                          url: similarHotelsList1[index].url.toString(),
                          price: similarHotelsList1[index].compositePriceBreakdown.allInclusiveAmount.value,
                        ),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      )
                    : PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: Hotel(
                          longitude: similarHotelsList1[index].longitude,
                          latitude: similarHotelsList1[index].latitude,
                          distance: similarHotelsList1[index].distance,
                          checkIn: "${similarHotelsList2[index].checkin.from}-${similarHotelsList2[index].checkin.until}",
                          checkOut: "${similarHotelsList2[index].checkout.from}-${similarHotelsList2[index].checkout.until}",
                          address: similarHotelsList1[index].address,
                          controller: widget.controller,
                          unitConfiguration: similarHotelsList1[index].unitConfigurationLabel,
                          urgencyMessage: similarHotelsList1[index].urgencyMessage,
                          callFrom: widget.callFrom,
                          back: widget.back,
                          url: similarHotelsList1[index].url.toString(),
                          price: similarHotelsList1[index].compositePriceBreakdown.allInclusiveAmount.value,
                          adultCount: widget.controller.adultCount.value.toString(),
                          roomCount: widget.controller.roomsCount.value.toString(),
                          startDate: widget.controller.startDate.value,
                          endDate: widget.controller.endDate.value,
                        ),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                //
                var hotelController = Get.find<HotelController>();
                widget.callFrom == "Home"
                    ? widget.controller.onTapPopularHotel(similarHotelsList1[index].hotelId.toString())
                    : hotelController.fetchHotelDetails(
                        hotelId: similarHotelsList1[index].hotelId.toString(),
                        checkIn: widget.controller.startDate.value,
                        checkOut: widget.controller.endDate.value,
                      );
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  // color: Colors.black,
                  // height: 100,
                  width: Get.width > 450 ? 290 : 230.00,

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
                        url: similarHotelsList1[index].maxPhotoUrl,
                        // imagePath: ImageConstant.imgRectangle23915,
                        height: 142,
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
                                  similarHotelsList1[index].hotelName,
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
                                  similarHotelsList1[index].reviewScore.toString(),
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
                                  "${similarHotelsList1[index].city}, ${similarHotelsList1[index].countryTrans}".toUpperCase(),
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
              ));
        },
      ),
    );
  }
}
