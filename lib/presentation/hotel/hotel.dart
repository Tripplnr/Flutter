import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/home/home.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';
import 'package:trippinr/presentation/hotel/hotel_list.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_details.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_photos.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_reviews.dart';

class Hotel extends StatefulWidget {
  String callFrom;
  var controller, checkIn, checkOut, address, price, distance, latitude, longitude;
  String? back;

  String? adultCount, roomCount, startDate, endDate, url, urgencyMessage, unitConfiguration;

  Hotel({
    required this.callFrom,
    required this.latitude,
    required this.longitude,
    required this.distance,
    this.controller,
    this.unitConfiguration,
    this.roomCount,
    this.adultCount,
    this.startDate,
    this.url,
    this.urgencyMessage,
    required this.price,
    this.endDate,
    required this.address,
    required this.checkIn,
    required this.checkOut,
    this.back,
    // required this.mapLoaction,
    // required this.ratingData,
    // required this.nearbyLocationData,
  });

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> with TickerProviderStateMixin {
  late TabController tabController;
  HotelController controller = Get.put(HotelController(), permanent: false);
  DestinationController _destinationController = Get.find();
  var homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    print("jkadshflj");
    Get.put(HotelController());
    tabController = TabController(vsync: this, length: 3, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HotelController());
    return Obx(() {
      return controller.isLoading.value
          ? _shimmerLoader()
          : Scaffold(
              backgroundColor: ColorConstant.white,
              body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      // expandedHeight: widget.callFrom == "Home" ? 405 : 505,
                      expandedHeight: widget.callFrom == "Home"
                          ? Get.width > 450
                              ? 426
                              : 421
                          : Get.width > 450
                              ? 526
                              : 521,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: SafeArea(
                          child: Column(
                            children: [
                              Container(
                                height: Get.width > 450 ? 52 : 50,
                                padding: getPadding(left: 10, right: 10, top: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: getMargin(left: 0),
                                      height: 34,
                                      width: 34,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
                                      child: InkWell(
                                        onTap: () async {
                                          log("Widget.back ${widget.back}");

                                          // await Get.delete<HotelController>();
                                          // Get.back();
                                          widget.back == "true"
                                              ? Get.back()
                                              : widget.callFrom == "Home"
                                                  ? PersistentNavBarNavigator.pushNewScreen(
                                                      context,
                                                      screen: Home(),
                                                      withNavBar: true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                                    )
                                                  : PersistentNavBarNavigator.pushNewScreen(
                                                      context,
                                                      screen: HotelList(
                                                        locationName: _destinationController.placesNAMENEW.value,
                                                      ),
                                                      withNavBar: true, // OPTIONAL VALUE. True by default.
                                                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                                    );
                                          // : Navigator.pop(context);
                                        },
                                        child: CustomImageView(
                                          svgPath: ImageConstant.imgArrowleft,
                                          color: ColorConstant.black,
                                          fit: BoxFit.scaleDown,
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: getPadding(left: 15, right: 15),
                                        child: Column(
                                          children: [
                                            Text(
                                              // 'Capital O Hotel Ocean',
                                              controller.hotelDetails.value.name.toString(),
                                              style: AppTextStyle().txtPoppinsSemiBold18Black26092B.copyWith(fontSize: 18),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              widget.callFrom == "Search"
                                                  ? '${widget.startDate} - ${widget.endDate}   • ${widget.adultCount} ${(int.parse(widget.adultCount.toString())) > 1 ? "Guests" : "Guest"}, ${widget.roomCount} ${(int.parse(widget.roomCount.toString())) > 1 ? "Rooms" : "Room"}'
                                                  : "",
                                              // "${controller.hotelDetails.value.checkin!.to.toString()}-${controller.hotelDetails.value.checkout!.to.toString()}",
                                              style: AppTextStyle.txtPoppinsRegular12Yellow900,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _onShare(context);
                                        print("object");
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        // color: Colors.red,
                                        padding: getPadding(all: 13),
                                        child: Container(
                                          height: 25,
                                          width: 25,
                                          child: ClipRRect(
                                            child: CustomImageView(
                                              svgPath: ImageConstant.imgShare,
                                              color: ColorConstant.black,
                                              height: 25,
                                              width: 25,
                                              // color: ColorConstant.whiteA700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 250,
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: HotelPhotos(
                                            hotelName: controller.hotelDetails.value.name.toString(),
                                            // callFrom: 'Edit',
                                          ),
                                          withNavBar: true, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: Container(
                                        height: 250,
                                        // height: getVerticalSize(266),
                                        width: size.width,
                                        child: CarouselSlider.builder(
                                          itemCount: controller.hotelPhotos.take(5).length,
                                          itemBuilder: (BuildContext? context, int? index, int pageIndex) {
                                            // controller.imgIndex = pageIndex;
                                            final item = controller.hotelPhotos[index!];
                                            return Container(
                                              child: Image.network(
                                                item['url_max'],
                                                fit: BoxFit.cover,
                                                width: size.width,
                                              ),
                                            );
                                          },
                                          options: CarouselOptions(
                                            viewportFraction: 1,
                                            autoPlay: true,

                                            // clipBehavior: Clip.none,

                                            aspectRatio: 1,
                                            // enlargeCenterPage: false,
                                            // padEnds:
                                            //     false, // take full width, remove padding from all size
                                            onPageChanged: (index, reason) {
                                              controller.imgIndex.value = index;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Positioned(
                                    //     top: 10,
                                    //     right: 10,
                                    //     child: InkWell(
                                    //       onTap: () {
                                    //         _onShare(context);
                                    //       },
                                    //       child: CustomImageView(
                                    //         svgPath: ImageConstant.imgShare,
                                    //         color: ColorConstant.black,
                                    //         // color: ColorConstant.whiteA700,
                                    //       ),
                                    //     )),
                                    Positioned(
                                        bottom: 10,
                                        left: 20,
                                        right: 20,
                                        child: Obx(
                                          () => Row(
                                              // crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              // children: controller.imgList.map((i) {
                                              children: controller.hotelPhotos.take(5).map((i) {
                                                // int index = controller.imgList.indexOf(i);
                                                int index = controller.hotelPhotos.value.indexOf(i);
                                                return Container(
                                                  height: 10,
                                                  child: AnimatedContainer(
                                                    duration: Duration(milliseconds: 150),
                                                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                                                    height: controller.imgIndex == index ? 10 : 8.0,
                                                    width: controller.imgIndex == index ? 12 : 8.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        controller.imgIndex == index
                                                            ? BoxShadow(
                                                                color: Color(0XFF2FB7B2).withOpacity(0.72),
                                                                blurRadius: 4.0,
                                                                spreadRadius: 1.0,
                                                                offset: Offset(
                                                                  0.0,
                                                                  0.0,
                                                                ),
                                                              )
                                                            : BoxShadow(
                                                                color: Colors.transparent,
                                                              )
                                                      ],
                                                      shape: BoxShape.circle,
                                                      color: controller.imgIndex == index ? Colors.orange : Color(0XFFEAEAEA),
                                                    ),
                                                  ),
                                                );
                                              }).toList()),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                // margin: getMargin(top: 250),
                                padding: getPadding(left: 20, right: 20, top: 10),
                                decoration: BoxDecoration(
                                  // color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      // topLeft: Radius.circular(30),
                                      // topRight: Radius.circular(30),
                                      ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 108,
                                      // widget.callFrom == "Home" ? 92 : 108,
                                      // 108,
                                      // color: Colors.red,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              PersistentNavBarNavigator.pushNewScreen(
                                                context,
                                                screen: HotelPhotos(
                                                  hotelName: controller.hotelDetails.value.name.toString(),
                                                  // callFrom: 'Edit',
                                                ),
                                                withNavBar: true, // OPTIONAL VALUE. True by default.
                                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                              );
                                            },
                                            child: Text(
                                              // 'Capital O Hotel Ocean',
                                              controller.hotelDetails.value.name.toString(),
                                              // style: AppTextStyle().txtPoppinsSemiBold18Black26092B.copyWith(fontFamily: "Open Sans"),
                                              style: AppTextStyle().txtstyleHotelName,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                svgPath: ImageConstant.imgLocation,
                                                height: getSize(
                                                  13.5,
                                                ),
                                                width: getSize(
                                                  16.3,
                                                ),
                                                color: ColorConstant.yellow900,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${controller.hotelDetails.value.city}, ${controller.hotelDetails.value.country}"
                                                    .toUpperCase(),
                                                // 'Milan, Italy ',
                                                style: AppTextStyle().txtPoppinsMedium12Black,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  CommonRatingBar(
                                                      rating: double.parse(controller.hotelDetails.value.reviewScore == null
                                                          ? "0"
                                                          : controller.hotelDetails.value.reviewScore.toString()))
                                                ],
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                controller.hotelDetails.value.reviewScore.toString(),
                                                // '6.5 ',
                                                style: AppTextStyle().txtPoppinsSemiBold14Gray90001,
                                              ),
                                              Text(
                                                " ${controller.hotelDetails.value.reviewScoreWord.toString()}",

                                                // ' Good',
                                                style: AppTextStyle().txtPoppinsRegular12.copyWith(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    widget.callFrom == "Home"
                                        ? Container()
                                        : Container(
                                            height: 93,
                                            margin: getMargin(top: 5),
                                            padding: Get.width > 450
                                                ? getPadding(left: 20, right: 30, top: 8, bottom: 8)
                                                : getPadding(left: 20, right: 30, top: 18, bottom: 18),
                                            decoration:
                                                BoxDecoration(color: ColorConstant.orange5001, borderRadius: BorderRadius.circular(15)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Row(children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant.imgCalendar,
                                                            height: getSize(16.00),
                                                            width: getSize(16.00)),
                                                        Padding(
                                                            padding: getPadding(left: 6),
                                                            child: Text("Date",
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                style: AppTextStyle.txtPoppinsRegular14orangeA200))
                                                      ]),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Text("${widget.startDate}-${widget.endDate}",
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.left,
                                                              style: AppTextStyle.txtPoppinsMedium14Black900))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: getMargin(left: 40),
                                                  height: 50,
                                                  color: ColorConstant.orangeA300,
                                                  width: 0.7,
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Row(children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant.imgGroup, height: getSize(16.00), width: getSize(16.00)),
                                                        Padding(
                                                            padding: getPadding(left: 6),
                                                            child: Text("lbl_guests".tr,
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                style: AppTextStyle.txtPoppinsRegular14orangeA200))
                                                      ]),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Text(
                                                              "${widget.adultCount} ${(int.parse(widget.adultCount.toString())) > 1 ? "Guests" : "Guest"}, ${widget.roomCount} ${(int.parse(widget.roomCount.toString())) > 1 ? "Rooms" : "Room"}",
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.left,
                                                              style: AppTextStyle.txtPoppinsMedium14Black900))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // bottom: TabBar(
                      //   controller: tabController,
                      //   onTap: (index) {
                      //     print('Cuurent Screen ==> ${controller.index.value}');
                      //     if (index != controller.index.value) {
                      //       controller.index.value = index;
                      //     } else {
                      //       // ShowToast.show(msg: 'Please add business first!');
                      //       print(
                      //           'Cuurent Screen ==> ${controller.index.value}');
                      //     }
                      //   },
                      //   labelStyle: TextStyle(
                      //     fontSize: 14,
                      //   ),
                      //   labelPadding: EdgeInsets.zero,
                      //   tabs: [
                      //     Tab(text: "lbl_deals".tr),
                      //     Tab(text: "lbl_details".tr),
                      //     // Tab(text: "lbl_photos".tr),
                      //     Tab(text: "lbl_reviews".tr),
                      //   ],
                      //   padding: EdgeInsets.zero,
                      //   labelColor: ColorConstant.yellow900,
                      //   unselectedLabelColor: ColorConstant.gray50001,
                      //   indicatorColor: ColorConstant.yellow900,
                      // ),
                    ),
                    //   SliverList(
                    //     delegate: SliverChildBuilderDelegate((_, index) {
                    //       return Container(
                    //         height: size.height,
                    //         child: Column(
                    //           children: [
                    //             Expanded(
                    //               child: Container(
                    //                 // margin: getMargin(top: 250),
                    //                 padding:
                    //                     getPadding(left: 20, right: 20, top: 10),
                    //                 height: size.height,
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.white,
                    //                   borderRadius: BorderRadius.only(
                    //                       // topLeft: Radius.circular(30),
                    //                       // topRight: Radius.circular(30),
                    //                       ),
                    //                 ),
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: <Widget>[
                    //                     Text(
                    //                       // 'Capital O Hotel Ocean',
                    //                       controller.hotelDetails.value.name
                    //                           .toString(),
                    //                       style: AppTextStyle()
                    //                           .txtPoppinsSemiBold18Black26092B,
                    //                     ),
                    //                     SizedBox(
                    //                       height: size.height * 0.005,
                    //                     ),
                    //                     Row(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.center,
                    //                       children: [
                    //                         CustomImageView(
                    //                           svgPath: ImageConstant.imgLocation,
                    //                           height: getSize(
                    //                             13.5,
                    //                           ),
                    //                           width: getSize(
                    //                             16.3,
                    //                           ),
                    //                           color: ColorConstant.yellow900,
                    //                         ),
                    //                         SizedBox(
                    //                           width: size.width * 0.005,
                    //                         ),
                    //                         Text(
                    //                           "${controller.hotelDetails.value.city}, ${controller.hotelDetails.value.country}"
                    //                               .toUpperCase(),
                    //                           // 'Milan, Italy ',
                    //                           style: AppTextStyle()
                    //                               .txtPoppinsMedium12Black,
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     SizedBox(
                    //                       height: size.height * 0.01,
                    //                     ),
                    //                     Row(
                    //                       children: [
                    //                         Row(
                    //                           crossAxisAlignment:
                    //                               CrossAxisAlignment.center,
                    //                           children: [
                    //                             CommonRatingBar(
                    //                                 rating: double.parse(
                    //                                     controller.hotelDetails
                    //                                         .value.reviewScore
                    //                                         .toString()))
                    //                           ],
                    //                         ),
                    //                         SizedBox(
                    //                           width: 5,
                    //                         ),
                    //                         Text(
                    //                           controller
                    //                               .hotelDetails.value.reviewScore
                    //                               .toString(),
                    //                           // '6.5 ',
                    //                           style: AppTextStyle()
                    //                               .txtPoppinsSemiBold14Gray90001,
                    //                         ),
                    //                         Text(
                    //                           " ${controller.hotelDetails.value.reviewScoreWord.toString()}",

                    //                           // ' Good',
                    //                           style: AppTextStyle()
                    //                               .txtPoppinsRegular12
                    //                               .copyWith(fontSize: 12),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     widget.callFrom == "Home"
                    //                         ? Container()
                    //                         : Container(
                    //                             margin: getMargin(top: 14),
                    //                             padding: getPadding(
                    //                                 left: 20,
                    //                                 right: 30,
                    //                                 top: 20,
                    //                                 bottom: 20),
                    //                             decoration: BoxDecoration(
                    //                                 color:
                    //                                     ColorConstant.orange5001,
                    //                                 borderRadius:
                    //                                     BorderRadius.circular(
                    //                                         15)),
                    //                             child: Row(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment
                    //                                       .spaceBetween,
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.start,
                    //                               children: [
                    //                                 GestureDetector(
                    //                                   onTap: () {},
                    //                                   child: Column(
                    //                                     crossAxisAlignment:
                    //                                         CrossAxisAlignment
                    //                                             .start,
                    //                                     mainAxisAlignment:
                    //                                         MainAxisAlignment
                    //                                             .start,
                    //                                     children: [
                    //                                       Row(children: [
                    //                                         CustomImageView(
                    //                                             svgPath:
                    //                                                 ImageConstant
                    //                                                     .imgCalendar,
                    //                                             height: getSize(
                    //                                                 16.00),
                    //                                             width: getSize(
                    //                                                 16.00)),
                    //                                         Padding(
                    //                                             padding:
                    //                                                 getPadding(
                    //                                                     left: 6),
                    //                                             child: Text(
                    //                                                 "Date",
                    //                                                 overflow:
                    //                                                     TextOverflow
                    //                                                         .ellipsis,
                    //                                                 textAlign:
                    //                                                     TextAlign
                    //                                                         .left,
                    //                                                 style: AppTextStyle
                    //                                                     .txtPoppinsRegular14orangeA200))
                    //                                       ]),
                    //                                       Padding(
                    //                                           padding: getPadding(
                    //                                               top: 5),
                    //                                           child: Text(
                    //                                               "${widget.startDate}-${widget.endDate}",
                    //                                               overflow:
                    //                                                   TextOverflow
                    //                                                       .ellipsis,
                    //                                               textAlign:
                    //                                                   TextAlign
                    //                                                       .left,
                    //                                               style: AppTextStyle
                    //                                                   .txtPoppinsMedium14Black900))
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                                 Container(
                    //                                   margin: getMargin(left: 40),
                    //                                   height: size.height * 0.055,
                    //                                   color: ColorConstant
                    //                                       .orangeA300,
                    //                                   width: 0.7,
                    //                                 ),
                    //                                 GestureDetector(
                    //                                   onTap: () {},
                    //                                   child: Column(
                    //                                     crossAxisAlignment:
                    //                                         CrossAxisAlignment
                    //                                             .start,
                    //                                     mainAxisAlignment:
                    //                                         MainAxisAlignment
                    //                                             .start,
                    //                                     children: [
                    //                                       Row(children: [
                    //                                         CustomImageView(
                    //                                             svgPath:
                    //                                                 ImageConstant
                    //                                                     .imgGroup,
                    //                                             height: getSize(
                    //                                                 16.00),
                    //                                             width: getSize(
                    //                                                 16.00)),
                    //                                         Padding(
                    //                                             padding:
                    //                                                 getPadding(
                    //                                                     left: 6),
                    //                                             child: Text(
                    //                                                 "lbl_guests"
                    //                                                     .tr,
                    //                                                 overflow:
                    //                                                     TextOverflow
                    //                                                         .ellipsis,
                    //                                                 textAlign:
                    //                                                     TextAlign
                    //                                                         .left,
                    //                                                 style: AppTextStyle
                    //                                                     .txtPoppinsRegular14orangeA200))
                    //                                       ]),
                    //                                       Padding(
                    //                                           padding: getPadding(
                    //                                               top: 5),
                    //                                           child: Text(
                    //                                               "${widget.adultCount} Guest, ${widget.roomCount} Room",
                    //                                               overflow:
                    //                                                   TextOverflow
                    //                                                       .ellipsis,
                    //                                               textAlign:
                    //                                                   TextAlign
                    //                                                       .left,
                    //                                               style: AppTextStyle
                    //                                                   .txtPoppinsMedium14Black900))
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                     Container(
                    //                       width: size.width,
                    //                       height: getVerticalSize(44),
                    //                       margin: getMargin(
                    //                           left: 5,
                    //                           top: 5,
                    //                           right: 5,
                    //                           bottom: 5),
                    //                       child: TabBar(
                    //                         controller: tabController,
                    //                         onTap: (index) {
                    //                           print(
                    //                               'Cuurent Screen ==> ${controller.index.value}');
                    //                           if (index !=
                    //                               controller.index.value) {
                    //                             controller.index.value = index;
                    //                           } else {
                    //                             // ShowToast.show(msg: 'Please add business first!');
                    //                             print(
                    //                                 'Cuurent Screen ==> ${controller.index.value}');
                    //                           }
                    //                         },
                    //                         labelStyle: TextStyle(
                    //                           fontSize: 14,
                    //                         ),
                    //                         labelPadding: EdgeInsets.zero,
                    //                         tabs: [
                    //                           Tab(text: "lbl_deals".tr),
                    //                           Tab(text: "lbl_details".tr),
                    //                           // Tab(text: "lbl_photos".tr),
                    //                           Tab(text: "lbl_reviews".tr),
                    //                         ],
                    //                         labelColor: ColorConstant.yellow900,
                    //                         unselectedLabelColor:
                    //                             ColorConstant.gray50001,
                    //                         indicatorColor:
                    //                             ColorConstant.yellow900,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     }, childCount: 1),
                    //   ),
                  ];
                },
                body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        onTap: (index) {
                          print('Cuurent Screen ==> ${controller.index.value}');
                          if (index != controller.index.value) {
                            controller.index.value = index;
                          } else {
                            // ShowToast.show(msg: 'Please add business first!');
                            print('Cuurent Screen ==> ${controller.index.value}');
                          }
                        },
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        labelPadding: EdgeInsets.zero,
                        tabs: [
                          Tab(text: "lbl_deals".tr),
                          Tab(text: "lbl_details".tr),
                          // Tab(text: "lbl_photos".tr),
                          Tab(text: "lbl_reviews".tr),
                        ],
                        // padding: EdgeInsets.zero,
                        labelColor: ColorConstant.yellow900,
                        unselectedLabelColor: ColorConstant.gray50001,
                        indicatorColor: ColorConstant.yellow900,
                      ),
                      Expanded(
                        child: Obx(() => TabBarView(
                              // viewportFraction: 1,
                              // physics: AlwaysScrollableScrollPhysics(),

                              controller: tabController,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                                  child: HotalDetailsPageForDeals(
                                    sDate: widget.startDate,
                                    eDate: widget.endDate,
                                    back: widget.back ?? "",
                                    longitude: widget.longitude,
                                    latitude: widget.latitude,
                                    distance: "${widget.distance}",
                                    price: "${widget.price}",
                                    neabyCities: controller.nearByPlaces,
                                    mapLink: controller.mapLocationLink.value,
                                    checkIn: widget.checkIn,
                                    checkOut: widget.checkOut,
                                    address: widget.address,
                                    callFrom: widget.callFrom,
                                    controllerrr: widget.callFrom == "Home" ? homeController : _destinationController,
                                    url: widget.url,
                                    // urgencyMessage: widget.urgencyMessage,
                                    // unitConfiguration: widget.unitConfiguration,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                                  child: HotalDetailsPage(
                                    back: widget.back ?? "",
                                    sDate: widget.startDate,
                                    eDate: widget.endDate,
                                    longitude: widget.longitude,
                                    latitude: widget.latitude,
                                    distance: "${widget.distance}",
                                    price: "${widget.price}",
                                    neabyCities: controller.nearByPlaces,
                                    mapLink: controller.mapLocationLink.value,
                                    checkIn: widget.checkIn,
                                    checkOut: widget.checkOut,
                                    address: widget.address,
                                    callFrom: widget.callFrom,
                                    controllerrr: widget.callFrom == "Home" ? homeController : _destinationController,
                                  ),
                                ),
                                // HotelPhotos(),
                                Padding(
                                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                                  child: HotalReviewPage(
                                      distance: "${widget.distance}",
                                      price: "${widget.price}",
                                      reviewWords: controller.hotelReviewWord,
                                      reviewWordsScore: controller.hotelReviewWordScore,
                                      neabyCities: controller.nearByPlaces,
                                      callFrom: widget.callFrom,
                                      back: widget.back,
                                      controllerrr: widget.callFrom == "Home" ? homeController : _destinationController),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  _shimmerLoader() {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Container(
            padding: getPadding(left: 10, right: 10, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: getMargin(left: 0),
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
                ),
                Expanded(
                  child: Padding(
                    padding: getPadding(left: 15, right: 15),
                  ),
                ),
                // CustomImageView(
                //   svgPath: ImageConstant.imgShare,
                //   color: ColorConstant.black,
                //   // color: ColorConstant.whiteA700,
                // )
              ],
            ),
          ),
        ),
        backgroundColor: ColorConstant.gray100,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: getVerticalSize(350),
                  width: size.width,
                  color: Colors.white,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  // physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    height: size.height - 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(width: 150, color: Colors.white, height: 20),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgLocation,
                                height: getSize(13.5),
                                width: getSize(16.3),
                                color: ColorConstant.yellow900,
                              ),
                              SizedBox(
                                width: size.width * 0.005,
                              ),
                              Container(width: 80, color: Colors.white, height: 10),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              CommonRatingBar(rating: double.parse("10")),
                              SizedBox(width: 5),
                              Container(width: 20, color: Colors.white, height: 10),
                              SizedBox(width: 5),
                              Container(width: 50, color: Colors.white, height: 10),
                            ],
                          ),
                          widget.callFrom == "Home"
                              ? Container()
                              : Container(
                                  margin: getMargin(top: 14),
                                  padding: getPadding(left: 20, right: 30, top: 20, bottom: 20),
                                  decoration: BoxDecoration(color: ColorConstant.orange5001, borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            CustomImageView(
                                                svgPath: ImageConstant.imgCalendar, height: getSize(16.00), width: getSize(16.00)),
                                            Padding(
                                                padding: getPadding(left: 6),
                                                child: Text("Date",
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppTextStyle.txtPoppinsRegular14orangeA200))
                                          ]),
                                        ],
                                      ),
                                      Container(
                                        margin: getMargin(left: 40),
                                        height: size.height * 0.055,
                                        color: ColorConstant.orangeA300,
                                        width: 0.7,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            CustomImageView(svgPath: ImageConstant.imgGroup, height: getSize(16.00), width: getSize(16.00)),
                                            Padding(
                                                padding: getPadding(left: 6),
                                                child: Text("lbl_guests".tr,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppTextStyle.txtPoppinsRegular14orangeA200))
                                          ]),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          Container(
                              width: size.width,
                              height: getVerticalSize(44),
                              margin: getMargin(left: 5, top: 20, right: 5, bottom: 15),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                Container(width: 90, color: Colors.white, height: 40),
                                Container(width: 90, color: Colors.white, height: 40),
                                Container(width: 90, color: Colors.white, height: 40),
                              ])),
                          Container(
                            width: size.width,
                            color: Colors.white,
                            height: 100,
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: size.width,
                            color: Colors.white,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(widget.url!, subject: "Trippinr", sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
