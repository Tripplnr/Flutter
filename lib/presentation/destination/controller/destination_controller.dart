import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'package:label_marker/label_marker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/destination/repository/destination_repository.dart';
import 'package:trippinr/presentation/home/models/popular_hotel_model.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';
import 'package:trippinr/presentation/hotel/hotel_list.dart';
import 'package:trippinr/widgets/custom_toast.dart';

import '../../settings/models/currency_model/currency_model.dart';
import '../../settings/models/currency_model/exchange_rate.dart';

class DestinationController extends GetxController {
  var address = "".obs;
  var adultCount = 1.obs;
  var apiClient = ApiClient();
  var args = DateRangePickerSelectionChangedArgs;
  //till here pagination****

  CarouselController? carouselConttroller = CarouselController();

  var childrenCount = 0.obs;
  var countryValueOfSearchedLocation = ''.obs;
  // for pagination
  // RxInt page =20.obs;
  RxInt currentPage = 0.obs;

  var curruncy = ''.obs;
  var dateCount = ''.obs;
  var dateTimeRange = "".obs;
  var dropDownItems = ["1 Year", "2 Year", "3 Year"].obs;
  var dropDownItems1 = ["1 Year", "2 Year", "3 Year"].obs;
  var dropDownSelected = "1 Year".obs;
  var dropDownSelected1 = "1 Year".obs;
  var end = 1000.0.obs;
  var endDate = "".obs;
  var filterEndPrice = 0.0.obs;
  var filterStartPrice = 0.0.obs;
  late GoogleMapController googleMapController;
  var hotelController = Get.find<HotelController>();
  var isChildVisibile = false.obs;
  // var sortOption = 'Price'.obs;
  var isDescending = true.obs;

  var isLoading = true.obs;
  RxBool isLoadingPagination = false.obs;
  var latSave = "".obs;
  var latitude = "".obs;
  var longSave = "".obs;
  var longitude = "".obs;
  var markers = <Marker>{}.obs;
  var maxPrice = 1000.0.obs;
  var maxRating = 6.0.obs;
  var minPrice = 10.0.obs;
// !!! Filter
  var minRating = 0.0.obs;

  var parkingRatingType = "".obs;
  var hotelClassType = "".obs;
  var parkingType = "".obs;
  var paymentOptionType = "".obs;
  var placesIDNEW = "".obs;
  var placesNAMENEW = "".obs;
  var propertyType = "".obs;
  var range = ''.obs;
  var rangeCount = ''.obs;
  var rangeHotelList = ''.obs;
  var roomsCount = 1.obs;
  var searchController = TextEditingController();
  var searchedHotelCurrencyList = [].obs;
  var searchedHotelList = [].obs;
  var searchedHotelListLatitude = [].obs;
  var searchedHotelListLongitude = [].obs;
  var searchedHotelListTemp = [];
  var searchedHotelListTemp1 = [].obs;
  var searchedHotelListTitle = [].obs;
  var suggestionsList = [].obs;
  var searchedHotelListUrl = [].obs;
  var selectedDate = ''.obs;
  var selectedEndDate = "".obs;
  // final places =
  //     GoogleMapsPlaces(apiKey: 'AIzaSyBxsGgMMg828LN5WtYRyhRFQuw4fyOqq_0');

  // ! Search Location
  // final suggestions = [].obs;
  final Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);

  var selectedStartDate = "".obs;
  var similarHotelsList = [].obs;
  var start = 100.0.obs;
  var startDate = "".obs;
  var usdExchangeRate = ''.obs;

  RxList<ExchangeRate?> exchangeRates = <ExchangeRate>[].obs;
  var searchContainerText = "Where would you like to go?".obs;

//! marker
  BitmapDescriptor? _markerIcon;

  // AuthController _authController = Get.find();
  UserSessionController _userSessionController = Get.find();

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    initialDateRange();
    // googleMapController;
  }

  @override
  void onReady() {
    super.onReady();
  }

// ! Filter
  RxList<String> selectedOptions = <String>[].obs; // store selected options as observable list
  RxList<String> selectedOptionsParking = <String>[].obs; // store selected options as observable list

  // void selectOption(String text) {
  //   if (!selectedOptions.contains(text)) {
  //     selectedOptions.add(text); // add option if it doesn't exist in list
  //   }
  // }

  // void deselectOption(String text) {
  //   // parkingType.value = text;
  //   log(parkingType.value);
  //   selectedOptions.remove(text); // remove option from list
  // }

  bool isOptionSelected(String text) {
    // parkingType.value = text;

    return selectedOptions.contains(text); // check if option exists in list
  }

  void selectOption(String text) {
    if (!selectedOptions.contains(text)) {
      selectedOptions.add(text); // add option if it doesn't exist in list
      paymentOptionType.value = text; // update parkingType value
    }
  }

  void deselectOption(String text) {
    selectedOptions.remove(text); // remove option from list
    paymentOptionType.value = ''; // update parkingType value
  }

  bool isOptionSelectedParking(String text) {
    // parkingType.value = text;

    return selectedOptionsParking.contains(text); // check if option exists in list
  }

  void selectOptionParking(String text) {
    if (!selectedOptionsParking.contains(text)) {
      selectedOptionsParking.add(text); // add option if it doesn't exist in list
      parkingType.value = text; // update parkingType value
    }
  }

  void deselectOptionParking(String text) {
    selectedOptionsParking.remove(text); // remove option from list
    parkingType.value = ''; // update parkingType value
  }
  // final destinationRepository = DestinationRepository();

  //  ! Search Places
  var isLocationSelectionScreenSelected = false.obs;
  var recentAddressShow = false.obs;
  var recentAddress = [].obs;

// Initialize GetStorage instance
  final box = GetStorage();

  myFunction() async {
    recentAddress.clear();
    // Read the stored value of addresses
    List<dynamic>? addresses = await box.read<List<dynamic>>(addressListString);
    addresses ??= [];

    // Do whatever you need to do with the addresses here
    for (String? address in addresses) {
      print(address);
      recentAddress.add(address);
    }
  }

  var suggestionListTitle = [].obs;
  Future<List<String>> getSuggestions(String query) async {
    suggestionsList.clear();
    suggestionListTitle.clear();
    query.length == 0 ? recentAddressShow(true) : recentAddressShow(false);
    final String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    final String type = '(locality)';
    // final String type = '(regions)';
    // final String request = '$baseURL?input=$query&types=$type&key=AIzaSyBBgOn1FtmzyjUnX0Xl6xMFqXYFmSEgdZg';
    final String request = '$baseURL?input=$query&key=AIzaSyBBgOn1FtmzyjUnX0Xl6xMFqXYFmSEgdZg';
    final response = await http.get(Uri.parse(request));
    final predictions = json.decode(response.body)['predictions'];
    final responseBody = json.decode(response.body);
    log("response.body");
    log(responseBody.toString());
    List<String> suggestions = [];
    for (var i = 0; i < predictions.length; i++) {
      String name = "${predictions[i]['description']} ${predictions[i]['place_id']}";

      var titleOne = predictions[i]['terms'].length < 2 ? "" : predictions[i]['terms'][1]["value"];
      String title = "${predictions[i]['terms'][0]["value"] ?? ""} $titleOne";
      log("title $title\ntitleOne $titleOne\n name $name");
      // "${predictions[i]['structured_formatting']['main_text']} ${predictions[i]['place_id']}";
      suggestionsList.add(name);
      suggestionListTitle.add(title);
      suggestions.add(name);
      suggestionsList.refresh();
      suggestionListTitle.refresh();
    }
    return suggestions;
  }

  Future<void> loadMarkerIcon() async {
    isLoading(true);
    final markerIconData = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(0, 0)),
      'assets/images/map_icon.png',
    );
    _markerIcon = markerIconData;
    markers.clear();
    try {
      // for (var i = 0; i < searchedHotelListLatitude.length; i++) {
      for (var i = 0; i < searchedHotelList.length; i++) {
        print(searchedHotelListTitle[i]);
        // await markers.add(
        //   Marker(
        //     markerId: MarkerId("$i"),
        //     infoWindow: InfoWindow(
        //       onTap: () {
        //         print(searchedHotelListUrl[i]);
        //       },
        //       // title: searchedHotelListTitle[i],
        //       title: curruncy.value.toUpperCase() !="USD"?
        //       "${"USD\t"}${(double.parse(searchedHotelListTitle[i].toString())* double.parse(usdExchangeRate.value )).toStringAsFixed(0)} "
        //       :  "${"USD\t"}${searchedHotelListTitle[i].toString()}",
        //       // snippet: "test"
        //     ),
        //     visible: true,
        //     icon: markerIconData,
        //     position: LatLng(
        //       double.parse(searchedHotelListLongitude[i].toStringAsFixed(4)),
        //       double.parse(searchedHotelListLatitude[i].toStringAsFixed(4)),
        //     ),
        //   ),
        // );

        await markers.addLabelMarker(LabelMarker(
            markerId: MarkerId("$i"),
            label: curruncy.value.toUpperCase() != "USD"
                ?
                // "${"USD\t"}${(double.parse(searchedHotelListTitle[i].toString())* double.parse(usdExchangeRate.value )).toStringAsFixed(0)} "
                //     :  "${"USD\t"}${searchedHotelListTitle[i].toString()}",
                '${"USD"} ${((int.parse("${int.parse((double.parse(searchedHotelList[i]['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(searchedHotelList[i]['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0))}"))).toStringAsFixed(0)}'
                : '${"USD"} ${((int.parse("${int.parse((double.parse(searchedHotelList[i]['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(searchedHotelList[i]['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}"))).toStringAsFixed(0)}',
            position: LatLng(
              // double.parse(searchedHotelListLongitude[i].toStringAsFixed(4)),
              // double.parse(searchedHotelListLatitude[i].toStringAsFixed(4)),
              double.parse(searchedHotelList[i]["latitude"].toStringAsFixed(4)),
              double.parse(searchedHotelList[i]["longitude"].toStringAsFixed(4)),
            ),
            backgroundColor: ColorConstant.yellow900,
            onTap: () {
              carouselConttroller?.animateToPage(i);
            }));
        // print("hello mto $markers");
        // update();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }

    // print(markers);

    update();
  }

  Future onFilter(context) async {
    print("0000000000");
    searchedHotelList.clear();

    print(" onFilter ==>>searchedHotelList1 ${searchedHotelList.length}");

    List filterListTemp = [];

    searchedHotelList.addAll(_userSessionController.hotelList);
    print("onFilter hotelList1 ${_userSessionController.hotelList.length}");
    print(" onFilter ==>>searchedHotelList2 ${searchedHotelList.length}");

    // : null;
    if (propertyType != "" ||
        parkingRatingType != "" ||
        paymentOptionType != "" ||
        parkingType != "" ||
        filterEndPrice != 0.0 ||
        hotelClassType != "") {
      print("1111111111111111");
      filterListTemp.clear();
      filterListTemp = searchedHotelList.where((e) {
        // log("onFilter accomodationTypeName $propertyType ${e["accommodation_type_name"]} ${(propertyType.value == "Apartment" ? e["accommodation_type_name"] == "Apartment" : e["accommodation_type_name"] == "Hotel")}");
        // log("onFilter parkingType $parkingType ${e["has_free_parking"]}  ${((parkingType.value == "Free") ? e["has_free_parking"] == 1 : e["has_free_parking"] == null ? e["has_free_parking"] == null : e["has_free_parking"] == 0)}");
        log("onFilter cancellationType ${e['class']}");
        // log("onFilter cancellationType $paymentOptionType  ${e["is_free_cancellable"]} ${(paymentOptionType == "Free Cancellation" ? e["is_free_cancellable"] == 1 : e["is_free_cancellable"] == 0)}");
        // log("onFilter price $minPrice $maxPrice ${e['composite_price_breakdown']['all_inclusive_amount']['value']} ${((e['composite_price_breakdown']['all_inclusive_amount']['value'] >= minPrice.value) && (e['composite_price_breakdown']['all_inclusive_amount']['value'] <= maxPrice.value))}");

        print("minValueR..${filterStartPrice.value} ");

        print("maxValueR..${filterEndPrice.value} ");

        // print("completteCheck${      curruncy.value.toUpperCase() !="USD"?
        // (int.parse("${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value )).toStringAsFixed(0)) +
        //     int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())* double.parse(usdExchangeRate.value )).toStringAsFixed(0))
        // }")
        //     >= filterStartPrice.value)
        //     :
        // (int.parse("${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) ).toStringAsFixed(0)) +
        //     int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))
        // }")
        //     >= filterStartPrice.value)
        //
        //     &&    curruncy.value.toUpperCase() !="USD"?
        // filterEndPrice.value != 0.0
        // // ? (e['composite_price_breakdown']['all_inclusive_amount']['value'] <= filterEndPrice.value)
        //     ? (int.parse("${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value )).toStringAsFixed(0)) +
        //     int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())* double.parse(usdExchangeRate.value )).toStringAsFixed(0))
        // }") <= filterEndPrice.value)
        // // : (e['composite_price_breakdown']['all_inclusive_amount']['value'] <= 1000000))
        //     : (int.parse("${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value )).toStringAsFixed(0)) +
        //     int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())* double.parse(usdExchangeRate.value )).toStringAsFixed(0))
        // }") <= 1000000)
        //     :
        //
        // filterEndPrice.value != 0.0
        //
        //     ? (int.parse("${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) ).toStringAsFixed(0)) +
        //     int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))
        // }") <= filterEndPrice.value)
        //
        //     : (int.parse("${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) ).toStringAsFixed(0)) +
        //     int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))
        // }") <= 1000000)}");

        // log("onFilter rating ${e['review_score']} ${(parkingRatingType.value != "" ? e['review_score'] >= (double.parse(parkingRatingType.value)) : e['review_score'] >= 0.0)}");
        print("2222222222222");
        return (propertyType.value == "Apartment"
                ? e["accommodation_type_name"] == "Apartment"
                : e["accommodation_type_name"] != "Apartment") &&
            (
                // (e['composite_price_breakdown']['all_inclusive_amount']['value'] >= filterStartPrice.value) &&
                (curruncy.value.toUpperCase() != "USD"
                        ? (double.parse(
                                "${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0))}") >=
                            filterStartPrice.value)
                        : (int.parse(
                                "${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}") >=
                            filterStartPrice.value)) &&
                    (curruncy.value.toUpperCase() != "USD"
                        ? (filterEndPrice.value != 0.0
                            // ? (e['composite_price_breakdown']['all_inclusive_amount']['value'] <= filterEndPrice.value)
                            ? (double.parse(
                                    "${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0))}") <=
                                filterEndPrice.value)
                            // : (e['composite_price_breakdown']['all_inclusive_amount']['value'] <= 1000000))
                            : (double.parse(
                                    "${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0))}") <=
                                1000000))
                        : (filterEndPrice.value != 0.0
                            ? (int.parse(
                                    "${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}") <=
                                filterEndPrice.value)
                            : (int.parse(
                                    "${int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(e['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}") <=
                                1000000)))) &&
            ((parkingType.value == "Free") ? e["has_free_parking"] == 1 : e["has_free_parking"] != 2) &&
            (hotelClassType.value != ""
                ? e['class'] >= (double.parse(hotelClassType.value))
                : e['class'] != null
                    ? e['class'] >= 0.0
                    : e['class'] != "")
            // ? e["has_free_parking"] == null
            // : e["has_free_parking"] == 0)
            &&
            (paymentOptionType == "Free Cancellation" ? e["is_free_cancellable"] == 1 : e["is_free_cancellable"] != 2) &&
            (parkingRatingType.value != ""
                ? double.parse(e['review_score']==null?"0.0":e['review_score'].toString()) >= (double.parse(parkingRatingType.value))
                : e['review_score'] != null
                    ? e['review_score'] >= 0.0
                    : e['review_score'] != "");
      }).toList();
      print("3333333333333");
      print("onFilter ==>>filterListTemp ${filterListTemp.length}");
      print("onFilter ==>>searchedHotelList3 ${searchedHotelList.length}");
      // print("onFilter ==>>T ${searchedHotelListTemp}");
      searchedHotelList.clear();
      print("onFilter ==>>searchedHotelList4 ${searchedHotelList.length}");

      searchedHotelListLatitude.clear();
      searchedHotelListLongitude.clear();
      searchedHotelListTitle.clear();
      searchedHotelListUrl.clear();
      searchedHotelList.addAll(filterListTemp);
      print("onFilter ==>>searchedHotelList5 ${searchedHotelList.length}");

      searchedHotelList.forEach((element) {
        print(element);
        searchController.text = "";
        searchedHotelListLatitude.add(element["longitude"]);
        searchedHotelListLongitude.add(element["latitude"]);
        searchedHotelListTitle.add(
            // "${int.parse((double.parse(element['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) ).toStringAsFixed(0))}"
            "${int.parse((element['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value']).toStringAsFixed(0)) + int.parse((element['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value']).toStringAsFixed(0))}");
        searchedHotelListUrl.add(element["url"]);
      });
      loadMarkerIcon();
      print("onFilter ==>>S ${searchedHotelList.length}");
      print("onFilter ==>>T ${searchedHotelListLongitude.length}");
    }
    // else {
    //   filterListTemp.clear();
    //   searchedHotelList.clear();
    //   searchedHotelList.addAll(_userSessionController.hotelList);

    //   filterListTemp = await searchedHotelList.where((e) {
    //     print(e["is_free_cancellable"]);
    //     print("onFilter ${e["is_free_cancellable"]}");

    //     return ((e['composite_price_breakdown']['all_inclusive_amount']
    //                     ['value'] >=
    //                 minPrice.value) &&
    //             (e['composite_price_breakdown']['all_inclusive_amount']
    //                     ['value'] <=
    //                 maxPrice.value))
    //         //      &&
    //         // (e["is_free_cancellable"] == null
    //         //     ? e["is_free_cancellable"]
    //         //     : e["is_free_cancellable"] == 1);
    //         ;
    //   }).toList();

    //   searchedHotelListLatitude.clear();
    //   searchedHotelListLongitude.clear();
    //   searchedHotelListTitle.clear();
    //   searchedHotelListUrl.clear();
    //   searchedHotelList.clear();
    //   searchedHotelList.addAll(filterListTemp);

    //   searchedHotelList.forEach((element) {
    //     print(element);
    //     searchController.text = "";
    //     searchedHotelListLatitude.add(element["longitude"]);
    //     searchedHotelListLongitude.add(element["latitude"]);
    //     searchedHotelListTitle.add(
    //         "${element["composite_price_breakdown"]['all_inclusive_amount']["currency"]} ${(element["composite_price_breakdown"]['all_inclusive_amount']["value"]).toStringAsFixed(0)}");
    //     searchedHotelListUrl.add(element["url"]);
    //   });
    //   loadMarkerIcon();
    //   print("onFilter");
    //   print("onFilter ==>>S ${searchedHotelList.length}");
    //   print("onFilter ==>>T ${searchedHotelListLongitude.length}");

    //   // return searchedHotelList;
    // }
  }

  resetParkingType() {
    print("aljskhf");
    parkingType.value = "";
    selectedOptionsParking.clear();
  }

  resetPriceSlider() {
    print("aljskhf");
    filterEndPrice.value = 0.0;
    start.value = 100.0;
    end.value = 1000.0;

    print(filterEndPrice.value);
  }

  resetPaymentOption() {
    print("aljskhhkf");

    paymentOptionType.value = "";
    selectedOptions.clear();
  }

  resetPropertyType() {
    print("aljsdkjskhf");
    propertyType.value = "";
  }

  resetPropertyRating() {
    print("aljskjklsdahf");

    parkingRatingType.value = "";
  }

  resetHotelClass() {
    print("aljskjklsdahf");

    hotelClassType.value = "";
  }

  resetFilter() async {
    // var tempList =
    //     await searchedHotelListTemp1.where((e) => e.hotelName != null).toList();
    // print("==>>T ${tempList.length}");

    // print(searchedHotelListTemp);
    // searchedHotelList.clear();
    // // searchedHotelList.addAll(tempList);
    // searchedHotelList.addAll(tempList);
    // searchedHotelListTemp.clear();
    // searchedHotelListTemp1.clear();

    // if (searchedHotelListTemp.length != 0 && searchedHotelList.length == 0) {
    //   searchedHotelList.addAll(searchedHotelListTemp);
    //   if (searchedHotelList.length != 0) {
    //     searchedHotelList.clear();
    //   } else {
    //   }
    // }

    update();
    return searchedHotelList;
  }

// / prints a list of Product objects with ratings between 3.0 and 4.0

//  ! SORT

  void sortHotels() async {
    final sortedHotels = await searchedHotelList.toList();
    if (hotelController.sortSelect.value == 'Recommended') {
      // sortedHotels.sort((a, b) => b.distance.compareTo(a.distance));
      // sortedHotels.sort((a, b) => a["review_score"].compareTo(b["review_score"]));
      sortedHotels.sort((a, b) => double.parse(a["review_score"]==null?"0.0":a["review_score"].toString()).compareTo(double.parse(b["review_score"]==null?"0.0":b["review_score"].toString())));
      // sortedHotels
      //     .sort((a, b) => a.reviewScoreWord.compareTo(b.reviewScoreWord));
    } else if (hotelController.sortSelect.value == 'Price (High to Low)') {
      // sortedHotels.sort((a, b) => a["composite_price_breakdown"]["all_inclusive_amount"]['value']
      //     .compareTo(b["composite_price_breakdown"]["all_inclusive_amount"]['value']));

      curruncy.value.toUpperCase() != "USD"
          ? sortedHotels.sort((a, b) => int.parse(
                  "${int.parse((double.parse(b['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(b['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0))}")
              .compareTo(int.parse(
                  "${int.parse((double.parse(a['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(a['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0))}")))
          : sortedHotels.sort((a, b) => int.parse(
                  "${int.parse((double.parse(b['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(b['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}")
              .compareTo(int.parse(
                  "${int.parse((double.parse(a['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(a['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}")));
    } else if (hotelController.sortSelect.value == 'Price (Low to High)') {
      // sortedHotels.sort((a, b) => b["composite_price_breakdown"]["all_inclusive_amount"]['value']
      //     .compareTo(a["composite_price_breakdown"]["all_inclusive_amount"]['value']));

      curruncy.value.toUpperCase() != "USD"
          ? sortedHotels.sort((a, b) => int.parse(
                  "${int.parse((double.parse(a['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(a['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0))}")
              .compareTo(int.parse(
                  "${int.parse((double.parse(b['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0)) + int.parse((double.parse(b['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString()) * double.parse(usdExchangeRate.value)).toStringAsFixed(0))}")))
          : sortedHotels.sort((a, b) => int.parse(
                  "${int.parse((double.parse(a['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(a['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}")
              .compareTo(int.parse(
                  "${int.parse((double.parse(b['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value'].toString())).toStringAsFixed(0)) + int.parse((double.parse(b['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value'].toString())).toStringAsFixed(0))}")));
    } else if (hotelController.sortSelect.value == 'Reviews') {
      // sortedHotels.sort((a, b) => b["review_score"].compareTo(a["review_score"]));
      sortedHotels.sort((a, b) => double.parse(b["review_score"]==null?"0.0":b["review_score"].toString()).compareTo(double.parse(a["review_score"]==null?"0.0":a["review_score"].toString())));

    } else if (hotelController.sortSelect.value == 'Distance (Near to Far)') {
      sortedHotels.sort((a, b) => double.parse(a['distance_to_cc']).compareTo(double.parse(b['distance_to_cc'])));
      // sortedHotels.sort((a, b) => a.distance.compareTo(b.distance));
    }
    //  else {
    //   sortedHotels.sort((a, b) => b.reviewScore.compareTo(a.reviewScore));
    //   sortedHotels
    //       .sort((a, b) => b.reviewScoreWord.compareTo(a.reviewScoreWord));
    //   sortedHotels.sort((a, b) => a.distance.compareTo(b.distance));
    // }

    // if (isDescending.value) {
    //   sortedHotels.reversed;
    // }

    searchedHotelList.value = sortedHotels;

    // print(searchedHotelList.value[0].url);

    update();
  }

  // Future<List> getSuggestions(String query) async {
  //   try {
  //     final List<Location> locations = await locationFromAddress(query);
  //     return locations.map((location) => location.latitude).toList();
  //   } on Exception catch (e) {
  //     print(e.toString());
  //     return <String>[];
  //   }
  // }

  initialDateRange() {
    print("initialDateRange");
    startDate.value = DateTime.now().format('d MMM').toString();
    var startDateTemp = DateTime.now().format('E, d MMM').toString();

    selectedStartDate.value = DateTime.now().format('yyyy-MM-dd').toString();
    selectedEndDate.value = DateTime.now().add(const Duration(days: 2)).format('yyyy-MM-dd').toString();
    endDate.value = DateTime.now().add(const Duration(days: 2)).format('d MMM').toString();
    var endDateTemp = DateTime.now().add(const Duration(days: 2)).format('E, d MMM').toString();
    print("initialDateRange ${startDate.value} - ${endDate.value}");
    range.value = "${startDate.value}-${endDate.value}";
    rangeHotelList.value = "${startDateTemp}-${endDateTemp}";
  }

  onslectedDate(String value) {
    dateTimeRange.value = value;
  }

  onselectedDate(String value) {
    selectedDate.value = value;
  }

  void selectedvalue(String value) {
    dropDownSelected.value = value;
  }

  void selectedvalue1(String value) {
    dropDownSelected1.value = value;
  }

  //Adult Count
  increaseAdultCount() {
    adultCount.value >= 1 ? adultCount.value++ : adultCount.value == 1;
  }

  deccreaseAdultCount() {
    adultCount.value > 1 ? adultCount.value-- : adultCount.value == 1;
  }

  //Children Count

  increaseChildrenCount() {
    childrenCount.value >= 0 ? childrenCount.value++ : childrenCount.value == 0;
  }

  deccreaseChildrenCount() {
    childrenCount.value > 0 ? childrenCount.value-- : childrenCount.value == 0;
  }

  //Rooms Count

  increaseRoomsCount() {
    roomsCount.value >= 1 ? roomsCount.value++ : roomsCount.value == 1;
  }

  deccreaseRoomsCount() {
    roomsCount.value > 1 ? roomsCount.value-- : roomsCount.value == 1;
  }

  onTapCalendarButton() {
    print("onTapCalendarButton");
    DestinationRepository().openCalendar();
    print(range.value);
  }

  onTapGuestButton() {
    print("onTapGuestButton");
    DestinationRepository().openGuestBottomSheet();
    print(range.value);
  }

  onTapSearchButton(context, {callFrom}) async {
    isLoadingPagination.value = false;
    currentPage.value = 0;
    usdExchangeRate.value = "";
    if (searchController.value.text == "") {
      CustomToast.showToast(mesage: "Please Enter your destination location.");
    } else
      // var dayAfterFive = DateTime.now().add(Duration(days: 2));
      // var currentDate = DateFormat('yyyy-MM-dd').parse(DateTime.now().toString());
      // var formattedDayAfterFive =
      //     "${dayAfterFive.year}-${dayAfterFive.month.toString().padLeft(2, "0")}-${dayAfterFive.day.toString().padLeft(2, "0")}";
      // var apiFormattedDate =
      //     DateFormat('yyyy-MM-dd').parse(dayAfterFive as String);
      // print(int.parse(formattedDayAfterFive));
      /*Working but gives zero results*/
      isLoading(true);
    final String detailsRequest =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placesIDNEW&key=AIzaSyBBgOn1FtmzyjUnX0Xl6xMFqXYFmSEgdZg';
    final detailsResponse = await http.get(Uri.parse(detailsRequest));
    final details = json.decode(detailsResponse.body)['result'];
    print("details.....");
    print(details);
    log(detailsResponse.body.toString());
    double lat = details['geometry']['location']['lat'];
    double lng = details['geometry']['location']['lng'];
    latSave.value = lat.toString();
    longSave.value = lng.toString();
    log("lat.toString()");
    log(lat.toString());
    log(lng.toString());

    for (var a in details['address_components']) {
      if (a["types"][0] == "country") {
        print("kjkkkkkkkkkkkkkkkkkkkkk");
        print(a["long_name"]);
        countryValueOfSearchedLocation.value = a["long_name"];
        break;
      }
    }
    // EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    callFrom == "Filter"
        ? null
        : PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: HotelList(
              locationName: placesNAMENEW.value,
            ),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
    update();
    print("fetchPopularHotels");
    var body = {
      "room_number": roomsCount.value.toString(),
      // "room_number": "5",
      "locale": "en-gb",
      // "longitude": _authController.longitude.value,
      "filter_by_currency": _userSessionController.currency ?? "USD",

      // "latitude": _authController.longitude.value,
      "units": "metric",
      "adults_number": adultCount.value.toString(),
      "checkout_date": selectedEndDate.value,
      "checkin_date": selectedStartDate.value,

      // "checkout_date": "2023-09-06",
      // "checkin_date": "2023-09-05",

      "longitude": lng.toString(),

      "latitude": lat.toString(),
      // "longitude": _authController.longitude.value,

      // "latitude": _authController.latitude.value,

      // "latitude": "65.9667",
      // //
      // "longitude": "-18.5333",

      "order_by": "popularity",
      "page_number": "0",
      // "checkout_date": apiFormattedDate,
      // "filter_by_currency": _authController.currencyCode.value,
    };
    log("===>> ${body.toString()}");
    print(adultCount);
    // searchedHotelListTemp.clear();
    try {
      similarHotelsList.clear();
      var response = await apiClient.callGetApi(
        ApiConstant.homePopularHotelEndPoint,
        body,
      );
      // var currencyListReposnse = await apiClient.callGetApi(ApiConstant.HotelExchangeRateEndPoint, {});
      // log('responseeee ${response['result'][20]}');
      var longitude = [];
      var latitude = [];
      print("checkkkkl00");
      log("r====>>>>>${response['result']}");
      print("checkkkkl001");
      PopularHotelModel _popularHotelModel = PopularHotelModel.fromJson(response);
      if (searchController.value != "") {
        searchController.clear();
        placesIDNEW.value = "";
        // searchedHotelCurrencyList.value = currencyListReposnse['exchange_rates'];
        // var jsonData = json.decode(response.body);
        // print('test');
        // log("fetchPopularHotel response.body ==> ${response["result"]} ");
        print("checkkkkl");
        print(searchedHotelListTemp.length);

        searchedHotelListTemp.clear();
        print("checkkkklppppppppp");
        print(searchedHotelListTemp.length);

        searchedHotelListTemp = List.from(response['result']);
        print("checkkkklppppppppp111");
        print(searchedHotelListTemp.length);
        searchedHotelListTemp.sort((a, b) => double.parse(b["review_score"]==null?"0.0":b["review_score"].toString()).compareTo(double.parse(a["review_score"]==null?"0.0":a["review_score"].toString())));
        print("checkkkklppppppppp222");
        searchedHotelListTemp.removeWhere(
            (element) => element["country_trans"].toString().toLowerCase() != countryValueOfSearchedLocation.value.toLowerCase());
        print("checkkkklppppppppp3333");
        // for(var a in searchedHotelList){
        //   if(a["country_trans"].toString().toLowerCase() != countryValueOfSearchedLocation.value.toLowerCase()){
        //     searchedHotelList.remove(a);
        //   }
        //
        // }

        // searchedHotelList.value = _popularHotelModel.result!;
        // sort((a, b) => b["review_score"].compareTo(a["review_score"]))
        print("checkkkkl");
        print(searchedHotelList.length);


        searchedHotelList.clear();
        print("checkkkkl1111111");
        print(searchedHotelList.length);
        searchedHotelList.value = response['result'];
        searchedHotelList.value.sort((a, b) => double.parse(b["review_score"]==null?"0.0":b["review_score"].toString()).compareTo(double.parse(a["review_score"]==null?"0.0":a["review_score"].toString())));
        print("checkkkklqqqqqqqqqqqqqq");
        searchedHotelList.value.removeWhere(
            (element) => element["country_trans"].toString().toLowerCase() != countryValueOfSearchedLocation.value.toLowerCase());
        curruncy.value = searchedHotelList.value[0]["currencycode"];
        print("curruncyCode.. ${curruncy.value}");
        if (curruncy.value.toUpperCase() != "USD") {
          await currencyLists(curruncy.value);
        }

        var ttt = response['result'];
        ttt.removeWhere(
            (element) => element["country_trans"].toString().toLowerCase() != countryValueOfSearchedLocation.value.toLowerCase());

        _userSessionController.setHotelList(List.from(ttt));
        var similarHotel = [];
        similarHotelsList.value = _popularHotelModel.result!;
        // similarHotel = _popularHotelModel.result!;
        // var filterSimilar = similarHotel
        //     .where((element) => double.parse(element.distance) <= 20.0);
        // log("similar ${filterSimilar.length} ${searchedHotelList.length}");
        // similarHotelsList.addAll(filterSimilar);
        log("similar ${similarHotelsList.length}");
        // log(_popularHotelModel.result);
        // _userSessionController.setHotelList(_popularHotelModel.result!);
        // print(_userSessionController.hotelList);
        log("similar ${_popularHotelModel.result}");

        // longitude = response["result"];
        searchedHotelListLatitude.clear();
        searchedHotelListLongitude.clear();
        searchedHotelListTitle.clear();
        searchedHotelListUrl.clear();
        searchedHotelList.forEach((element) {
          print("hellllo ${element['review_score']} ${element['review_score_word']}");
          // log();
          searchController.text = "";
          searchedHotelListLatitude.add(element["longitude"]);
          searchedHotelListLongitude.add(element["latitude"]);
          searchedHotelListTitle.add(
              // "${element["composite_price_breakdown"]['all_inclusive_amount']["currency"]} ${(element["composite_price_breakdown"]['all_inclusive_amount']["value"]).toStringAsFixed(0)}"
              "${int.parse((element['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value']).toStringAsFixed(0)) + int.parse((element['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value']).toStringAsFixed(0))}");
          searchedHotelListUrl.add(element["url"]);
        });
        print("listttt $longitude ");
        log("listttt $searchedHotelListLatitude ");
        print("listttt $searchedHotelListLongitude ");
        // searchedHotelListLatitude.value = _popularHotelModel.result!;
        // print(searchedHotelList[0].url);
        // PersistentNavBarNavigator.pushNewScreen(
        //   context,
        //   screen: HotelList(),
        //   withNavBar: true,
        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
        update();
        return true;
      } else {
        callFrom == "Filter" ? null : Navigator.pop(context);
        return false;
      }
    } catch (e) {
      print("fetchPopularHotel exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // EasyLoading.dismiss();
      update();
    }
  }

  loadmoreData() async {
    print("loadmore called");
    print(currentPage.value);
    try {
      var body = {
        "room_number": roomsCount.value.toString(),
        // "room_number": "5",
        "locale": "en-gb",

        "filter_by_currency": _userSessionController.currency ?? "USD",

        "units": "metric",
        "adults_number": adultCount.value.toString(),
        "checkout_date": selectedEndDate.value,
        "checkin_date": selectedStartDate.value,

        "longitude": longSave.value.toString(),

        "latitude": latSave.value.toString(),

        "order_by": "popularity",
        "page_number": currentPage.value.toString(),
        // "checkout_date": apiFormattedDate,
        // "filter_by_currency": _authController.currencyCode.value,
      };
      log("ccccccccccc..${body.toString()}");
      // [log] {room_number: 1, locale: en-gb, filter_by_currency: USD, units: metric, adults_number: 1, checkout_date: 2023-04-23, checkin_date: 2023-04-21, latitude: 1.352083, longitude: 103.819836, order_by: popularity, page_number: 1}
      // [log] {room_number: 1, locale: en-gb, filter_by_currency: USD, units: metric, adults_number: 1, checkout_date: 2023-04-23, checkin_date: 2023-04-21, longitude: 103.819836, latitude: 1.352083, order_by: popularity, page_number: 1}

      print("1111111");
      var response = await apiClient.callGetApi(
        ApiConstant.homePopularHotelEndPoint,
        body,
      );
      print("222222");
      if (response != null && response['result'] != null) {
        print("1111111");
        log("response['result']");
        log("r====>>>>>${response['result']}");
        // if(response['result']!=[]) {
        response['result'].removeWhere(
            (element) => element["country_trans"].toString().toLowerCase() != countryValueOfSearchedLocation.value.toLowerCase());

        // for (var a in response['result']) {
        //   // searchedHotelListTemp.add(a);
        //
        //   searchedHotelList.add(a);
        //
        //   // searchedHotelListLatitude.add(a["longitude"]);
        //   // searchedHotelListLongitude.add(a["latitude"]);
        //   // searchedHotelListTitle.add(
        //   //   // "${element["composite_price_breakdown"]['all_inclusive_amount']["currency"]} ${(element["composite_price_breakdown"]['all_inclusive_amount']["value"]).toStringAsFixed(0)}"
        //   //     "${(a['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value']).toStringAsFixed(0)}"
        //   //
        //   // );
        //
        // }

        searchedHotelList.value.addAll(response['result']);
        searchedHotelList.value.forEach((element) {
          print("hellllo ${element['review_score']} ${element['review_score_word']}");
          // log();
          searchController.text = "";

          searchedHotelListLatitude.add(element["longitude"]);
          searchedHotelListLongitude.add(element["latitude"]);
          searchedHotelListTitle.add(
              // "${element["composite_price_breakdown"]['all_inclusive_amount']["currency"]} ${(element["composite_price_breakdown"]['all_inclusive_amount']["value"]).toStringAsFixed(0)}"
              "${int.parse((element['composite_price_breakdown']['product_price_breakdowns'][0]['net_amount']['value']).toStringAsFixed(0)) + int.parse((element['composite_price_breakdown']['product_price_breakdowns'][0]['included_taxes_and_charges_amount']['value']).toStringAsFixed(0))}");
          searchedHotelListUrl.add(element["url"]);
        });

        searchedHotelListTemp.addAll(List.from(searchedHotelList.value));

        Future.delayed(Duration(seconds: 2)).then((value) {
          isLoadingPagination.value = false;
        });

        update();
        // }
      }
    } catch (e) {
      print("excep...${e}");
    } finally {}
  }

  Future currencyLists(String currencyCode) async {
    print("getCurrrnc");
    var query = {
      "currency": currencyCode.toUpperCase(),
      "locale": 'en-gb',
    };
    print("currencyList");
    try {
      isLoading(true);
      var response = await apiClient.callGetApi(
        ApiConstant.CurrencyListEndPoint,
        query,
      );
      print("currencyList response response");
      var currencyModel = CurrencyModel.fromMap(response);
      print("currencyList $currencyModel");

      if (currencyModel.exchangeRates != null) {
        update();
        // currencyListModel.value = currencyModel.exchangeRates;
        exchangeRates.clear();
        exchangeRates.value.addAll(currencyModel.exchangeRates!);
        // await (response['exchange_rates'] as List<dynamic>)
        //     .map((e) => ExchangeRate.fromMap(e as Map<String, dynamic>))
        //     .toList();
        // exchangeRates.clear();

        for (var a in exchangeRates) {
          if (a?.currency?.toUpperCase() == "USD") {
            usdExchangeRate.value = a?.exchangeRateBuy ?? "";
            print("usdExchangeRate.value");
            print(usdExchangeRate.value);
            break;
          }
        }

        print("currencyList $exchangeRates");
        return true;
      } else {
// CustomToast.showToast(mesage: response['message'].toString());
        // print("currencyList $currencyListAPI");

        update();
        return false;
      }
    } catch (e) {
      isLoading(false);
// await EasyLoading.dismiss();
// CustomToast.showToast(mesage: e.toString());
      print("currencyList Exception $e");
      return false;
    } finally {
      isLoading(false);
      update();
// await EasyLoading.dismiss();
    }
    update();
  }

  onTapDestinationSearch({context}) {
    print("onTapDestinationSearch");
    DestinationRepository().searchLocationByName(context: context);
  }
}
