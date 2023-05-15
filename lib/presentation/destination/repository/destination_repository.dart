import 'dart:io';
import 'dart:ui';

import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as places;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DestinationRepository {
  // var controller = Get.put(DestinationController());
  var controller = Get.find<DestinationController>();

  /// Calendar

  openCalendar() {
    print("openCalendar");
    // Get.toNamed(AppRoutes.selectDateScreen);
    Get.bottomSheet(BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Container(
        padding: getPadding(top: 21, left: 20, right: 20, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          ),
          color: ColorConstant.whiteA700,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Date',
                  style: AppTextStyle.txtPoppinsSemiBold20,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    // padding: getPadding(all: 15),
                    decoration: BoxDecoration(
                        color: ColorConstant.gray200,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.grey, width: 0.2)),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Spacer(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SfDateRangePicker(
                onSelectionChanged: DestinationRepository().onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,



                headerHeight: 70,
                minDate: DateTime.now(),
                headerStyle: DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      color: ColorConstant.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                monthViewSettings: DateRangePickerMonthViewSettings(
                  weekendDays: <int>[0, 1, 2, 3, 4, 5, 6, 7],
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                        // backgroundColor: Color(0xFF7fcd91),
                        textStyle: TextStyle(
                            color: ColorConstant.black, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 5),

                    ),


                ),
                monthCellStyle: DateRangePickerMonthCellStyle(
                    weekendTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                rangeTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                selectionTextStyle: TextStyle(fontWeight: FontWeight.bold, ),
                selectionColor: ColorConstant.fab005,
                rangeSelectionColor: ColorConstant.fab005,
                startRangeSelectionColor: ColorConstant.yellow900,
                endRangeSelectionColor: ColorConstant.yellow900,
                todayHighlightColor: ColorConstant.yellow900,
                initialSelectedRange: PickerDateRange(
                    DateTime.now(),
                    // DateTime.now().subtract(Duration(days: 4)),
                    DateTime.now().add(const Duration(days: 2))),

              ),
            ),
            CustomButton(
                height: 49,
                width: 335,
                text: "Select".tr,
                margin: getMargin(top: 0),
                fontStyle: ButtonFontStyle.PoppinsMedium15,
                onTap: () {
                  Get.back();
                }),
          ],
        ),
      ),
    ));
  }

  onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    print("onSelectionChanged");
    if (args.value is PickerDateRange) {
      controller.range.value = '${DateFormat('d MMM').format(args.value.startDate)} -'
          // ignore: lines_longer_than_80_chars
          '${DateFormat('d MMM').format(args.value.endDate ?? args.value.startDate)}';
      controller.rangeHotelList.value = '${DateFormat('E, d MMM').format(args.value.startDate)} -'
          // ignore: lines_longer_than_80_chars
          '${DateFormat('E, d MMM').format(args.value.endDate ?? args.value.startDate)}';
      print(controller.range.value);
      controller.startDate.value = DateFormat('d MMM').format(args.value.startDate);
      controller.selectedStartDate.value = DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
      print(controller.selectedStartDate.value);
      controller.selectedEndDate.value = DateFormat('yyyy-MM-dd').format(args.value.endDate).toString();
      print(controller.selectedEndDate.value);

      controller.endDate.value = DateFormat('d MMM').format(args.value.endDate ?? args.value.startDate);
      print("onSelectionChanged ${controller.startDate.value} - ${controller.endDate.value}");
    } else if (args.value is DateTime) {
      controller.selectedDate.value = args.value.toString();
    } else if (args.value is List<DateTime>) {
      controller.dateCount.value = args.value.length.toString();
    } else {
      controller.rangeCount.value = args.value.length.toString();
    }
  }

  /*Guest List*/
  openGuestBottomSheet() {
    Get.bottomSheet(BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Container(
        // height: size.height * 0.45,
        padding: const EdgeInsets.only(left: 25, top: 10, right: 25, bottom: 10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 15)), color: Colors.white),
        child: Obx(() {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Guest List',
                    style: AppTextStyle.txtPoppinsSemiBold20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      // padding: getPadding(all: 15),
                      decoration: BoxDecoration(
                          color: ColorConstant.gray200,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.grey, width: 0.2)),
                      child: Center(
                          child: Icon(
                        Icons.close,
                        size: 15,
                      )
                          // Text(
                          //   'X',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       color: ColorConstant.black),
                          // ),
                          ),
                    ),
                  )
                ],
              ),
              bottomSheetData("Adults", controller.adultCount.value,
                  onTapAdd: controller.increaseAdultCount, onTapSub: controller.deccreaseAdultCount),

              bottomSheetData("Children", controller.childrenCount.value,
                  onTapAdd: controller.increaseChildrenCount, onTapSub: controller.deccreaseChildrenCount),

              bottomSheetData("Rooms", controller.roomsCount.value,
                  onTapAdd: controller.increaseRoomsCount, onTapSub: controller.deccreaseRoomsCount),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Age of child 1".tr,
                      // style: AppTextStyle.txtPoppinsRegular12Gray500,
                      style: AppTextStyle.txtPoppinsRegular12Black,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Obx(
                      () => DropdownButton(
                          borderRadius: BorderRadius.zero,
                          underline: Container(),
                          isExpanded: true,
                          value: controller.dropDownSelected.value,
                          items: controller.dropDownItems.map((items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newvalue) {
                            controller.selectedvalue(newvalue.toString());
                          }),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Age of child 2".tr,
                      // style: AppTextStyle.txtPoppinsRegular12Gray500,
                      style: AppTextStyle.txtPoppinsRegular12Black,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Obx(
                      () => DropdownButton(
                          borderRadius: BorderRadius.zero,
                          underline: Container(),
                          isExpanded: true,
                          value: controller.dropDownSelected1.value,
                          items: controller.dropDownItems1.map((items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newvalue) {
                            controller.selectedvalue1(newvalue.toString());
                          }),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: Text(
              //         "Age of child 2".tr,
              //         style: AppTextStyle.txtPoppinsRegular12Gray500,
              //       ),
              //     ),
              //     Spacer(),
              //     Expanded(
              //       child: Obx(
              //         () => DropdownButton(
              //             borderRadius: BorderRadius.zero,
              //             underline: Container(),
              //             isExpanded: true,
              //             value: controller.dropDownSelected.value,
              //             items: controller.dropDownItems.map((items) {
              //               return DropdownMenuItem(
              //                 value: items,
              //                 child: Text(items),
              //               );
              //             }).toList(),
              //             onChanged: (newvalue) {
              //               controller.selectedvalue(newvalue.toString());
              //             }),
              //       ),
              //     ),
              //   ],
              // ),
              CustomButton(
                  height: 49,
                  width: 335,
                  text: "Apply".tr,
                  margin: getMargin(top: 16),
                  fontStyle: ButtonFontStyle.PoppinsMedium15,
                  onTap: () {
                    Get.back();
                  })
              // CustomButton(width: size.width,height: size.height*0.09,
              // text: "btn_lbl_done".tr,
              // )
            ],
          );
        }),
      ),
    ));
  }

  Widget bottomSheetData(String headingText, int num, {onTapAdd, onTapSub, isChild}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headingText.tr,
              // style: AppTextStyle.txtPoppinsRegular12Gray500,
              style: AppTextStyle.txtPoppinsRegular12Black,
            ),
            Container(
                width: size.width * 0.3,
                height: size.height * 0.06,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: onTapSub,
                          child: Icon(
                            Icons.remove,
                            size: 15,
                          )),
                    ),
                    Expanded(child: Center(child: Text(num.toString()))),
                    Expanded(
                      child: InkWell(
                          onTap: onTapAdd,
                          child: Icon(
                            Icons.add,
                            color: ColorConstant.yellow900,
                            size: 15,
                          )),
                    )
                  ],
                ))
          ],
        ),
      ],
    );
  }

  searchLocationByName({context}) async {
    places.Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: 'AIzaSyD3B5pddwUBouIKebxQFKdkhSoiv8TXYCw',
      mode: Mode.overlay,
      strictbounds: false,
      language: 'en',
      decoration: InputDecoration(
        hintText: 'Search',
      ),
      components: [
        places.Component(places.Component.country, 'in'),
      ],
    );
    print("searchLocationByName ==> ${p?.toJson()}");
    if (p != null) {
      places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(
        apiKey: 'AIzaSyD3B5pddwUBouIKebxQFKdkhSoiv8TXYCw',
        apiHeaders: await GoogleApiHeaders().getHeaders(),
      );
      places.PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId!);
      final lat = detail.result.geometry!.location.lat;
      final lng = detail.result.geometry!.location.lng;
      print("searchLocationByName ==> ${detail.result.name}");
      controller.googleMapController.moveCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
      controller.googleMapController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
      controller.latitude.value = lat.toString();
      controller.longitude.value = lng.toString();
      String address = detail.result
          .name; //"${detail.result.addressComponents[0].shortName}, ${detail.result.addressComponents[0].}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
      controller.address.value = address;
    }
  }

  openViewDealsBottomSheet(context, {url}) {
    print("url............");
    print(url);
    Get.bottomSheet(
        backgroundColor: Colors.transparent,
        ignoreSafeArea: false,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
              height: size.height * 0.9,
              padding: const EdgeInsets.only(left: 25, top: 10, right: 25, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.elliptical(15, 15)), color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Get.back();
                          },
                          child: Text(
                            'Close',
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400,
                                color: ColorConstant.yellow900,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        Row(
                          children: [
                            Center(
                                child: Icon(
                              Icons.lock,
                              size: 15,
                            )),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "TrippInr.com.au",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.black,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            if (Platform.isAndroid) {
                              if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
                                Get.back();
                                throw Exception('Could not launch ${Uri.parse(url)}');
                              }
                            } else {
                              if (!await launchUrl(
                                Uri.parse(url),
                                // mode: LaunchMode.externalApplication
                              )) {
                                Get.back();
                                throw Exception('Could not launch ${Uri.parse(url)}');
                              }
                            }
                            Get.back();
                          },
                          child: Row(
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.img_loaderWebViewAA,
                                height: 24,
                                width: 24,
                                color: Colors.black,
                              ),
                              CustomImageView(
                                svgPath: ImageConstant.img_loaderWebViewGroup,
                                height: 24,
                                width: 24,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.img_loaderWebView_new,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 49,
                    width: 335,
                  ),
                  // CustomButton(
                  //     height: 49,
                  //     width: 335,
                  //     text: "Apply".tr,
                  //     margin: getMargin(top: 16),
                  //     fontStyle: ButtonFontStyle.PoppinsMedium15,
                  //     onTap: () {
                  //       Get.back();
                  //     })
                  // CustomButton(width: size.width,height: size.height*0.09,
                  // text: "btn_lbl_done".tr,
                  // )
                ],
              )),
        ));

    Future.delayed(Duration(seconds: 1), () async {
      if (Platform.isAndroid) {
        if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
          Get.back();
          throw Exception('Could not launch ${Uri.parse(url)}');
        }
      } else {
        if (!await launchUrl(
          Uri.parse(url),
          // mode: LaunchMode.externalApplication
        )) {
          Get.back();
          throw Exception('Could not launch ${Uri.parse(url)}');
        }
      }

      Get.back();
    });
  }
}
