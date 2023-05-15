import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';

import '../../../core/app_export.dart';

class DestinationSearchContainer extends GetView<DestinationController> {
  DestinationSearchContainer({
    super.key,
    required this.controller,
  });

  final controller;

  UserSessionController userSessionController = UserSessionController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          // margin: getMargin(top: size.height * 0.015),
          width: controller.suggestionsList.length != 0 || controller.recentAddressShow.value || controller.searchController.text.isNotEmpty
              ? Get.width
              : getHorizontalSize(335.0),
          padding: getPadding(left: 16, top: 10, right: 16, bottom: 15),
          decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("lbl_destination".tr,
                  overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppTextStyle.txtPoppinsRegular14Gray60001),
              GetBuilder<DestinationController>(
                init: DestinationController(),
                initState: (_) {},
                builder: (_) {
                  final _focusNode = FocusNode();
                  _focusNode.addListener(() {
                    // Set isTextFieldActive to true if the text field has focus, false otherwise
                    controller.recentAddressShow.value = _focusNode.hasFocus;
                  });
                  return Column(
                    children: [
                      Obx(
                        () => GestureDetector(
                          onTap: () async {},
                          child: Container(
                            height: 50,
                            decoration: AppDecoration.fillGray10001.copyWith(borderRadius: BorderRadiusStyle.circleBorder9),
                            child: TextField(
                              // focusNode: _focusNode,
                              textInputAction: TextInputAction.done, // This will change the keyboard return key to Done
                              onSubmitted: (_) {
                                // controller.recentAddressShow(false);
                                // FocusScope.of(context).unfocus();
                              },

                              onTapOutside: (on) {
                                // controller.recentAddressShow(false);
                              },
                              onTap: () async {
                                await controller.myFunction();
                                controller.recentAddress.refresh();

                                controller.recentAddressShow(true);
                                // controller.recentAddress.clear();

                                log("===>> ${controller.recentAddress.toString()}");
                              },
                              controller: _.searchController,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.clear, size: 15),
                                    onPressed: () {
                                      controller.searchController.text = "";
                                      controller.recentAddressShow(false);
                                      controller.suggestionsList.clear();
                                    },
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Container(
                                    // height: 22.0,
                                    // width: 22.00,
                                    padding: EdgeInsets.all(5),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgSearchYellow900,
                                      height: 22.0,
                                      width: 22.00,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  // contentPadding: EdgeInsets.only(bottom: 15),
                                  hintText: controller.searchContainerText.value,
                                  hintStyle: AppTextStyle.txtPoppinsRegular12Gray500.copyWith(
                                    fontSize: 14,
                                  )),
                              // style: AppTextStyle.txtPoppinsRegular12Gray500.copyWith(fontSize: 14, color: Colors.black),
                              style: AppTextStyle.txtPoppinsMedium14.copyWith(fontSize: 16),
                              onChanged: (query) => controller.getSuggestions(query),
                            ),
                          ),
                        ),
                      ),
                      Obx(() => Visibility(
                            visible: controller.recentAddressShow.value && controller.recentAddress.isNotEmpty ? true : false,
                            child: Container(
                              constraints: BoxConstraints(minHeight: Get.height * 0.9, minWidth: Get.width),
                              padding: EdgeInsets.zero,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Recent Destination Search".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle.txtPoppinsRegular14Gray60001.copyWith(fontSize: 16)),
                                  SizedBox(
                                    height: Get.height * 0.9,
                                    width: Get.width,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return Container(
                                          height: 1,
                                          color: Colors.grey,
                                        );
                                      },
                                      shrinkWrap: true,
                                      physics: const AlwaysScrollableScrollPhysics(),
                                      itemCount: controller.recentAddress.length,
                                      padding: const EdgeInsets.only(bottom: 250, left: 0, right: 0),
                                      itemBuilder: (_, index) {
                                        var itemData = json.decode(controller.recentAddress[index]);
                                        return InkWell(
                                          onTap: () {
                                            controller.searchController.text = itemData['fulladdress'];
                                            log(controller.searchController.text);
                                            controller.placesIDNEW.value = itemData['place_id'];
                                          },
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            title: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant.gray10001, borderRadius: BorderRadius.circular(10)),
                                                    child: Icon(Icons.pin_drop_outlined)),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        // "Test",
                                                        itemData['title'].toString(),
                                                        style: AppTextStyle.txtPoppinsMedium14.copyWith(fontSize: 16),
                                                      ),
                                                      Text(
                                                        // "lbl_marriott".tr,
                                                        // itemData['title'],
                                                        itemData['fulladdress'].toString(),
                                                        // maxLines: 3,
                                                        // overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppTextStyle.txtPoppinsMedium12Gray50001
                                                            .copyWith(fontWeight: FontWeight.normal, fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                InkWell(
                                                    onTap: () async {
                                                      print(itemData['place_id']);
                                                      userSessionController.setAddress(placeIdToDelete: json.encode(itemData["place_id"]));
                                                      await controller.myFunction();
                                                      controller.recentAddress.refresh();
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 20,
                                                      child: Icon(Icons.close),
                                                    )),
                                              ],
                                            ),
                                            onTap: () async {
                                              controller.searchController.text = itemData['fulladdress'];
                                              log(controller.searchController.text);
                                              controller.placesIDNEW.value = itemData['place_id'];
                                              log(controller.placesIDNEW.value);

                                              controller.recentAddressShow(false);
                                              controller.placesNAMENEW.value = itemData['title'];

                                              log(controller.searchController.value.text);

                                              controller.recentAddress.refresh();

                                              controller.isLocationSelectionScreenSelected.value = false;
                                              // controller.searchController.value = "";
                                              controller.suggestionsList.value = [];
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Obx(() => Visibility(
                            visible: controller.suggestionsList.isEmpty ? false : true,
                            child: SizedBox(
                              height: Get.height * 0.9,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 1,
                                    color: Colors.grey,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: controller.suggestionsList.length,
                                padding: const EdgeInsets.only(bottom: 250),
                                itemBuilder: (_, index) {
                                  var suggestion = controller.suggestionsList[index];
                                  var suggestionTitle = controller.suggestionListTitle[index];
                                  int newSug = suggestion.lastIndexOf(' ');
                                  var fin = suggestion.substring(0, newSug);
                                  return ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 45,
                                            width: 45,
                                            decoration:
                                                BoxDecoration(color: ColorConstant.gray10001, borderRadius: BorderRadius.circular(10)),
                                            child: Icon(Icons.pin_drop_outlined)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                suggestionTitle,
                                                style: AppTextStyle.txtPoppinsMedium14.copyWith(fontSize: 16),
                                              ),
                                              Text(
                                                // "lbl_marriott".tr,
                                                suggestion.substring(0, newSug),
                                                // maxLines: 3,
                                                // overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppTextStyle.txtPoppinsMedium12Gray50001
                                                    .copyWith(fontWeight: FontWeight.normal, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 5,
                                        // ),
                                        // InkWell(
                                        //     onTap: () async {
                                        //       // print(itemData['place_id']);
                                        //       // userSessionController.setAddress(placeIdToDelete: json.encode(itemData["place_id"]));
                                        //       // await controller.myFunction();
                                        //       // controller.recentAddress.refresh();
                                        //     },
                                        //     child: Container(
                                        //       height: 45,
                                        //       width: 45,
                                        //       child: Icon(Icons.close),
                                        //     )),
                                      ],
                                    ),
                                    onTap: () async {
                                      controller.recentAddressShow(false);

                                      int newSug = suggestion.lastIndexOf(' ');
                                      controller.searchController.text = suggestion.substring(0, newSug);
                                      List<String> words = suggestion.split(' ');
                                      String result = words.last;
                                      log(controller.searchController.value.text);

                                      String detailsRequest =
                                          'https://maps.googleapis.com/maps/api/place/details/json?place_id=$result&key=AIzaSyBBgOn1FtmzyjUnX0Xl6xMFqXYFmSEgdZg';
                                      final detailsResponse = await http.get(Uri.parse(detailsRequest));
                                      final details = json.decode(detailsResponse.body)['result'];
                                      // var lat = details['geometry']['location']['lat'];
                                      // var lng = details['geometry']['location']['lng'];
                                      // var location = details['address_components'][1]['long_name'] ?? "";
                                      // controller.currentAddressFull.value = suggestion.substring(0, newSug);
                                      // controller.currentAddressTitle.value = location;
                                      controller.placesIDNEW.value = result;
                                      controller.placesNAMENEW.value = suggestion.substring(0, newSug);
                                      var jsonString = json.encode({
                                        // 'lat': lat.toString(),
                                        // 'lng': lng.toString(),
                                        'fulladdress': suggestion.substring(0, newSug),
                                        'title': suggestionTitle,
                                        "place_id": result,
                                      });
                                      controller.myFunction();
                                      // List<String> jsonStringList = [];
                                      // jsonStringList.add(jsonString);
                                      // log(jsonStringList.toString());
                                      log(jsonString);

                                      await userSessionController.setAddress(
                                        value: jsonString,
                                      );
                                      log(userSessionController.addressList.toString());

                                      controller.recentAddress.refresh();

                                      controller.isLocationSelectionScreenSelected.value = false;
                                      // controller.searchController.value = "";
                                      controller.suggestionsList.value = [];
                                    },
                                  );
                                },
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
              Obx(() => Container(
                  margin: getMargin(top: 14),
                  padding: getPadding(left: 11, right: size.width * 0.08),
                  decoration: AppDecoration.outlineGray200,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    InkWell(
                        onTap: () {
                          controller.onTapCalendarButton();
                        },
                        child: Padding(
                            padding: getPadding(
                              bottom: 10,
                            ),
                            child:
                                Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                              Row(children: [
                                CustomImageView(svgPath: ImageConstant.imgCalendar, height: getSize(22.00), width: getSize(22.00)),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Padding(
                                    padding: getPadding(right: 20),
                                    child: Text("lbl_dates".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.txtPoppinsRegular14Gray60001))
                              ]),
                              Padding(
                                padding: getPadding(top: 5),
                                child: Text(controller.range.toString(),
                                    // controller
                                    //         .dateRangePickerController
                                    //         .selectedRange.!startDate,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.txtPoppinsMedium14Black900.copyWith(fontSize: 14)),
                              ),
                            ]))),
                    Container(
                      height: getVerticalSize(48.00),
                      width: getHorizontalSize(1.00),
                      margin: getMargin(left: 15),
                      decoration: AppDecoration.outlineGray2001,
                    ),
                    InkWell(
                      onTap: () {
                        controller.onTapGuestButton();
                      },
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                        Row(children: [
                          CustomImageView(svgPath: ImageConstant.imgGroup, height: getSize(22.00), width: getSize(22.00)),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Padding(
                              padding: getPadding(),
                              child: Text("lbl_guests".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsRegular14Gray60001))
                        ]),
                        // GestureDetector(
                        //     onTap: () {
                        //       onTapStackcreatefromframe();
                        //     },
                        //     child: Stack(
                        //         alignment:
                        //             Alignment.topLeft,
                        //         children: [
                        //           Align(
                        //               alignment: Alignment
                        //                   .centerRight,
                        //               child: Container(
                        //                   height:
                        //                       getVerticalSize(
                        //                           49.00),
                        //                   width:
                        //                       getHorizontalSize(
                        //                           151.00),
                        //                   decoration: BoxDecoration(
                        //                       border: Border(
                        //                           left: BorderSide(
                        //                               color: ColorConstant.gray200,
                        //                               width: getHorizontalSize(1.00)))))),
                        //           Align(
                        //               alignment:
                        //                   Alignment
                        //                       .topLeft,
                        //               child: )
                        //         ])),
                        Padding(
                          padding: getPadding(top: 5),
                          child: Obx(() {
                            return Text("${controller.adultCount.value} ${controller.adultCount.value>1?"Guests":"Guest"}, ${controller.roomsCount.value} ${controller.roomsCount.value>1?"Rooms":"Room"}",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppTextStyle.txtPoppinsMedium14Black900.copyWith(fontSize: 14));
                          }),
                        )
                      ]),
                    )
                  ]))),
              CustomButton(
                height: 49,
                width: controller.suggestionsList.length != 0 ||
                        controller.recentAddressShow.value ||
                        controller.searchController.text.isNotEmpty
                    ? Get.width
                    : getHorizontalSize(303),
                text: "lbl_search".tr,
                margin: getMargin(top: 18),
                onTap: () {
                  print(controller.adultCount);
                  controller.onTapSearchButton(context);

                  // PersistentNavBarNavigator.pushNewScreen(
                  //   context,
                  //   screen: HotelList(),
                  //   withNavBar: true,
                  //   pageTransitionAnimation:
                  //       PageTransitionAnimation.cupertino,
                  // );

                  // controller.fetchHotels().then((value) {
                  //   print("Pass");
                  // });
                  // Get.toNamed(AppRoutes.hotel_list);
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildSuggestions(BuildContext context, List<String> suggestions) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            controller.searchController.text = suggestion;
            // Do something with the selected suggestion
          },
        );
      },
    );
  }
}
