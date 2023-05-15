// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/destination/repository/destination_repository.dart';
import 'package:trippinr/presentation/home/controller/controller.dart';
import 'package:trippinr/presentation/hotel/controller/controller.dart';
import 'package:trippinr/presentation/hotel/hotel.dart';
import 'package:trippinr/presentation/hotel/widgets/hotel_helper_methods.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';

import '../home/models/popular_hotel_model.dart' as result;

class HotelList extends StatefulWidget {
  final String locationName;
  const HotelList({
    Key? key,
    required this.locationName,
  }) : super(key: key);
  @override
  State<HotelList> createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  HotelHelperMethods _helperMethods = HotelHelperMethods();

  var destinationController = Get.find<DestinationController>();
  var controller = Get.put(HotelController());

  String? startDate, endDate;
  ScrollController? _scrollController;
  ScrollController? _scrollController1;
  //  = ScrollController();
  _scrollDown() {
    _scrollController1!.animateTo(
      0,
      // _scrollController!.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
    setState(() {
      _scrollController1!.jumpTo(
        // _scrollController!.position.maxScrollExtent,
        0,
      );
    });
  }

  var _isVisible;

  @override
  void initState() {
    super.initState();
    print("dfsashjkadhjda");
    _isVisible = true;
    _scrollController1 = new ScrollController();
    _scrollController = new ScrollController();
    // _scrollController!.addListener(() {
    //   if (_scrollController!.position.userScrollDirection == ScrollDirection.reverse) {
    //     print("ddddddddd");
    //     print(_scrollController!.position.pixels);
    //     print("eeeeeeee");
    //     if (_isVisible == true) {
    //       /* only set when the previous state is false
    //          * Less widget rebuilds
    //          */
    //       print("klajfkjsf**** ${_isVisible} up"); //Move IO away from setState
    //       setState(() {
    //         _isVisible = false;
    //       });
    //     }
    //   } else {
    //     if (_scrollController!.position.userScrollDirection == ScrollDirection.forward) {
    //       if (_isVisible == false) {
    //         /* only set when the previous state is false
    //            * Less widget rebuilds
    //            */
    //         print("**** ${_isVisible} down"); //Move IO away from setState
    //         setState(() {
    //           _isVisible = true;
    //         });
    //       }
    //     }
    //   }
    //   // print("ddddddddd");
    //   // print(_scrollController!.position.pixels);
    //   // print(_scrollController!.position.hasPixels);
    //   // print(_scrollController!.position.maxScrollExtent);
    //   // print(_scrollController!.position.atEdge);
    //   if (_scrollController!.position.pixels >= _scrollController!.position.maxScrollExtent/2) {
    //   // if (_scrollController!.position.maxScrollExtent >= _scrollController!.offset/2) {
    //     // User has scrolled to the end of the list, call your function here
    //    print("end of screen");
    //   }
    //
    //
    // });

    _scrollController1!.addListener(() {
      print("rrrrrrr");

      if (_scrollController1!.position.pixels >= _scrollController1!.position.maxScrollExtent) {
        //   if (_scrollController!.position.maxScrollExtent == _scrollController!.offset) {
        // User has scrolled to the end of the list, call your function here
        if (destinationController.isLoadingPagination.value == false) {
          destinationController.isLoadingPagination.value = true;
          print("end of screen");

          if (destinationController.currentPage.value < 1000) {
            destinationController.currentPage.value++;
            destinationController.loadmoreData();
          }
        } else {
          print("isLoadind is true");
        }
      } else {
        print("notReached end");
      }
    });

    // _scrollController;
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Obx(() => destinationController.isLoading.value
        ? _shimmerLoader()
        : Scaffold(
            backgroundColor: ColorConstant.gray100,
            body: SafeArea(
              top: false,
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  setState(() {
                    if (direction == ScrollDirection.reverse) {
                      _isVisible = false;
                      print('gajkhfdsaghd');
                    } else if (direction == ScrollDirection.forward) {
                      _isVisible = true;
                    }
                  });
                  return true;
                },
                child:
                    // destinationController.isLoadingPagination.value ?CircularProgressIndicator():
                    Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          print(destinationController.searchedHotelList.length);
                        },
                        child: _appBar(context)),
                    _sortFilter(_scrollController),
                    _hotelList(),
                  ],
                ),
              ),
            ),
          ));
  }

  _shimmerLoader() {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Stack(
          children: [
            Container(
              height: 100,
              width: size.width,
              color: ColorConstant.yellow900,
            ),
            SizedBox(width: 100),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                controller: _scrollController1,
                child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    // reverse: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: getPadding(left: size.width * 0.04, top: 15, right: size.width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 380,
                              // getVerticalSize(565.00),
                              // width: getHorizontalSize(335.00),
                              padding: getPadding(
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.white,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
                                      height: 200,
                                      // height: 350,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    padding: getPadding(left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 40,
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
                                            Container(
                                              height: 10,
                                              width: 80,
                                            ),
                                            Text(
                                              '• ',
                                              style: TextStyle(
                                                color: ColorConstant.yellow900,
                                                fontSize: 24,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Container(
                                              height: 10,
                                              width: 100,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 20,
                                            ),
                                            Container(
                                              height: 10,
                                              width: 40,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CommonRatingBar(
                                              rating: 0,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 7,
                                        ),
                                        Container(
                                          height: 1,
                                          color: ColorConstant.gray200,
                                        ),
                                        Container(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 60,
                                                ),
                                                Text(
                                                  'Per night on Booking.com',
                                                  style: AppTextStyle.txtPoppinsMedium12Gray50001.copyWith(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            CustomButton(
                                              text: 'View Deals',
                                              height: 45,
                                              width: 110,
                                              fontStyle: ButtonFontStyle.PoppinsMedium15,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Positioned(
              bottom: 18,
              left: 10,
              right: 10,
              child: Center(
                child: Container(
                  width: 100,
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
                      border: Border.all(color: ColorConstant.yellow900, width: 2)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hotelList() {
    const duration = Duration(milliseconds: 300);

    return Expanded(
      child: GetX(
        builder: (_con) {
          return destinationController.searchedHotelList.length == 0
              ? Container(
                  height: size.height,
                  width: size.width,
                  // color: Colors.red,
                  padding: getPadding(top: 50),
                  child: Center(
                    child: Text("No Hotel Found!"),
                  ),
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      controller: _scrollController1,
                      child: ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          // reverse: true,
                          padding: EdgeInsets.zero,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: _con.searchedHotelList.length,
                          itemBuilder: (context, index) {
                            var hotelListData = _con.searchedHotelList[index];
                            print("fadffadfafafdaf");
                            // print(destinationController.usdExchangeRate.value);
                            // var usdExchageRate = _con.usdExchangeRate.value;

                            // if (index + 1 ==
                            //     destinationController.page.value) {
                            //   print("Enter in index");
                            //   Future.delayed(
                            //       const Duration(milliseconds: 400),
                            //           () {
                            //         print(
                            //             "Enter in Futue delayed index");
                            //         destinationController.page.value +=
                            //         20; //+=5;
                            //         destinationController.currentPage += 1;
                            //         // destinationController.loading.value =
                            //         // true;
                            //         if (destinationController
                            //             .currentPage.value -
                            //             1 ==
                            //             1000) {
                            //           return;
                            //         }
                            //         // _homeController.getAllStories();
                            //             destinationController.onTapSearchButton(context);
                            //       });
                            // }

                            return Padding(
                              padding: getPadding(
                                  left: size.width * (Get.width > 450 ? 0.02 : 0.04),
                                  top: 15,
                                  right: size.width * (Get.width > 450 ? 0.02 : 0.04)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Get.width > 450 ? 480 : 410,
                                    // getVerticalSize(565.00),
                                    // width: getHorizontalSize(335.00),
                                    padding: getPadding(
                                      left: 0,
                                      top: 0,
                                      right: 0,
                                      bottom: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.white,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () async{
                                            print("dddddddd");
                                            print(jsonEncode(hotelListData));
                                            print("dddddddd111");
                                            controller.fetchHotelDetails(
                                              hotelId: hotelListData['hotel_id'].toString(),
                                              checkIn: _con.selectedStartDate.value,
                                              checkOut: _con.selectedEndDate.value,
                                            );

                                           // if(! Get.find<HomeController>().recentlyViewHotelsList.contains(hotelListData)){
                                           //   Get.find<HomeController>().recentlyViewHotelsList.add(hotelListData);
                                           // }

                                            result.Result data = await result.Result.fromJson(_con.searchedHotelList[index]);

                                            Get.find<HomeController>().recentlyViewHotelsList.add(data);

                                            final ids = Get.find<HomeController>().recentlyViewHotelsList.value.map((e) => e.hotelId).toSet();
                                            Get.find<HomeController>().recentlyViewHotelsList.value.retainWhere((x) => ids.remove(x.hotelId));


                                            PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen: Hotel(
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
                                                adultCount: _con.adultCount.value.toString(),
                                                roomCount: _con.roomsCount.value.toString(),
                                                startDate: _con.startDate.value,
                                                endDate: _con.endDate.value,
                                              ),
                                              withNavBar: true, // OPTIONAL VALUE. True by default.
                                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(13),
                                            child: Container(
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
                                              height: Get.width > 450 ? 260 : 200,
                                              // height: 350,
                                              child: Image.network(
                                                hotelListData['max_photo_url'],
                                                // "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                                                fit: BoxFit.cover,
                                                width: size.width,
                                                // height: size.height * 0.3,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          padding: getPadding(left: 10, right: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  controller.fetchHotelDetails(
                                                    hotelId: hotelListData['hotel_id'].toString(),
                                                    checkIn: _con.selectedStartDate.value,
                                                    checkOut: _con.selectedEndDate.value,
                                                  );

                                                  result.Result data = await result.Result.fromJson(_con.searchedHotelList[index]);

                                                    Get.find<HomeController>().recentlyViewHotelsList.add(data);

                                                  final ids = Get.find<HomeController>().recentlyViewHotelsList.value.map((e) => e.hotelId).toSet();
                                                  Get.find<HomeController>().recentlyViewHotelsList.value.retainWhere((x) => ids.remove(x.hotelId));



                                                  PersistentNavBarNavigator.pushNewScreen(
                                                    context,
                                                    screen: Hotel(
                                                      longitude: hotelListData['longitude'],
                                                      latitude: hotelListData['latitude'],
                                                      distance: hotelListData['distance'],
                                                      checkIn: "${hotelListData['checkin']['from']}-${hotelListData['checkin']['until']}",
                                                      checkOut:
                                                          "${hotelListData['checkout']['from']}-${hotelListData['checkout']['until']}",
                                                      address: hotelListData['address'],
                                                      controller: destinationController,
                                                      unitConfiguration: hotelListData['unit_configuration_label'],
                                                      urgencyMessage: hotelListData['urgency_message'],
                                                      url: hotelListData['url'].toString(),
                                                      price: hotelListData['composite_price_breakdown']['all_inclusive_amount']['value'],
                                                      callFrom: 'Search',
                                                      adultCount: _con.adultCount.value.toString(),
                                                      roomCount: _con.roomsCount.value.toString(),
                                                      startDate: _con.startDate.value,
                                                      endDate: _con.endDate.value,
                                                    ),
                                                    withNavBar: true, // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                                  );
                                                },
                                                child: Text(
                                                  hotelListData['hotel_name'],
                                                  overflow: TextOverflow.ellipsis,
                                                  // 'Capital O Hotel Ocean',
                                                  style: AppTextStyle().txtstyleHotelName,
                                                ),
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.8,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        CustomImageView(
                                                          svgPath: ImageConstant.imgLocation,
                                                          height: 13.5,
                                                          width: getSize(
                                                            16.3,
                                                          ),
                                                          color: ColorConstant.yellow900,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            '${(hotelListData['city']).toUpperCase()}, ${(hotelListData['country_trans']).toUpperCase()}',
                                                            overflow: TextOverflow.ellipsis,
                                                            style: AppTextStyle().txtPoppinsMedium12Black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '• ',
                                                          style: TextStyle(
                                                            color: ColorConstant.yellow900,
                                                            fontSize: 24,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                        Text(
                                                          double.parse(hotelListData['distance_to_cc']).toStringAsFixed(1),
                                                          style: AppTextStyle.txtPoppinsMedium12Gray700.copyWith(fontSize: 12),
                                                        ),
                                                        Text(
                                                          ' Km from Centre',
                                                          style: AppTextStyle.txtPoppinsMedium12Gray700.copyWith(fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    hotelListData['review_score'] != null ? '${hotelListData['review_score']}' : "0.0",
                                                    style: AppTextStyle().txtPoppinsSemiBold14Gray90001,
                                                  ),
                                                  Text(
                                                    ' ${hotelListData['review_score_word']}',
                                                    style: AppTextStyle().txtPoppinsRegular12,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  CommonRatingBar(
                                                    rating: hotelListData['review_score'] ?? 0,
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 7,
                                              ),
                                              Container(
                                                height: 1,
                                                color: ColorConstant.gray200,
                                              ),
                                              Container(
                                                height: 7,
                                              ),
                                              Obx(
                                                () =>
                                                    // child:
                                                    Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        // // Text(
                                                        // //   '${hotelListData['composite_price_breakdown']['all_inclusive_amount']['currency']} ${(hotelListData['composite_price_breakdown']['all_inclusive_amount']['value']).toStringAsFixed(0)}',
                                                        // //   style: AppTextStyle.txtPoppinsSemiBold24blue.copyWith(fontSize: 24),
                                                        // // ),
                                                        //
                                                        // Text(
                                                        //   // '${hotelListData['price_breakdown']['currency']} ${(hotelListData['price_breakdown']['gross_price'])}',
                                                        //   '${hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['currency']} ${(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value']).toStringAsFixed(0)}',
                                                        //   style: AppTextStyle.txtPoppinsSemiBold24blue.copyWith(fontSize: 24),
                                                        // ),
                                                        // // hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value']==0?SizedBox():
                                                        // Text(
                                                        //   // '+ ${hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['currency']} ${(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'])}',
                                                        //   '+ ${hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['currency']} ${(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value']).toStringAsFixed(0)} taxes and charges',
                                                        //   style: AppTextStyle().txtPoppinsMedium12Black,
                                                        // ),

                                                        destinationController.curruncy.value.toUpperCase() != "USD"
                                                            ? destinationController.usdExchangeRate.value == ""
                                                                ? SizedBox()
                                                                : Text(
                                                                    // '${hotelListData['price_breakdown']['currency']} ${(hotelListData['price_breakdown']['gross_price'])}',
                                                                    // '${"USD"} ${(double.parse(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(destinationController.usdExchangeRate.value )).toStringAsFixed(0)}',
                                                                    '${"USD"} ${((int.parse("${int.parse((double.parse(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(destinationController.usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(destinationController.usdExchangeRate.value)).toStringAsFixed(0))}"))).toStringAsFixed(0)}',
                                                                    style: AppTextStyle.txtPoppinsSemiBold24blue.copyWith(fontSize: 24),
                                                                  )
                                                            : Text(
                                                                // '${hotelListData['price_breakdown']['currency']} ${(hotelListData['price_breakdown']['gross_price'])}',
                                                                // '${"USD"} ${(double.parse(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) ).toStringAsFixed(0)}',
                                                                '${"USD"} ${((int.parse("${int.parse((double.parse(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}"))).toStringAsFixed(0)}',
                                                                style: AppTextStyle.txtPoppinsSemiBold24blue.copyWith(fontSize: 24),
                                                              ),

                                                        // destinationController.curruncy.value.toUpperCase() !="USD"?
                                                        //
                                                        // destinationController.usdExchangeRate.value  == ""? SizedBox():
                                                        // Text(
                                                        //   // '+ ${hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['currency']} ${(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'])}',
                                                        //   '+ ${"USD"} ${(double.parse(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())* double.parse(destinationController.usdExchangeRate.value )).toStringAsFixed(0)} taxes and charges',
                                                        //   style: AppTextStyle().txtPoppinsMedium12Black,
                                                        // )
                                                        // :
                                                        // Text(
                                                        //   // '+ ${hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['currency']} ${(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'])}',
                                                        //   '+ ${"USD"} ${(double.parse(hotelListData['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0)} taxes and charges',
                                                        //   style: AppTextStyle().txtPoppinsMedium12Black,
                                                        // ),

                                                        destinationController.curruncy.value.toUpperCase() != "USD"
                                                            ? destinationController.usdExchangeRate.value == ""
                                                                ? SizedBox()
                                                                : Text(
                                                                    'Included taxes and changes',
                                                                    style: AppTextStyle().txtPoppinsMedium12Black,
                                                                  )
                                                            : Text(
                                                                'Included taxes and changes',
                                                                style: AppTextStyle().txtPoppinsMedium12Black,
                                                              ),

                                                        destinationController.curruncy.value.toUpperCase() != "USD"
                                                            ? destinationController.usdExchangeRate.value == ""
                                                                ? SizedBox()
                                                                : Text(
                                                                    'Price on Booking.com',
                                                                    style: AppTextStyle.txtPoppinsMedium12Gray50001.copyWith(fontSize: 12),
                                                                  )
                                                            : Text(
                                                                'Price on Booking.com',
                                                                style: AppTextStyle.txtPoppinsMedium12Gray50001.copyWith(fontSize: 12),
                                                              ),
                                                      ],
                                                    ),
                                                    CustomButton(
                                                      onTap: () {
                                                        print(hotelListData['url']);
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
                                                        // DestinationRepository().openViewDealsBottomSheet(context, url: hotelListData['url']);
                                                        DestinationRepository().openViewDealsBottomSheet(context,
                                                            url: "${hotelListData['url']}"
                                                                "?checkin=${destinationController.selectedStartDate.value}"
                                                                "&checkout=${destinationController.selectedEndDate.value}&group_adults=${destinationController.adultCount.value.toString()}"
                                                                "&no_rooms=${destinationController.roomsCount.value.toString()}&group_children=${"2"}");
                                                        // Get.to(() => WebViewScreen(
                                                        //       title: "",
                                                        //     ));
                                                      },
                                                      // padding: getPadding(
                                                      //     left: 5, right: 5),
                                                      text: 'View Deals',
                                                      height: 45,
                                                      width: 110,
                                                      fontStyle: ButtonFontStyle.PoppinsMedium15,
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
                                ],
                              ),
                            );
                          }),
                    ),
                    Positioned(
                      bottom: 18,
                      left: 10,
                      right: 10,
                      child: AnimatedOpacity(
                        duration: duration,
                        opacity: _isVisible ? 1 : 0,
                        child: Center(
                          child: Container(
                            width: 100,
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
                                border: Border.all(color: ColorConstant.yellow900, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.map);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: ColorConstant.white,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Text(
                                          "Map",
                                          style: TextStyle(color: ColorConstant.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Container(
                                //   height: size.height * 0.02,
                                //   width: 0.5,
                                //   color: ColorConstant.white,
                                // ),
                                // Expanded(
                                //   child: InkWell(
                                //     onTap: () {
                                //       HotelHelperMethods().filterBottomSheet();
                                //     },
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       children: [
                                //         Icon(
                                //           Icons.filter_list_alt,
                                //           color: ColorConstant.white,
                                //         ),
                                //         SizedBox(
                                //           width: size.width * 0.01,
                                //         ),
                                //         Text(
                                //           "Filter",
                                //           style:
                                //               TextStyle(color: ColorConstant.white),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 18,
                      left: 10,
                      right: 10,
                      child: AnimatedOpacity(
                        duration: duration,
                        opacity: destinationController.isLoadingPagination.value ? 1 : 0,
                        child: Center(
                          child: Container(
                            width: Get.width * 0.3,
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
                                border: Border.all(color: ColorConstant.yellow900, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.map);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Loading....",
                                          style: TextStyle(color: ColorConstant.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Container(
                                //   height: size.height * 0.02,
                                //   width: 0.5,
                                //   color: ColorConstant.white,
                                // ),
                                // Expanded(
                                //   child: InkWell(
                                //     onTap: () {
                                //       HotelHelperMethods().filterBottomSheet();
                                //     },
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       children: [
                                //         Icon(
                                //           Icons.filter_list_alt,
                                //           color: ColorConstant.white,
                                //         ),
                                //         SizedBox(
                                //           width: size.width * 0.01,
                                //         ),
                                //         Text(
                                //           "Filter",
                                //           style:
                                //               TextStyle(color: ColorConstant.white),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
        init: DestinationController(),
      ),
    );
  }

  Container _appBar(BuildContext context) {
    return Container(
      height: getVerticalSize(120.00),
      width: size.width,
      color: ColorConstant.yellow900,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // InkWell(
            //   onTap: () {
            //     // Navigator.pop(context);
            //     // Get.back();
            //     print("hello");
            //     PersistentNavBarNavigator.pushNewScreen(
            //       context,
            //       screen: SearchTabBar(),
            //       withNavBar: true, // OPTIONAL VALUE. True by default.
            //       pageTransitionAnimation: PageTransitionAnimation.cupertino,
            //     );
            //   },
            //   child: AppbarImage(
            //       margin: getMargin(left: 20),
            //       height: 24,
            //       width: 24,
            //       svgPath: ImageConstant.imgArrowleft,
            //       color: ColorConstant.whiteA700,
            //       // margin: getMargin(
            //       //   left: 20,
            //       // ),
            //       onTap: () {
            //         PersistentNavBarNavigator.pushNewScreen(
            //           context,
            //           screen: SearchTabBar(),
            //           withNavBar: true, // OPTIONAL VALUE. True by default.
            //           pageTransitionAnimation: PageTransitionAnimation.cupertino,
            //         );
            //         // onTapArrowleft2(context);
            //       }),
            //   // Container(
            //   //     margin: getMargin(left: 20),
            //   //     height: 34,
            //   //     width: 34,
            //   //     decoration: BoxDecoration(
            //   //         borderRadius: BorderRadius.circular(8),
            //   //         color: Color(0xFFFFA254)),
            //   //     child: AppbarImage(
            //   //         height: 24,
            //   //         width: 24,
            //   //         svgPath: ImageConstant.imgArrowleft,
            //   //         color: ColorConstant.whiteA700,
            //   //         // margin: getMargin(
            //   //         //   left: 20,
            //   //         // ),
            //   //         onTap: () {
            //   //           onTapArrowleft2(context);
            //   //         })),
            // ),

            Container(
              margin: getMargin(left: 15),
              height: 34,
              width: 34,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
              child: InkWell(
                onTap: () {
                  // Navigator.pop(context);
                  // Get.back();
                  print("hello");
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: SearchTabBar(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
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

            // SizedBox(
            //   width: 30,
            // ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Container(
                  width: size.width * 0.7,
                  child: AppbarSubtitle(
                    textAlign: TextAlign.center,
                    text: widget.locationName.toUpperCase(),

                    // text: '${destinationController.searchedHotelList[0].city}'
                    //     .toUpperCase(),
                    // ${destinationController.searchedHotelList[0].countryTrans}
                    //  '
                    // .toUpperCase(),
                    // margin: getMargin(right: 101, bottom: 19)
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppbarSubtitle2(
                    text: "${destinationController.rangeHotelList.value}",
                    // margin: getMargin(top: 22),
                  ),
                  Container(
                    width: 1,
                    height: 10,
                    margin: getMargin(left: 5, right: 5),
                    color: Colors.white,
                  ),
                  AppbarSubtitle2(
                    text: destinationController.roomsCount.value.toString(),
                    margin: getMargin(right: 5),
                  ),
                  AppbarImage(
                    height: getSize(16.00),
                    width: getSize(16.00),
                    svgPath: ImageConstant.imgRemixiconslin,
                    margin: getMargin(right: 5),

                    // margin: getMargin(left: 4, top: 33, bottom: 13),
                  ),
                  AppbarSubtitle2(
                    text: destinationController.adultCount.value.toString(),
                    margin: getMargin(right: 5),

                    // margin: getMargin(left: 10, top: 30, bottom: 11),
                  ),
                  AppbarImage(
                    height: getSize(16.00),
                    width: getSize(16.00),
                    margin: getMargin(right: 5),

                    svgPath: ImageConstant.imgUserWhiteA700,
                    // margin: getMargin(left: 4, top: 33, bottom: 13),
                  ),
                ],
              )
            ]),
            // Spacer(),
            AppbarImage(
              height: getSize(20.00),
              width: getSize(20.00),
              svgPath: ImageConstant.imgEdit,
              margin: getMargin(
                right: 20,
              ),
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: SearchTabBar(),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Container _sortFilter(scrollController) {
    return Container(
        width: size.width,
        padding: getPadding(left: 68, top: 17, right: 68, bottom: 17),
        color: ColorConstant.gray100,
        // decoration: AppDecoration.fillWhiteA700,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                _helperMethods.filterBottomSheet(context);
                await _scrollDown();
                print("Price");
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgfilterOrange,
                        height: getSize(20.00),
                        width: getSize(20.00),
                        margin: getMargin(top: 1, bottom: 1)),
                    Padding(
                        padding: getPadding(left: 2, bottom: 1),
                        child: Text("lbl_filter".tr,
                            overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppTextStyle.txtPoppinsMedium14Black90002)),
                  ],
                ),
              ),
            ),
          ),
          Container(
              height: getVerticalSize(22.00), width: getHorizontalSize(1.00), decoration: BoxDecoration(color: ColorConstant.blueGray100)),
          Expanded(
            child: InkWell(
              onTap: () async {
                print("jakdh");
                await _scrollDown();
                print("jafljskdh");

                _helperMethods.sortBottomSheet();
                print("Sort");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomImageView(
                      svgPath: ImageConstant.imgAirplane,
                      height: getSize(20.00),
                      width: getSize(20.00),
                      margin: getMargin(top: 1, bottom: 1)),
                  Padding(
                      padding: getPadding(left: 2, right: 3, bottom: 1),
                      child: Text("lbl_sort".tr,
                          overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppTextStyle.txtPoppinsMedium14Black90002)),
                ],
              ),
            ),
          )
        ]));
  }

  // onTapArrowleft2(context) {
  //   // Get.offAndToNamed(AppRoutes.search_tab_bar);
  //   // Get.back();
  //   Navigator.pop(context);
  // }
}

class CommonRatingBar extends StatelessWidget {
  final num rating;
  final num? multiply;
  double? itemSize;
  CommonRatingBar({
    super.key,
    required this.rating,
    this.multiply,
    this.itemSize,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating / (multiply ?? 2),
      itemCount: 5,
      itemPadding: EdgeInsets.zero,
      itemSize: itemSize ?? 24.0,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: ColorConstant.fab005,
      ),
    );
  }
}
