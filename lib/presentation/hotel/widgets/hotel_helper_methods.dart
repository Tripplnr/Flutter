import 'dart:developer';
import 'dart:ui';

import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

class HotelHelperMethods {
  var _controller = Get.find<HotelController>();
  var _destinationController = Get.find<DestinationController>();

  /*Filter Bottom Sheet*/
  void filterBottomSheet(context) {
    Get.bottomSheet(
      backgroundColor: Colors.transparent,
      ignoreSafeArea: false,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),

        // margin: getMargin(top: height * 0.18),
        // decoration: BoxDecoration(
        //     color: Colors.transparent, borderRadius: BorderRadius.zero
        //     // borderRadius: BorderRadius.vertical(
        //     //   top: Radius.elliptical(16, 16),
        //     // ),
        //     ),
        // width: size.width * 1,
        child: SafeArea(
          child: Container(
            // height: size.height * 0.9,
            // margin: getMargin(top: height * 0.1),
            padding: getPadding(left: 20, right: 20, top: 20, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(20, 20),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filters',
                        style: AppTextStyle.txtPoppinsSemiBold20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          // padding: getPadding(all: 15),
                          decoration: BoxDecoration(color: ColorConstant.gray200, borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              'X',
                              style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price Range',
                        style: AppTextStyle.txtPoppinsSemiBold16,
                      ),
                      InkWell(
                        onTap: () {
                          _destinationController.resetPriceSlider();
                        },
                        child: Text(
                          'Reset',
                          style: AppTextStyle.txtPoppinsMedium16Yellow900,
                        ),
                      ),
                    ],
                  ),
                  Obx(() => Container(
                        // width: size.width,
                        child: RangeSlider(
                            // labels: RangeLabels(
                            //     _controller.start.value.toString(),
                            //     _controller.end.value.toString()),
                            activeColor: ColorConstant.yellow900,
                            min: 10.0,
                            max: 5000.0,
                            divisions: 50,
                            values: RangeValues(
                                _destinationController.start.value.roundToDouble(), _destinationController.end.value.roundToDouble()),
                            onChanged: (value) {
                              _destinationController.filterEndPrice.value = value.end;
                              _destinationController.filterStartPrice.value = value.start;
                              _destinationController.minPrice.value = value.start;
                              _destinationController.maxPrice.value = value.end;
                              _destinationController.start.value = value.start;
                              _destinationController.end.value = value.end;
                            }),
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Row(
                      children: [
                        Text(
                          "Min",
                          style: AppTextStyle.txtPoppinsMedium15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Obx(() => Container(
                            height: 46,
                            width: 90,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorConstant.gray10001),
                            child: Center(
                              child: Text(
                                "\$ ${_destinationController.start.value.round().toStringAsFixed(0)}",
                                // "\$ ${start.value.round().toStringAsFixed(0)}",
                                textAlign: TextAlign.start,
                              ),
                            ))),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "Max",
                          style: AppTextStyle.txtPoppinsMedium15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => Container(
                              height: 46,
                              width: 90,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorConstant.gray10001),
                              child: Center(
                                child: Text(
                                  // "\$ 100",
                                  "\$ ${_destinationController.end.value.round().toStringAsFixed(0)}",
                                  textAlign: TextAlign.left,
                                ),
                              )),
                        )
                      ],
                    )
                  ]),

                  SizedBox(height: 15),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Parking',
                        style: AppTextStyle.txtPoppinsSemiBold16,
                      ),
                      InkWell(
                        onTap: () {
                          _destinationController.resetParkingType();
                        },
                        child: Text(
                          'Reset',
                          style: AppTextStyle.txtPoppinsMedium16Yellow900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: List.generate(_controller.items.length, (index) {
                  //     return Obx(() => CheckboxListTile(
                  //           title: Text(_controller.items[index]),
                  //           value: _controller.checkboxes.value[index],
                  //           onChanged: (value) {
                  //             _controller.updateCheckbox(index, value!);
                  //           },
                  //         ));
                  //   }),
                  // ),
                  Wrap(
                    children: [
                      Obx(() {
                        return parkingTypeList(
                          "Free",
                          // _destinationController.parkingType.value == "Free",
                        );
                      }),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(() {
                        return parkingTypeList(
                          "Paid",
                          // _destinationController.parkingType.value == "Paid",
                        );
                      }),
                    ],
                  ),

                  SizedBox(height: 15),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Options',
                        style: AppTextStyle.txtPoppinsSemiBold16,
                      ),
                      InkWell(
                        onTap: () {
                          _destinationController.resetPaymentOption();
                        },
                        child: Text(
                          'Reset',
                          style: AppTextStyle.txtPoppinsMedium16Yellow900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: List.generate(_destinationController.items.length, (index) {
                  //     return Obx(() => CheckboxListTile(
                  //           title: Text(_destinationController.items[index]),
                  //           value: _destinationController.checkboxes.value[index],
                  //           onChanged: (value) {
                  //             _destinationController.updateCheckbox(index, value!);
                  //           },
                  //         ));
                  //   }),
                  // ),
                  Wrap(
                    children: [
                      Obx(() {
                        return paymentTypeList(
                          "Free Cancellation",
                          // _destinationController.paymentOptionType.value == "Free Cancellation",
                        );
                      }),
                      SizedBox(width: 10),
                      Obx(() {
                        return paymentTypeList(
                          "Pay Later",
                          //  _destinationController.paymentOptionType.value == "Pay Later",
                        );
                      }),
                    ],
                  ),
//  test
                  SizedBox(height: 15),

                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Property type',
                        style: AppTextStyle.txtPoppinsSemiBold16,
                      ),
                      InkWell(
                        onTap: () {
                          _destinationController.resetPropertyType();
                        },
                        child: Text(
                          'Reset',
                          style: AppTextStyle.txtPoppinsMedium16Yellow900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Wrap(
                    children: [
                      Obx(() {
                        return propertyTypeList("All", _destinationController.propertyType.value == "All");
                      }),
                      SizedBox(width: 10),
                      Obx(() {
                        return propertyTypeList("Hotel", _destinationController.propertyType.value == "Hotel");
                      }),
                      SizedBox(width: 10),
                      Obx(() {
                        return propertyTypeList("Apartment", _destinationController.propertyType.value == "Apartment");
                      }),
                    ],
                  ),

                  SizedBox(height: 15),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hotel Class',
                        style: AppTextStyle.txtPoppinsSemiBold16,
                      ),
                      InkWell(
                        onTap: () {
                          _destinationController.resetHotelClass();
                        },
                        child: Text(
                          'Reset',
                          style: AppTextStyle.txtPoppinsMedium16Yellow900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    // spacing: 10,
                    runSpacing: 10,

                    direction: Axis.horizontal,
                    children: [
                      Obx(() {
                        return hotelClass("1", _destinationController.hotelClassType.value == "1");
                      }),
                      SizedBox(width: 10),
                      Obx(() {
                        return hotelClass("2", _destinationController.hotelClassType.value == "2");
                      }),
                      SizedBox(width: 10),
                      Obx(() {
                        return hotelClass("3", _destinationController.hotelClassType.value == "3");
                      }),
                      SizedBox(width: 10),
                      Obx(() {
                        return hotelClass("4", _destinationController.hotelClassType.value == "4");
                      }),
                      SizedBox(width: 10),
                      Obx(() {
                        return hotelClass("5", _destinationController.hotelClassType.value == "5");
                      }),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Property Rating',
                        style: AppTextStyle.txtPoppinsSemiBold16,
                      ),
                      InkWell(
                        onTap: () {
                          _destinationController.resetPropertyRating();
                        },
                        child: Text(
                          'Reset',
                          style: AppTextStyle.txtPoppinsMedium16Yellow900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Column(
                    children: [
                      Row(
                        children: [
                          Obx(() {
                            return propertyRating("2.5", _destinationController.parkingRatingType.value == "2.5");
                          }),
                          Obx(() {
                            return propertyRating("5", _destinationController.parkingRatingType.value == "5");
                          }),
                          Obx(() {
                            return propertyRating("7", _destinationController.parkingRatingType.value == "7");
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Obx(() {
                            return propertyRating("8.5", _destinationController.parkingRatingType.value == "8.5");
                          }),
                          Obx(() {
                            return propertyRating("10", _destinationController.parkingRatingType.value == "10");
                          }),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Row(
                  //   // crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Find me a stay close to....',
                  //       style: AppTextStyle.txtPoppinsSemiBold16,
                  //     ),
                  //     Text(
                  //       '',
                  //       style: AppTextStyle.txtPoppinsMedium16Yellow900,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 15),

                  // Container(
                  //   padding: getPadding(left: 12, right: 12),
                  //   height: 44,
                  //   decoration: BoxDecoration(color: ColorConstant.gray200, borderRadius: BorderRadius.circular(10)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Text('City Center'),
                  //       Icon(Icons.keyboard_arrow_down_outlined),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 15),
                  CustomButton(
                    height: 49,
                    text: 'Apply',
                    onTap: () {
                      print("---------");
                      _destinationController.onFilter(context);
                      Get.back();
                    },
                    width: size.width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  propertyTypeList(text, isSelected) {
    return InkWell(
      onTap: () {
        _destinationController.propertyType.value = text;
        _controller.propertyType.value = text;

        print("===>>> ${_controller.propertyType.value}");
      },
      child: Container(
        margin: getPadding(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: isSelected ? ColorConstant.yellow900 : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: isSelected ? ColorConstant.yellow900 : Color.fromARGB(255, 204, 204, 204))),
        child: Text(
          text,
          style: AppTextStyle.txtPoppinsMedium14.copyWith(
            color: isSelected ? Colors.white : Color(0xFF59534D),
          ),
        ),
      ),
    );
  }

  propertyRating(text, isSelected) {
    return InkWell(
      onTap: () {
        _destinationController.parkingRatingType.value = text;
        // _controller.parkingRatingType.value = text;

        print("===>>> ${_destinationController.propertyType.value}");
      },
      child: Row(
        // direction: Axis.horizontal,
        // // runSpacing: 10,
        // // spacing: 10,
        // alignment: WrapAlignment.start,
        // runAlignment: WrapAlignment.start,
        // crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
                color: isSelected ? ColorConstant.yellow900 : Colors.transparent,
                border: Border.all(color: isSelected ? ColorConstant.yellow900 : Colors.grey),
                // color: ColorConstant.orange50,
                borderRadius: BorderRadius.circular(26)),
            // height: 39,
            // width: 64,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    height: 18,
                    width: 18,
                    color: !isSelected ? ColorConstant.yellow900 : Colors.white,
                    svgPath: ImageConstant.imgStar,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${text} +",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: isSelected ? ColorConstant.white : Color(0xFF59534D)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }

  hotelClass(text, isSelected) {
    return InkWell(
      onTap: () {
        _destinationController.hotelClassType.value = text;
        // _controller.parkingRatingType.value = text;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            color: isSelected ? ColorConstant.yellow900 : Colors.transparent,
            border: Border.all(color: isSelected ? ColorConstant.yellow900 : Color.fromARGB(255, 204, 204, 204)),
            // color: ColorConstant.orange50,
            borderRadius: BorderRadius.circular(26)),
        height: 39,
        // width: 64,
        child: Container(
          child: ListView.builder(
              itemCount: int.parse(text),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 3, right: 3),
                  child: CustomImageView(
                    height: 18,
                    width: 18,
                    color: !isSelected ? ColorConstant.yellow900 : Colors.white,
                    svgPath: ImageConstant.imgStar,
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget parkingTypeList(text) {
    final controller = Get.find<DestinationController>();
    bool isSelected = controller.isOptionSelectedParking(text);
    return GestureDetector(
      onTap: () {
        log("===>> ${controller.parkingType.value}");

        if (isSelected) {
          // Deselect the option if already selected
          controller.deselectOptionParking(text);
          controller.parkingType.value = ''; // Reset parkingType when all options are deselected
        } else {
          controller.selectOptionParking(text);
          var selectedOptions = controller.selectedOptionsParking;
          if (selectedOptions.length == 1) {
            controller.parkingType.value = selectedOptions.first; // Assign selected value to parkingType
          } else if (selectedOptions.length == 2) {
            // When both values are selected
            if (selectedOptions.contains('Paid')) {
              controller.parkingType.value = 'Paid'; // Assign Option 1 to parkingType
            } else if (selectedOptions.contains('Free')) {
              controller.parkingType.value = 'Free'; // Assign Option 2 to parkingType
            }
          } else {
            controller.parkingType.value = ''; // Reset parkingType when more than two options are selected
          }
        }
        log("===>>> ${controller.parkingType.value}");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorConstant.yellow900 : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: isSelected ? ColorConstant.yellow900 : Color.fromARGB(255, 204, 204, 204)),
        ),
        child: Text(
          "$text Parking",
          style: AppTextStyle.txtPoppinsMedium14.copyWith(
            color: isSelected ? Colors.white : Color(0xFF59534D),
          ),
        ),
      ),
    );
  }

  Widget paymentTypeList(text) {
    final controller = Get.find<DestinationController>();
    bool isSelected = controller.isOptionSelected(text);
    return GestureDetector(
      onTap: () {
        log("===>> ${controller.paymentOptionType.value}");

        if (isSelected) {
          // Deselect the option if already selected
          controller.deselectOption(text);
          controller.paymentOptionType.value = ''; // Reset parkingType when all options are deselected
        } else {
          controller.selectOption(text);
          var selectedOptions = controller.selectedOptions;
          if (selectedOptions.length == 1) {
            controller.paymentOptionType.value = selectedOptions.first; // Assign selected value to parkingType
          } else if (selectedOptions.length == 2) {
            // When both values are selected
            if (selectedOptions.contains('Pay Later')) {
              controller.paymentOptionType.value = 'Pay Later'; // Assign Option 1 to parkingType
            } else if (selectedOptions.contains('Free Cancellation')) {
              controller.paymentOptionType.value = 'Free Cancellation'; // Assign Option 2 to parkingType
            }
          } else {
            controller.paymentOptionType.value = ''; // Reset parkingType when more than two options are selected
          }
        }
        log("===>>> ${controller.paymentOptionType.value}");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorConstant.yellow900 : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: isSelected ? ColorConstant.yellow900 : Color.fromARGB(255, 204, 204, 204)),
        ),
        child: Text(
          text,
          style: AppTextStyle.txtPoppinsMedium14.copyWith(
            color: isSelected ? Colors.white : Color(0xFF59534D),
          ),
        ),
      ),
    );
  }

  /*PRICE SLIDER*/
  // Future priceSlider() {
  //   return Get.bottomSheet(BackdropFilter(
  //     filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
  //     child: Container(
  //       // height: size.height * 0.4,
  //       padding: getPadding(left: 20, right: 20, top: 20, bottom: 10),
  //       decoration: BoxDecoration(
  //           color: ColorConstant.white,
  //           borderRadius:
  //               BorderRadius.vertical(top: Radius.elliptical(16, 16))),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Row(
  //             // crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 'Price',
  //                 style: AppTextStyle.txtPoppinsSemiBold20,
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   Get.back();
  //                 },
  //                 child: Container(
  //                   height: 32,
  //                   width: 32,
  //                   // padding: getPadding(all: 15),
  //                   decoration: BoxDecoration(
  //                       color: ColorConstant.gray200,
  //                       borderRadius: BorderRadius.circular(100)),
  //                   child: Center(
  //                     child: Text(
  //                       'X',
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           color: ColorConstant.black),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Obx(() => Container(
  //                 width: size.width * 0.9,
  //                 child: RangeSlider(
  //                     divisions: 10,
  //                     labels: RangeLabels(_controller.start.value.toString(),
  //                         _controller.end.value.toString()),
  //                     activeColor: ColorConstant.yellow900,
  //                     min: 50.0,
  //                     max: 20000.00,
  //                     values: RangeValues(
  //                         _controller.start.value.roundToDouble(),
  //                         _controller.end.value.roundToDouble()),
  //                     onChanged: (value) {
  //                       _destinationController.minPrice.value = value.start;
  //                       _destinationController.maxPrice.value = value.end;
  //                       _controller.start.value = value.start;
  //                       _controller.end.value = value.end;
  //                     }),
  //               )),
  //           Padding(
  //             padding: getPadding(left: 18, right: 15),
  //             child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     child: Row(
  //                       children: [
  //                         Text(
  //                           "min",
  //                           style: AppTextStyle.txtPoppinsSemiBold16Black900,
  //                         ),
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         // Container(
  //                         //     height: 46,
  //                         //     width: 90,
  //                         //     decoration: BoxDecoration(
  //                         //         borderRadius: BorderRadius.circular(15),
  //                         //         color: ColorConstant.gray10001),
  //                         //     child: Center(
  //                         //       child: Text(
  //                         //         "\$ 1",
  //                         //         // "\$ ${start.value.round().toStringAsFixed(0)}",
  //                         //         textAlign: TextAlign.start,
  //                         //       ),
  //                         //     )),
  //                         Obx(() => Container(
  //                             height: 46,
  //                             width: 90,
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(15),
  //                                 color: ColorConstant.gray10001),
  //                             child: Center(
  //                               child: Text(
  //                                 " ${_controller.start.value.round().toStringAsFixed(0)}",
  //                                 // "\$ ${start.value.round().toStringAsFixed(0)}",
  //                                 textAlign: TextAlign.start,
  //                               ),
  //                             ))),
  //                       ],
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: Row(
  //                       children: [
  //                         Text(
  //                           "max",
  //                           style: AppTextStyle.txtPoppinsSemiBold16Black900,
  //                         ),
  //                         SizedBox(
  //                           width: 10,
  //                         ),
  //                         Obx(
  //                           () => Container(
  //                               height: 46,
  //                               width: 90,
  //                               decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(15),
  //                                   color: ColorConstant.gray10001),
  //                               child: Center(
  //                                 child: Text(
  //                                   // "\$ 100",
  //                                   " ${_controller.end.value.round().toStringAsFixed(0)}",
  //                                   textAlign: TextAlign.left,
  //                                 ),
  //                               )),
  //                         )
  //                         // Obx(() => Container(
  //                         //     height: 46,
  //                         //     width: 90,
  //                         //     decoration: BoxDecoration(
  //                         //         borderRadius: BorderRadius.circular(15),
  //                         //         color: ColorConstant.gray10001),
  //                         //     child: Center(
  //                         //       child: Text(
  //                         //         "\$ 100",
  //                         //         // "\$ ${end.value.round().toStringAsFixed(0)}",
  //                         //         textAlign: TextAlign.left,
  //                         //       ),
  //                         //     )))
  //                       ],
  //                     ),
  //                   )
  //                 ]),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           CustomButton(
  //             onTap: () {
  //               Get.back();
  //             },
  //             width: size.width,
  //             height: 49,
  //             text: "Apply",
  //           ),
  //         ],
  //       ),
  //     ),
  //   ));
  // }

  /*Sort Bottom Sheet*/
  sortTypeList(text, isSelected) {
    return InkWell(
      onTap: () {
        _controller.sortSelect.value = text;

        print("===>>> ${_controller.sortSelect.value}");
      },
      child: Container(
        padding: getPadding(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: isSelected ? AppTextStyle.sortByTextStyleOrange : AppTextStyle.sortByTextStyleBlack,
            ),
            isSelected
                ? Icon(
                    Icons.done,
                    size: 16,
                    color: ColorConstant.yellow900,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Future sortBottomSheet() {
    return Get.bottomSheet(
      BackdropFilter(
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
          child: Wrap(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: getPadding(bottom: 10),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort By',
                      style: AppTextStyle.txtPoppinsSemiBold20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        // padding: getPadding(all: 15),
                        decoration: BoxDecoration(color: ColorConstant.gray200, borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            'X',
                            style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                return sortTypeList("Recommended", _controller.sortSelect.value == "Recommended");
              }),
              Obx(() {
                return sortTypeList("Price (Low to High)", _controller.sortSelect.value == "Price (Low to High)");
              }),
              Obx(() {
                return sortTypeList("Price (High to Low)", _controller.sortSelect.value == "Price (High to Low)");
              }),
              Obx(() {
                return sortTypeList("Reviews", _controller.sortSelect.value == "Reviews");
              }),
              // Obx(() {
              //   return sortTypeList(
              //       "Star Ratings (High to Low)",
              //       _controller.sortSelect.value ==
              //           "Star Ratings (High to Low)");
              // }),
              Obx(() {
                return sortTypeList("Distance (Near to Far)", _controller.sortSelect.value == "Distance (Near to Far)");
              }),
              CustomButton(
                  height: 49,
                  width: 335,
                  text: "Apply".tr,
                  margin: getMargin(top: 16),
                  fontStyle: ButtonFontStyle.PoppinsMedium15,
                  onTap: () {
                    print("object");

                    _destinationController.sortHotels();
                    Get.back();
                    print("object");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
