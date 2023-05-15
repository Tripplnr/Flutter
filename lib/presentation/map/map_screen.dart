import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/home/models/popular_hotel_model.dart' as result;
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';
import 'package:trippinr/presentation/hotel/hotel.dart';
import 'package:trippinr/presentation/hotel/hotel_list.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_helper_methods.dart';

import '../destination/repository/destination_repository.dart';
import 'controller/map_controller.dart';

// ignore_for_file: must_be_immutable
class MapScreen extends GetWidget<MapController> {
  var destinationCController = Get.find<DestinationController>();
  var authController = Get.find<AuthController>();
  var controllerr = Get.put(HotelController());

  @override
  Widget build(BuildContext context) {
    // var num = Marker(
    //   markerId: MarkerId("1"),
    //   position: LatLng(12, 67),
    // );
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            GetBuilder<DestinationController>(
                init: DestinationController(),
                builder: (cont) {
                  return GoogleMap(
                    circles: <Circle>{
                      Circle(
                        circleId: CircleId("circleId"),
                        center: LatLng(
                          // double.parse(cont.latSave.value),
                          // double.parse(cont.longSave.value),
                          double.parse(cont.searchedHotelList[0]["latitude"].toString()),
                          double.parse(cont.searchedHotelList[0]["longitude"].toString()),
                        ),
                        radius: 3000,
                        fillColor: Colors.blue.withOpacity(0.2),
                        strokeWidth: 2,
                        strokeColor: Colors.blue,
                      ),
                    },
                    // zoomGesturesEnabled: false,
                    myLocationEnabled: false,
                    // minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                    mapToolbarEnabled: false,
                    // zoomControlsEnabled: false,
                    tiltGesturesEnabled: false,
                    myLocationButtonEnabled: false,

                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController _controller) async {
                      controller.mapController = _controller;
                      await cont.loadMarkerIcon();
                      cont.markers.forEach((marker) {
                        controller.mapController?.showMarkerInfoWindow(MarkerId(marker.markerId.value));
                      });

                      // for(var a in cont.markers){
                      //   print("a.markerId.value");
                      //   print(a.markerId.value);
                      //   controller.mapController?.showMarkerInfoWindow(MarkerId(a.markerId.value));
                      // }
                      // print("lkjad; ${cont.markers}");
                      // await controller.onMapCreated;
                    },

                    initialCameraPosition:
                        //  CameraPosition(
                        //     bearing: 192.8334901395799,
                        //     target: LatLng(37.43296265331129, -122.08832357078792),
                        //     tilt: 59.440717697143555,
                        //     zoom: 19.151926040649414),
                        CameraPosition(
                      target: LatLng(
                        // double.parse(cont.latSave.value),
                        // double.parse(cont.longSave.value),
                        double.parse(cont.searchedHotelList[0]["latitude"].toString()),
                        double.parse(cont.searchedHotelList[0]["longitude"].toString()),
                      ),
                      zoom: 12,
                    ),
                    // markers: {
                    //   Marker(
                    //     markerId: MarkerId("1"),
                    //     visible: true,
                    //     icon: BitmapDescriptor.defaultMarker,
                    //     position: LatLng(
                    //       double.parse(authController.latitude.value),
                    //       double.parse(authController.longitude.value),
                    //     ),
                    //   ),
                    // },
                    markers: cont.markers,

                    // markers: Set.from(num),
                  );
                }),
            // Image.network(
            //   "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
            //   fit: BoxFit.fitHeight,
            // ),

            Positioned(
              top: size.height * 0.05,
              bottom: size.height * 0.04,
              left: size.width * 0.04,
              right: size.width * 0.04,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: getPadding(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      // top: size.width * 0.04,
                    ),
                    // height: size.height * 0.1,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: ColorConstant.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.7,
                              child: Text(
                                destinationCController.placesNAMENEW.value,
                                style: AppTextStyle.txtPoppinsSemiBold18,
                              ),
                            ),
                            Row(
                              children: [
                                Text(destinationCController.rangeHotelList.value),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Container(
                                  height: size.height * 0.02,
                                  width: size.width * 0.001,
                                  color: ColorConstant.blueGray10000,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(destinationCController.roomsCount.value.toString()),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                CustomImageView(
                                    svgPath: ImageConstant.bed_icon_image,
                                    height: getSize(16.00),
                                    width: getSize(16.00),
                                    margin: getMargin(bottom: 1)),

                                // AppbarImage(
                                //   height: getSize(16.00),
                                //   width: getSize(16.00),
                                //   svgPath: ImageConstant.bed_icon_image,
                                //   margin: getMargin(right: 5),
                                //
                                //   // margin: getMargin(left: 4, top: 33, bottom: 13),
                                // ),
                                // Icon(
                                //   Icons.bed,
                                //   size: 16,
                                //   color: ColorConstant.orangeA200,
                                // ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(destinationCController.roomsCount.value.toString()),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                CustomImageView(
                                    svgPath: ImageConstant.group_icon_image,
                                    height: getSize(16.00),
                                    width: getSize(16.00),
                                    margin: getMargin(bottom: 1)),

                                // Icon(
                                //   Icons.group,
                                //   size: 16,
                                //   color: ColorConstant.orangeA200,
                                // )
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                              width: size.width * 0.08,
                              height: size.height * 0.08,
                              margin: getMargin(bottom: 20),
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorConstant.bluegray400)),
                              child: const Center(
                                  child: Icon(
                                Icons.close_outlined,
                                size: 15,
                              ))),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 155,
                    height: 41,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstant.black9004c,
                            spreadRadius: getHorizontalSize(
                              0.50,
                            ),
                            blurRadius: getHorizontalSize(
                              8.00,
                            ),
                            offset: Offset(
                              0,
                              7,
                            ),
                          ),
                        ],
                        color: ColorConstant.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ColorConstant.orangeA200, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.list,
                                  color: ColorConstant.white,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  "List",
                                  style: TextStyle(color: ColorConstant.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.02,
                          width: 0.5,
                          color: ColorConstant.white,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              HotelHelperMethods().filterBottomSheet(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.filter_list_alt,
                                  color: ColorConstant.white,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  "Filter",
                                  style: TextStyle(color: ColorConstant.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GetX<DestinationController>(
                      init: DestinationController(),
                      builder: (destinationController) {
                        return SizedBox(
                            height: size.height * 0.2,
                            width: size.width,
                            child: destinationController.searchedHotelList.length == 0
                                ? Container(
                                    margin: getMargin(right: 5),
                                    height: 149,
                                    width: size.width,
                                    decoration: BoxDecoration(color: ColorConstant.white, borderRadius: BorderRadius.circular(16)),
                                    child: Center(child: Text('No Hotel Found!')))
                                : CarouselSlider.builder(
                                    itemCount: destinationController.searchedHotelList.length,
                                    carouselController: destinationController.carouselConttroller,
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {
                                        controller.hotelName.value = destinationController.searchedHotelList[index]["hotel_name"];
                                        print(controller.hotelName.value);
                                      },
                                      viewportFraction: 1,
                                      autoPlay: false,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      aspectRatio: 1,
                                    ),
                                    itemBuilder: (context, int index, pageIndex) {
                                      var data = destinationController.searchedHotelList[index];
                                      var hotelListData = destinationController.searchedHotelList[index];
                                      return InkWell(
                                        onTap: () async {
                                          controllerr.fetchHotelDetails(
                                            hotelId: hotelListData['hotel_id'].toString(),
                                            checkIn: destinationController.selectedStartDate.value,
                                            checkOut: destinationController.selectedEndDate.value,
                                          );

                                          // if(! Get.find<HomeController>().recentlyViewHotelsList.contains(hotelListData)){
                                          //   Get.find<HomeController>().recentlyViewHotelsList.add(hotelListData);
                                          // }

                                          result.Result data = await result.Result.fromJson(destinationController.searchedHotelList[index]);

                                          Get.find<HomeController>().recentlyViewHotelsList.add(data);

                                          final ids = Get.find<HomeController>().recentlyViewHotelsList.value.map((e) => e.hotelId).toSet();
                                          Get.find<HomeController>().recentlyViewHotelsList.value.retainWhere((x) => ids.remove(x.hotelId));
                                          Get.to(() => Hotel(
                                                longitude: hotelListData['longitude'],
                                                latitude: hotelListData['latitude'],
                                                distance: hotelListData['distance'],
                                                checkIn: "${hotelListData['checkin']['from']}-${hotelListData['checkin']['until']}",
                                                checkOut: "${hotelListData['checkout']['from']}-${hotelListData['checkout']['until']}",
                                                address: hotelListData['address'],
                                                controller: destinationController,
                                                unitConfiguration: hotelListData['unit_configuration_label'],
                                                urgencyMessage: hotelListData['urgency_message'],
                                                url: hotelListData['url'].toString(),
                                                price: hotelListData['composite_price_breakdown']['all_inclusive_amount']['value'],
                                                callFrom: 'Search',
                                                back: 'true',
                                                adultCount: destinationController.adultCount.value.toString(),
                                                roomCount: destinationController.roomsCount.value.toString(),
                                                startDate: destinationController.startDate.value,
                                                endDate: destinationController.endDate.value,
                                              ));
                                          // PersistentNavBarNavigator.pushNewScreen(
                                          //   context,
                                          //   screen: Hotel(
                                          //     longitude: hotelListData['longitude'],
                                          //     latitude: hotelListData['latitude'],
                                          //     distance: hotelListData['distance'],
                                          //     checkIn: "${hotelListData['checkin']['from']}-${hotelListData['checkin']['until']}",
                                          //     checkOut: "${hotelListData['checkout']['from']}-${hotelListData['checkout']['until']}",
                                          //     address: hotelListData['address'],
                                          //     controller: destinationController,
                                          //     unitConfiguration: hotelListData['unit_configuration_label'],
                                          //     urgencyMessage: hotelListData['urgency_message'],
                                          //     url: hotelListData['url'].toString(),
                                          //     price: hotelListData['composite_price_breakdown']['all_inclusive_amount']['value'],
                                          //     callFrom: 'Search',
                                          //     adultCount: destinationController.adultCount.value.toString(),
                                          //     roomCount: destinationController.roomsCount.value.toString(),
                                          //     startDate: destinationController.startDate.value,
                                          //     endDate: destinationController.endDate.value,
                                          //   ),
                                          //   withNavBar: true, // OPTIONAL VALUE. True by default.
                                          //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                          // );
                                        },
                                        child: Container(
                                          margin: getMargin(right: 5),
                                          height: 149,
                                          decoration: BoxDecoration(color: ColorConstant.white, borderRadius: BorderRadius.circular(16)),
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: getMargin(
                                                    left: size.width * 0.010,
                                                    right: size.width * 0.04,
                                                    top: size.height * 0.02,
                                                    bottom: size.height * 0.02),
                                                height: size.height * 0.3,
                                                width: size.width * 0.30,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLSA6TgXcXFRifWUQsa5_4z9AYM44Rj7Q6kQzYl_Wk&s",
                                                          data["max_photo_url"],
                                                        ),
                                                        fit: BoxFit.fill)),
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: size.width * 0.53,
                                                      child: Text(
                                                        // "Hotel Sifat International  a",
                                                        data["hotel_name"],
                                                        style: AppTextStyle.txtPoppinsSemiBold16Black900,
                                                        overflow: TextOverflow.ellipsis,
                                                      )),
                                                  Row(
                                                    children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant.imgLocation,
                                                          height: getSize(16.00),
                                                          width: getSize(16.00),
                                                          margin: getMargin(bottom: 1)),
                                                      // Icon(
                                                      //   Icons.add_location_sharp,
                                                      //   size: 15,
                                                      //   color: ColorConstant.orangeA200,
                                                      // ),
                                                      SizedBox(
                                                        width: size.width * 0.01,
                                                      ),
                                                      Container(
                                                          width: size.width * 0.2,
                                                          child: Text(
                                                            '${data['city']} ${data['country_trans']} ',
                                                            style: AppTextStyle().txtPoppinsMedium12Black,
                                                            overflow: TextOverflow.ellipsis,
                                                          )),
                                                      SizedBox(
                                                        width: size.width * 0.04,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        color: ColorConstant.orangeA200,
                                                        size: 8,
                                                      ),
                                                      SizedBox(
                                                        width: size.width * 0.02,
                                                      ),
                                                      Container(
                                                          width: size.width * 0.2,
                                                          child: Text(
                                                            "${double.parse(data["distance"]).toStringAsFixed(0)} km away",
                                                            style: AppTextStyle().txtPoppinsMedium12Black,
                                                            overflow: TextOverflow.ellipsis,
                                                          ))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                          // width: size.width * 0.06,
                                                          child: Text(
                                                        "${data["review_score"] ?? 0.0}",
                                                        style: AppTextStyle.txtPoppinsBold14,
                                                        overflow: TextOverflow.ellipsis,
                                                      )),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "${data["review_score_word"]}",
                                                        overflow: TextOverflow.ellipsis,
                                                        style: AppTextStyle.txtPoppinsMedium12,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Align(
                                                        alignment: Alignment.centerRight,
                                                        child: CommonRatingBar(
                                                          rating: data["review_score"] ?? 0.0,
                                                          itemSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Container(
                                                    width: size.width * 0.51,
                                                    height: size.height * 0.002,
                                                    color: ColorConstant.gray10001,
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Container(
                                                    width: size.width * 0.51,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                // width: size.width * 0.27,
                                                                child: Text(
                                                                  // "${data["composite_price_breakdown"]['all_inclusive_amount']['currency']} ${(data["composite_price_breakdown"]['all_inclusive_amount']['value']).toStringAsFixed(0)}",
                                                                  destinationController.curruncy.value.toUpperCase() != "USD"
                                                                      ?
                                                                      // '${"USD"} ${(double.parse(data['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(destinationController.usdExchangeRate.value )).toStringAsFixed(0)}':
                                                                      '${"USD"} ${((int.parse("${int.parse((double.parse(data['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(destinationController.usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(data['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(destinationController.usdExchangeRate.value)).toStringAsFixed(0))}"))).toStringAsFixed(0)}'
                                                                      :
                                                                      // '${"USD"} ${(double.parse(data['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)}',
                                                                      '${"USD"} ${((int.parse("${int.parse((double.parse(data['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(data['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}"))).toStringAsFixed(0)}',
                                                                  style: AppTextStyle.txtPoppinsSemiBold16Blue500,
                                                                  // TextStyle(
                                                                  //     color:
                                                                  //         ColorConstant.blue500,
                                                                  //     fontSize: 18),
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                              Text(
                                                                  destinationController.curruncy.value.toUpperCase() != "USD"
                                                                      ? 'Included taxes and changes'
                                                                      : 'Included taxes and changes',
                                                                  style:
                                                                      TextStyle(color: Colors.black87, fontSize: 8, fontFamily: "poppins")
                                                                  // AppTextStyle
                                                                  //     .txtPoppinsMedium12Gray600,
                                                                  )
                                                              // Text(
                                                              //   "Per night on",
                                                              //   style: AppTextStyle
                                                              //       .txtPoppinsMedium12Gray800,
                                                              // )
                                                            ],
                                                          ),
                                                        ),
                                                        // Spacer(),
                                                        Expanded(
                                                          child: Container(
                                                            // width: 80,
                                                            height: 34,
                                                            decoration: BoxDecoration(
                                                                color: ColorConstant.orangeA20001, borderRadius: BorderRadius.circular(15)),
                                                            child: TextButton(
                                                              onPressed: () {
                                                                // print(hotelListData.url);
                                                                // PersistentNavBarNavigator
                                                                //     .pushNewScreen(
                                                                //   context,
                                                                //   screen: Hotel(
                                                                //       callFrom: 'Search'),
                                                                //   withNavBar: true,
                                                                //   pageTransitionAnimation:
                                                                //       PageTransitionAnimation
                                                                //           .cupertino,
                                                                // );
                                                                // DestinationRepository()
                                                                //     .openViewDealsBottomSheet(
                                                                //         context,
                                                                //         url: data[
                                                                //             'url']);

                                                                DestinationRepository().openViewDealsBottomSheet(context,
                                                                    url: "${data['url']}"
                                                                        "?checkin=${destinationController.selectedStartDate.value}"
                                                                        "&checkout=${destinationController.selectedEndDate.value}&group_adults=${destinationController.adultCount.value.toString()}"
                                                                        "&no_rooms=${destinationController.roomsCount.value.toString()}&group_children=${"2"}");
                                                                // Get.to(() => WebViewScreen(
                                                                //       title: "",
                                                                //     ));
                                                              },
                                                              child: Center(
                                                                  child: Text(
                                                                "View Deal",
                                                                style: TextStyle(color: ColorConstant.white),
                                                              )),
                                                            ),
                                                          ),
                                                        )
                                                        // CommonButton(
                                                        //   text: "View Deals",
                                                        //   height: 34,
                                                        //   width: 80,
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
