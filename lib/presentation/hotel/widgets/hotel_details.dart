// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/controller/controller.dart';
import 'package:trippinr/presentation/hotel/controller/controller.dart';
import 'package:trippinr/presentation/hotel/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../destination/repository/destination_repository.dart';

// ignore_for_file: must_be_immutable
class HotalDetailsPage extends StatelessWidget {
  String callFrom, checkIn, checkOut, address, mapLink, price, back;
  var controllerrr, neabyCities, distance, physics, longitude, latitude, sDate, eDate;
  HotalDetailsPage(
      {Key? key,
      required this.callFrom,
      required this.longitude,
      required this.latitude,
      required this.checkIn,
      required this.checkOut,
      required this.address,
      required this.controllerrr,
      required this.neabyCities,
      required this.price,
      required this.distance,
      required this.mapLink,
      required this.sDate,
      required this.eDate,
      required this.back,
      this.physics})
      : super(key: key);

  var marker = <Marker>{};
  @override
  Widget build(BuildContext context) {
    print(callFrom);
    print("helllo  $callFrom");
    marker.add(Marker(
        markerId: MarkerId("hotel"),
        position: LatLng(
          double.parse("$latitude"),
          double.parse("$longitude"),
        )));
    String startCheckInTime = checkIn.split('-')[0];
    String endCheckInTime = checkIn.split('-')[1];

    String displayCheckInText = (startCheckInTime == '') ? '15:00' : startCheckInTime;
    // String displayCheckInText = (startCheckInTime == '' && endCheckInTime == '')
    //     ? 'N/A'
    //     : (startCheckInTime == '')
    //         ? endCheckInTime
    //         : (endCheckInTime == '')
    //             ? startCheckInTime
    //             : checkIn;
    String startCheckOutTime = checkOut.split('-')[0];
    String endCheckOutTime = checkOut.split('-')[1];

    String displayCheckOutText = (endCheckOutTime == '') ? '' : endCheckOutTime;
    // String displayCheckOutText = (startCheckOutTime == '' && endCheckOutTime == '')
    //     ? 'N/A'
    //     : (startCheckOutTime == '')
    //         ? endCheckOutTime
    //         : (endCheckOutTime == '')
    //             ? startCheckOutTime
    //             : checkOut;
    return GetX<HotelController>(
        builder: (controller) => SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              // physics: AlwaysScrollableScrollPhysics(),
              // physics: ScrollPhysics(),
              physics: NeverScrollableScrollPhysics(),
              // physics: physics ?? null,
              child: Container(
                width: size.width,
                // height: size.height * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("lbl_details".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                        controller.showAllDescription.value
                            ? controller.hotelDescription.value
                            : controller.hotelDescription.value.length < 150
                                ? controller.hotelDescription.value
                                : controller.hotelDescription.value.substring(0, 150),
                        // "msg_don_t_miss_out_on".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF413934),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    controller.hotelDescription.value.length > 150
                        ? !controller.showAllDescription.value
                            ? InkWell(
                                onTap: () {
                                  controller.showAllDescription.value = true;
                                  print("lestdkt");
                                },
                                child: Text("Read More",
                                    style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                              )
                            : InkWell(
                                onTap: () {
                                  controller.showAllDescription.value = false;
                                  print("lestt");
                                },
                                child: Text("Read Less",
                                    style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                              )
                        : Container(),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: ColorConstant.gray100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Popular Amenities".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    SizedBox(
                      height: 10,
                    ),
                    _popularAmenties(),
                    SizedBox(height: 10),

                    !controller.showAllAmenties.value
                        ? InkWell(
                            onTap: () {
                              controller.showAllAmenties.value = true;
                              print("lestdkt");
                            },
                            child: Text("See More",
                                style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                          )
                        : InkWell(
                            onTap: () {
                              controller.showAllAmenties.value = false;
                              print("lestt");
                            },
                            child: Text("See Less",
                                style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                          ),
                    Visibility(
                      visible: controller.showAllAmenties.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text("Amenities Offerings".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                          SizedBox(height: 10),
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              // physics: ScrollPhysics(),
                              itemCount: controller.hotelAmenties.length,
                              // itemCount: 100,
                              // itemCount: controller.showAllAmenties.value
                              //     ? controller.hotelAmenties.length
                              //     : controller.hotelAmenties.length < 5
                              //         ? controller.hotelAmenties.length
                              //         : 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: getPadding(bottom: 10),
                                  child: Container(
                                    // color: Colors.amber,
                                    // height: 50,
                                    width: size.width,
                                    child: Row(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgCheckmark,
                                          height: 19.00,
                                          width: 22,
                                        ),
                                        Expanded(
                                          child: Padding(
                                              padding: getPadding(left: 8),
                                              child: Text(
                                                  controller.hotelAmenties[index]['facility_name'] != null &&
                                                          controller.hotelAmenties[index]['facility_name'] != ""
                                                      ? controller.hotelAmenties[index]['facility_name']
                                                      : "",
                                                  // controller
                                                  //     .amentiesItems[index],
                                                  // overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Color(0xFF413934),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ))),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // controller.hotelAmenties.length > 5
                    //     ? !controller.showAllAmenties.value
                    //         ? InkWell(
                    //             onTap: () {
                    //               controller.showAllAmenties.value = true;
                    //               print("lestdkt");
                    //             },
                    //             child: Text("See More",
                    //                 style: TextStyle(
                    //                     color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                    //           )
                    //         : InkWell(
                    //             onTap: () {
                    //               controller.showAllAmenties.value = false;
                    //               print("lestt");
                    //             },
                    //             child: Text("See Less",
                    //                 style: TextStyle(
                    //                     color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                    //           )
                    //     : Container(),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: ColorConstant.gray100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Policies".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(),

                        Expanded(
                          child: Row(
                            children: [
                              Text("Check in",
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF413934),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Text(displayCheckInText,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsSemiBold16Black900),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              displayCheckOutText.isEmpty
                                  ? SizedBox()
                                  : Text("Check out",
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF413934),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      )),
                              SizedBox(
                                width: 20,
                              ),
                              Text(displayCheckOutText,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsSemiBold16Black900),
                            ],
                          ),
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text("Check-in",
                        //         maxLines: null,
                        //         textAlign: TextAlign.left,
                        //         style: TextStyle(
                        //           color: ColorConstant.gray50001,
                        //           fontSize: 14,
                        //           fontFamily: 'Poppins',
                        //           fontWeight: FontWeight.w400,
                        //         )),
                        //     Text(
                        //       callFrom != "Home" ? sDate : "",
                        //       // "${controller.hotelDetails.value.checkin!.to.toString()}-${controller.hotelDetails.value.checkout!.to.toString()}",
                        //       style: AppTextStyle.txtPoppinsRegular12Yellow900.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                        //       overflow: TextOverflow.ellipsis,
                        //     ),
                        //     Text(displayCheckInText,
                        //         overflow: TextOverflow.ellipsis,
                        //         textAlign: TextAlign.left,
                        //         style: AppTextStyle.txtPoppinsSemiBold16Black900),
                        //   ],
                        // ),
                        // Container(
                        //   margin: getPadding(right: 15, left: 15),
                        //   height: 10,
                        //   width: 1,
                        //   color: ColorConstant.gray100,
                        // ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text("Check-out",
                        //         maxLines: null,
                        //         textAlign: TextAlign.left,
                        //         style: TextStyle(
                        //           color: ColorConstant.gray50001,
                        //           fontSize: 14,
                        //           fontFamily: 'Poppins',
                        //           fontWeight: FontWeight.w400,
                        //         )),
                        //     Text(
                        //       callFrom == 'Search' ? eDate : "",
                        //       // "${controller.hotelDetails.value.checkin!.to.toString()}-${controller.hotelDetails.value.checkout!.to.toString()}",
                        //       style: AppTextStyle.txtPoppinsRegular12Yellow900.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                        //       overflow: TextOverflow.ellipsis,
                        //     ),
                        //     Text(displayCheckOutText,
                        //         overflow: TextOverflow.ellipsis,
                        //         textAlign: TextAlign.left,
                        //         style: AppTextStyle.txtPoppinsSemiBold16Black900),
                        //   ],
                        // ),
                        // Container()
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: ColorConstant.gray100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Location".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      // height: 240,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConstant.gray100, width: 1), borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: GoogleMap(
                                  onTap: (a) async {
                                    print(a);
                                    // final url = "https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude";
                                    final url = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
                                    if (await canLaunchUrl(Uri.parse(url))) {
                                      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  circles: <Circle>{
                                    Circle(
                                      circleId: CircleId("circleId"),
                                      center: LatLng(
                                        double.parse("$latitude"),
                                        double.parse("$longitude"),
                                      ),
                                      radius: 70,
                                      fillColor: ColorConstant.yellow900,
                                      strokeWidth: 2,
                                      strokeColor: Colors.white,
                                    ),
                                  },
                                  zoomGesturesEnabled: false,
                                  myLocationEnabled: false,
                                  // minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                                  mapToolbarEnabled: true,

                                  zoomControlsEnabled: false,
                                  tiltGesturesEnabled: false,
                                  myLocationButtonEnabled: false,
                                  scrollGesturesEnabled: false,

                                  mapType: MapType.normal,
                                  onMapCreated: (GoogleMapController _controller) async {
                                    BitmapDescriptor.fromAssetImage(
                                      ImageConfiguration(size: Size(80, 80)),
                                      'assets/images/map_icon.png',
                                    );
                                    // controller.mapController = _controller;

                                    // await controller.onMapCreated;
                                  },

                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      double.parse("$latitude"),
                                      double.parse("$longitude"),
                                    ),
                                    zoom: 14,
                                  ),
                                  markers: marker,
                                ),
                              )),
                          // Image.network(mapLink),

                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(address,
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 16)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Visibility(
                      visible: neabyCities.length != 0 ? true : false,
                      child: Column(
                        children: [
                          Text("Explore Near by",
                              // overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    neabyCities.length != 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: neabyCities.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: getPadding(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(neabyCities[index]['landmark_name'],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color(0xFF413934),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Text("${((neabyCities[index]['distance']) / 1000).toStringAsFixed(2)} Km",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color(0xFF413934),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              );
                            })
                        : Container(),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: ColorConstant.gray100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    HotalReviewPage(
                        price: price,
                        distance: distance,
                        reviewWordsScore: controller.hotelReviewWordScore,
                        reviewWords: controller.hotelReviewWord,
                        neabyCities: controller.nearByPlaces,
                        callFrom: callFrom,
                        back: back,
                        controllerrr: controllerrr),
                  ],
                ),
              ),
            )));
  }
}

Widget _popularAmenties() {
  return Row(
    // mainAxisAlignment : MainAxisAlignment.,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("Popular Amenties",
          //     textAlign: TextAlign.left,
          //     style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 16)),
          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgKitchen,
              ),
              SizedBox(width: 10),
              Text("Restaurant",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF413934),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),

          SizedBox(height: 10),
          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.img_Fitness,
              ),
              SizedBox(width: 10),
              Text("Fitness Center",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF413934),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.img_Bar,
              ),
              SizedBox(width: 10),
              Text("Bar/Lounge",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF413934),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgPool,
              ),
              SizedBox(width: 10),
              Text("Swimming Pool",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF413934),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
        ],
      ),
      // SizedBox(
      //   width: size.width * 0.1,
      // ),

      Spacer(),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("Popular Amenties",
          //     textAlign: TextAlign.left,
          //     style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 16)),
          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.img_247,
              ),
              SizedBox(width: 10),
              Text("24 hour front desk",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF413934),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),

          SizedBox(height: 10),
          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgWifi,
              ),
              SizedBox(width: 10),
              Text("Internet Access",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF413934),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),

          SizedBox(height: 10),

          Row(
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgParking,
              ),
              SizedBox(width: 10),
              Text("Parking",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF413934),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ))
            ],
          ),
        ],
      ),
    ],
  );
}

class HotalDetailsPageForDeals extends StatelessWidget {
  String callFrom, checkIn, checkOut, address, mapLink, price, back;
  var controllerrr, neabyCities, distance, physics, url, longitude, latitude, sDate, eDate;
  HotalDetailsPageForDeals(
      {Key? key,
      required this.callFrom,
      required this.checkIn,
      required this.sDate,
      required this.eDate,
      required this.checkOut,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.controllerrr,
      required this.neabyCities,
      required this.price,
      required this.distance,
      required this.mapLink,
      required this.url,
      required this.back,
      this.physics})
      : super(key: key);
  var marker = <Marker>{};
  @override
  Widget build(BuildContext context) {
    marker.add(Marker(
        markerId: MarkerId("hotel"),
        position: LatLng(
          double.parse("$latitude"),
          double.parse("$longitude"),
        )));
    print("helllo  $callFrom");
    String startCheckInTime = checkIn.split('-')[0];
    String endCheckInTime = checkIn.split('-')[1];

    String displayCheckInText = (startCheckInTime == '') ? '15:00' : startCheckInTime;
    // String displayCheckInText = (startCheckInTime == '' && endCheckInTime == '')
    //     ? 'N/A'
    //     : (startCheckInTime == '')
    //         ? endCheckInTime
    //         : (endCheckInTime == '')
    //             ? startCheckInTime
    //             : checkIn;
    String startCheckOutTime = checkOut.split('-')[0];
    String endCheckOutTime = checkOut.split('-')[1];

    String displayCheckOutText = (endCheckOutTime == '') ? '' : endCheckOutTime;
    // String displayCheckOutText = (startCheckOutTime == '' && endCheckOutTime == '')
    //     ? 'N/A'
    //     : (startCheckOutTime == '')
    //         ? endCheckOutTime
    //         : (endCheckOutTime == '')
    //             ? startCheckOutTime
    //             : checkOut;
    return GetX<HotelController>(
        builder: (controller) => SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              // physics: AlwaysScrollableScrollPhysics(),
              // physics: ScrollPhysics(),
              physics: NeverScrollableScrollPhysics(),
              // physics: physics ?? null,
              child: Container(
                width: size.width,
                // height: size.height * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("msg_our_recommended".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        // physics: AlwaysScrollableScrollPhysics(),
                        // physics: ScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.hotelRooms.take(5).length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                if (callFrom == "Home") {
                                  var startDate = DateTime.now().format('yyyy-MM-dd').toString();
                                  var endDate = DateTime.now().add(const Duration(days: 1)).format('yyyy-MM-dd').toString();
                                  DestinationRepository().openViewDealsBottomSheet(context,
                                      url: "${url}?checkin=${startDate}&checkout=${endDate}&group_adults=1&no_rooms=1");
                                } else {
                                  DestinationRepository().openViewDealsBottomSheet(context,
                                      url: "${url}"
                                          "?checkin=${Get.find<DestinationController>().selectedStartDate.value}"
                                          "&checkout=${Get.find<DestinationController>().selectedEndDate.value}&group_adults=${Get.find<DestinationController>().adultCount.value.toString()}"
                                          "&no_rooms=${Get.find<DestinationController>().roomsCount.value.toString()}&group_children=${""}");
                                }
                              },
                              child: Container(
                                  // height: getVerticalSize(93),
                                  margin: getMargin(top: 9),
                                  padding: getPadding(all: 10),
                                  decoration: AppDecoration.outlineLightblue100.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                                  child:
                                      // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

                                      Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Expanded(
                                            //   child:
                                            // ),
                                            Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text("Booking.com".tr,
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 16)),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.005,
                                                  ),
                                                  // SizedBox(
                                                  //   // height: 100,
                                                  //   // width: size.width * 0.3,
                                                  //   child: Html(
                                                  //     data: "",
                                                  //     shrinkWrap: true,
                                                  //     style: {
                                                  //       "": Style(
                                                  //         fontSize: FontSize(12),
                                                  //       ),
                                                  //     },
                                                  //   ),
                                                  // ),

                                                  // overflow: TextOverflow.ellipsis,
                                                  // textAlign: TextAlign.left,
                                                  // style: AppTextStyle
                                                  //     .txtPoppinsRegular12Gray50001),
                                                  // SizedBox(
                                                  //   height: size.height * 0.005,
                                                  // ),
                                                  Container(
                                                    // width: size.width * 0.4,
                                                    child:
                                                        // Text(urgencyMessage ?? "",
                                                        Text(
                                                            controller.hotelRooms.length != 0
                                                                // ? controller.hotelRooms[index]['name'].replaceAll('-', '\n-')
                                                                ? controller.hotelRooms[index]['room_name'].replaceAll('-', '\n-')
                                                                : "",
                                                            // overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppTextStyle.txtPoppinsMedium12Blue600
                                                                .copyWith(color: ColorConstant.yellow900)),
                                                  )
                                                ]),
                                            Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        controller.hotelRooms.length != 0
                                                            // ? "${controller.hotelRooms[index]['price_breakdown']['currency'].toString()} ${controller.hotelRooms[index]['price_breakdown']['all_inclusive_price'].toString()}"
                                                            ? "${controller.hotelRooms[index]['product_price_breakdown']['net_amount']['currency'].toString()} ${int.parse((controller.hotelRooms[index]['product_price_breakdown']['net_amount']['value']).toStringAsFixed(0)) + int.parse((controller.hotelRooms[index]['product_price_breakdown']['included_taxes_and_charges_amount']['value']).toStringAsFixed(0))}"
                                                            : price,
                                                        // Text(price ?? "",
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppTextStyle.txtPoppinsSemiBold26.copyWith(color: ColorConstant.yellow900)),
                                                    controller.hotelRooms.length != 0
                                                        ? Text(
                                                            // "Per Night\nBook now".tr,
                                                            //   "+ ${controller.hotelRooms[index]['product_price_breakdown']['included_taxes_and_charges_amount']['currency'].toString()} ${(controller.hotelRooms[index]['product_price_breakdown']['included_taxes_and_charges_amount']['value']).toStringAsFixed(0)} taxes and charges",
                                                            "Included taxes and charges",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.right,
                                                            style: AppTextStyle().txtPoppinsRegular12.copyWith(fontSize: 12))
                                                        : SizedBox(),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   width: 7,
                                                // ),
                                                // CustomImageView(
                                                //   svgPath: ImageConstant.imgArrowrightBlue600,
                                                //   height: getSize(24.00),
                                                //   width: getSize(24.00),
                                                //   color: ColorConstant.yellow900,
                                                // ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgArrowrightBlue600,
                                        height: getSize(24.00),
                                        width: getSize(24.00),
                                        color: ColorConstant.yellow900,
                                      )
                                    ],
                                  )

                                  // ])

                                  ));
                        }),
                    SizedBox(
                      height: 12,
                    ),
                    Text("lbl_details".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                        controller.showAllDescription.value
                            ? controller.hotelDescription.value
                            : controller.hotelDescription.value.length < 150
                                ? controller.hotelDescription.value
                                : controller.hotelDescription.value.substring(0, 150),
                        // "msg_don_t_miss_out_on".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF413934),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    controller.hotelDescription.value.length > 150
                        ? !controller.showAllDescription.value
                            ? InkWell(
                                onTap: () {
                                  controller.showAllDescription.value = true;
                                  print("lestdkt");
                                },
                                child: Text("Read More",
                                    style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                              )
                            : InkWell(
                                onTap: () {
                                  controller.showAllDescription.value = false;
                                  print("lestt");
                                },
                                child: Text("Read Less",
                                    style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                              )
                        : Container(),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: ColorConstant.gray100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Popular Amenities".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    SizedBox(
                      height: 10,
                    ),
                    _popularAmenties(),
                    SizedBox(height: 10),

                    !controller.showAllAmenties.value
                        ? InkWell(
                            onTap: () {
                              controller.showAllAmenties.value = true;
                              print("lestdkt");
                            },
                            child: Text("See More",
                                style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                          )
                        : InkWell(
                            onTap: () {
                              controller.showAllAmenties.value = false;
                              print("lestt");
                            },
                            child: Text("See Less",
                                style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                          ),
                    Visibility(
                      visible: controller.showAllAmenties.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text("Amenities Offerings".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                          SizedBox(height: 10),
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              // physics: ScrollPhysics(),
                              itemCount: controller.hotelAmenties.length,
                              // itemCount: 100,
                              // itemCount: controller.showAllAmenties.value
                              //     ? controller.hotelAmenties.length
                              //     : controller.hotelAmenties.length < 5
                              //         ? controller.hotelAmenties.length
                              //         : 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: getPadding(bottom: 10),
                                  child: Container(
                                    // color: Colors.amber,
                                    // height: 50,
                                    width: size.width,
                                    child: Row(
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgCheckmark,
                                          height: 19.00,
                                          width: 22,
                                        ),
                                        Expanded(
                                          child: Padding(
                                              padding: getPadding(left: 8),
                                              child: Text(
                                                  controller.hotelAmenties[index]['facility_name'] != null &&
                                                          controller.hotelAmenties[index]['facility_name'] != ""
                                                      ? controller.hotelAmenties[index]['facility_name']
                                                      : "",
                                                  // controller
                                                  //     .amentiesItems[index],
                                                  // overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Color(0xFF413934),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ))),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // controller.hotelAmenties.length > 5
                    //     ? !controller.showAllAmenties.value
                    //         ? InkWell(
                    //             onTap: () {
                    //               controller.showAllAmenties.value = true;
                    //               print("lestdkt");
                    //             },
                    //             child: Text("See More",
                    //                 style: TextStyle(
                    //                     color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                    //           )
                    //         : InkWell(
                    //             onTap: () {
                    //               controller.showAllAmenties.value = false;
                    //               print("lestt");
                    //             },
                    //             child: Text("See Less",
                    //                 style: TextStyle(
                    //                     color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                    //           )
                    //     : Container(),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: ColorConstant.gray100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Policies".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Container(),

                        Expanded(
                          child: Row(
                            children: [
                              Text("Check in",
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xFF413934),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Text(displayCheckInText,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsSemiBold16Black900),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              displayCheckOutText.isEmpty
                                  ? SizedBox()
                                  : Text("Check out",
                                      maxLines: null,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF413934),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      )),
                              SizedBox(
                                width: 20,
                              ),
                              Text(displayCheckOutText,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsSemiBold16Black900),
                            ],
                          ),
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text("Check-in",
                        //         maxLines: null,
                        //         textAlign: TextAlign.left,
                        //         style: TextStyle(
                        //           color: ColorConstant.gray50001,
                        //           fontSize: 14,
                        //           fontFamily: 'Poppins',
                        //           fontWeight: FontWeight.w400,
                        //         )),
                        //     Text(
                        //       callFrom != "Home" ? sDate : "",
                        //       // "${controller.hotelDetails.value.checkin!.to.toString()}-${controller.hotelDetails.value.checkout!.to.toString()}",
                        //       style: AppTextStyle.txtPoppinsRegular12Yellow900.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                        //       overflow: TextOverflow.ellipsis,
                        //     ),
                        //     Text(displayCheckInText,
                        //         overflow: TextOverflow.ellipsis,
                        //         textAlign: TextAlign.left,
                        //         style: AppTextStyle.txtPoppinsSemiBold16Black900),
                        //   ],
                        // ),
                        // Container(
                        //   margin: getPadding(right: 15, left: 15),
                        //   height: 10,
                        //   width: 1,
                        //   color: ColorConstant.gray100,
                        // ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text("Check-out",
                        //         maxLines: null,
                        //         textAlign: TextAlign.left,
                        //         style: TextStyle(
                        //           color: ColorConstant.gray50001,
                        //           fontSize: 14,
                        //           fontFamily: 'Poppins',
                        //           fontWeight: FontWeight.w400,
                        //         )),
                        //     Text(
                        //       callFrom == 'Search' ? eDate : "",
                        //       // "${controller.hotelDetails.value.checkin!.to.toString()}-${controller.hotelDetails.value.checkout!.to.toString()}",
                        //       style: AppTextStyle.txtPoppinsRegular12Yellow900.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                        //       overflow: TextOverflow.ellipsis,
                        //     ),
                        //     Text(displayCheckOutText,
                        //         overflow: TextOverflow.ellipsis,
                        //         textAlign: TextAlign.left,
                        //         style: AppTextStyle.txtPoppinsSemiBold16Black900),
                        //   ],
                        // ),
                        // Container()
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: ColorConstant.gray100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Location".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      // height: 240,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorConstant.gray100, width: 1), borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: GoogleMap(
                                  onTap: (a) async {
                                    print(a);
                                    // final url = "https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude";

                                    final url = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
                                    // final url = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
                                    if (await canLaunchUrl(Uri.parse(url))) {
                                      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  // circles: <Circle>{
                                  //   Circle(
                                  //     circleId: CircleId("circleId"),
                                  //     center: LatLng(
                                  //       double.parse("$latitude"),
                                  //       double.parse("$longitude"),
                                  //     ),
                                  //     radius: 70,
                                  //     fillColor: ColorConstant.yellow900,
                                  //     strokeWidth: 2,
                                  //     strokeColor: Colors.white,
                                  //   ),
                                  // },
                                  zoomGesturesEnabled: false,
                                  myLocationEnabled: false,
                                  // minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                                  mapToolbarEnabled: true,

                                  zoomControlsEnabled: false,
                                  tiltGesturesEnabled: false,
                                  myLocationButtonEnabled: false,
                                  scrollGesturesEnabled: false,

                                  mapType: MapType.normal,
                                  onMapCreated: (GoogleMapController _controller) async {
                                    // BitmapDescriptor.fromAssetImage(
                                    //   ImageConfiguration(size: Size(80, 80)),
                                    //   'assets/images/map_icon.png',
                                    // );
                                    // controller.mapController = _controller;

                                    // await controller.onMapCreated;
                                    marker.add(Marker(markerId: MarkerId("test")));
                                  },

                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      double.parse("$latitude"),
                                      double.parse("$longitude"),
                                    ),
                                    zoom: 14,
                                  ),
                                  markers: marker,
                                ),
                              )),
                          // Image.network(mapLink),

                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(address,
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 16)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Visibility(
                      visible: neabyCities.length != 0 ? true : false,
                      child: Column(
                        children: [
                          Text("Explore Near by",
                              // overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18)),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    neabyCities.length != 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: neabyCities.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: getPadding(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: Get.width * 0.7,
                                      child: Text(neabyCities[index]['landmark_name'],
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Color(0xFF413934),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ),
                                    Text("${((neabyCities[index]['distance']) / 1000).toStringAsFixed(2)} Km",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color(0xFF413934),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              );
                            })
                        : Container(),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 1,
                      width: size.width,
                      color: ColorConstant.gray100,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    HotalReviewPage(
                        price: price,
                        back: back,
                        distance: distance,
                        reviewWordsScore: controller.hotelReviewWordScore,
                        reviewWords: controller.hotelReviewWord,
                        neabyCities: controller.nearByPlaces,
                        callFrom: callFrom,
                        controllerrr: controllerrr),
                  ],
                ),
              ),
            )));
  }
}
