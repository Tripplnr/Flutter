import 'dart:developer';

import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/destination/controller/controller.dart';
import 'package:trippinr/presentation/hotel/models/hotel_details/hotel_details_model.dart';
import 'package:trippinr/presentation/hotel/models/hotel_details/hotel_reviews_model.dart';

class HotelController extends GetxController with GetSingleTickerProviderStateMixin {
  // var destinationController = Get.put(DestinationController());
  // var destinationController = Get.find<DestinationController>();

  late TabController tabController;
  UserSessionController _userSessionController = Get.find();
  var apiClient = ApiClient();
  var showAllReviews = false.obs;
  var showAllAmenties = false.obs;
  var showAllDescription = false.obs;
  /*Filter Bottom Sheet*/
  final checkboxes = [false, false, false, false, false].obs;
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  final amentiesItems = ['Washing Machine', 'Iron', 'Led', 'Greaser', 'Roof View'];
  var isLoading = false.obs;
  var hotelDetails = HotelDetails().obs;
  var hotelPhotos = [].obs;
  var hotelRooms = [].obs;
  var hotelReviews = HotelReviewsModel().obs;
  var hotelAmenties = [].obs;
  var nearByPlaces = [].obs;
  var hotelReviewWord = [].obs;
  var hotelReviewWordScore = [].obs;
  var mapLocationLink = "".obs;
  // var hotelAmenties = HotelAmentiesModel().obs;
  // var hotelPhotos = HotelPhotosModel().obs;
  var hotelDescription = "".obs;
  var isExpanded = <bool>[
    false,
    false,
    false,
    false,
    false,
  ].obs;
  // var isExpanded = <bool>[].obs;

  void updateReadMore(index) {
    isExpanded[index] = !isExpanded[index];
  }

  void updateCheckbox(int index, bool value) {
    checkboxes[index] = value;
  }

  var index = 0.obs;
  // var start = 51.0.obs;
  // var end = 500.0.obs;
  var sortSelect = "Recommended".obs;
  var propertyType = "".obs;
  var parkingType = "".obs;
  var parkingRatingType = "".obs;
  var paymentOptionType = "".obs;
  var sortItemList = [
    "Recommended",
    "Price (Low to High)",
    "Price (High to Low)",
    "Star Ratings (High to Low)",
    "Distance (Near to Far)",
  ];

  var imgIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(vsync: this, length: 3);
    List.generate(15, (_) => false);
    // SharedPref.getAuthToken().then((token) {
    //   print("value of token is 3333${token}");
    // });
    super.onInit();
  }

  @override
  void onClose() {
    // tabController.dispose();
    super.onClose();
    // tabController.dispose();
    // Get.delete<HotelController>();
    print("HotelController onClose");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // tabController.dispose();
    // tabController.close();

    print("HotelController Dispose");
  }

  Future fetchHotelDetails({hotelId, checkIn, checkOut}) async {
    isLoading(true);
    // EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    print("fetchHotelDetails");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );
      var _hotelDetails = HotelDetails.fromJson(response);
      if (_hotelDetails != null) {
        hotelDetails.value = _hotelDetails;
        /*Hotel Full API Calls*/
        await fetchHotelPhotos(hotelId: hotelId);
        await fetchHotelDescription(hotelId: hotelId);
        await fetchHotelReviews(hotelId: hotelId);
        await fetchHotelAmenties(hotelId: hotelId);
        await fetchHotelRooms(hotelId: hotelId, checkIn: checkIn, checkOut: checkOut);
        await fetchHotelMapLocation(hotelId: hotelId);
        await fetchHotelMainReviewsList(hotelId: hotelId);
        await fetchHotelNearbyCities(hotelId: hotelId);

        print("kjafshalkjshakjlshfjkadlhs");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelDetails exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelDescription({hotelId}) async {
    // isLoading(true);
    // EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    print("fetchHotelDescription");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsDescriptionEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );
      // print('response ===>>> $response');
      if (response != null) {
        print("fetchHotelDescription response\n ==> ${response["descriptiontype_id"]} ");
        hotelDescription.value = response["description"];

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelDescription exception ==> ${e.toString()}");
      return false;
    } finally {
      // isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelRooms({hotelId, checkIn, checkOut}) async {
    var startDate = DateTime.now().format('yyyy-MM-dd').toString();
    var endDate = DateTime.now().add(const Duration(days: 1)).format('yyyy-MM-dd').toString();
    // isLoading(true);
    // EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
    print("fetchHotelDescription");
    print(hotelId);
    print(endDate);
    print(startDate);
    print(checkIn);
    print(checkOut);
    print(Get.find<DestinationController>().selectedStartDate.value);

    try {
      var response = await apiClient.callGetApi(
        ApiConstant.HotelRoomsEndPoint,
        {
          "hotel_id": hotelId,
          "locale": "en-gb",
          "checkout_date": checkOut ?? endDate,
          "checkin_date": checkIn ?? startDate,
          // "checkout_date": endDate,
          // "checkin_date": startDate,
          // "checkout_date": '2023-09-24',
          // "checkin_date": '2023-09-23',
          "adults_number_by_rooms": checkIn==null ? "1":Get.find<DestinationController>().adultCount.value.toString(),
          // "adults_number_by_rooms":
          // destinationController.adultCount.value.toString(),
          "units": "metric",
          // "currency": "INR",
          "currency": _userSessionController.currency,
        },
      );
      // print('response ===>>> $response');
      if (response != null) {
        print("hotelRooms response ==>");
        log("hotelRooms response ==> ${((response[0]['rooms'].values.toList())[0]['facilities']).length} \n\n RRR");

        // log("hotelRooms response ==> ${response[0]['block'][0]["price_breakdown"]['gross_price']} \n\n");
        // log("hotelRooms response ==> ${response[0]['block'][0]} \n\n RRR");
        hotelRooms.value = response[0]['block'];

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("hotelRooms exception ==> ${e.toString()}");
      return false;
    } finally {
      // isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelReviews({hotelId}) async {
    print("fetchHotelReviews");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsReviewsEndPoint,
        {
          "hotel_id": hotelId,
          "language_filter": "en-gb",
          "locale": "en-gb",
          "sort_type": "SORT_MOST_RELEVANT",
        },
      );
      log('fetchHotelReviews response ===>>> $response');
      var _hotelReviews = HotelReviewsModel.fromJson(response);

      if (_hotelReviews.count != 0) {
        print("fetchHotelReviews ${_hotelReviews.result!.length}");

        isExpanded.assignAll(List.generate(_hotelReviews.result!.length, (_) => false));
        hotelReviews.value = _hotelReviews;

        return true;
      } else {
        hotelReviews.value = HotelReviewsModel.fromJson(response);
        return false;
      }
    } catch (e) {
      print("fetchHotelReviews exception ==> ${e.toString()}");
      return false;
    } finally {
      // isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelPhotos({hotelId}) async {
    print("fetchHotelPhotos");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsPhotosEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );

      print('response ===>>> $response');

      if (response[0]['url_1440'] != "") {
        hotelPhotos.value = response;

        print("fetchHotelPhotos ${hotelPhotos.value.length}");

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelPhotos exception ==> ${e.toString()}");
      return false;
    } finally {
      // isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelNearbyCities({hotelId}) async {
    print("fetchHotelNearbyCities");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.HotelNearByPlacesEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );

      print('fetchHotelNearbyCities response ===>>> ${response['landmarks']['populars']}');

      if (response['landmarks']['populars'] != "") {
        nearByPlaces.value = response['landmarks']['closests'];

        print("fetchHotelNearbyCities ${nearByPlaces.length}");

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelNearbyCities exception ==> ${e.toString()}");
      return false;
    } finally {
      // isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelMapLocation({hotelId}) async {
    print("fetchHotelMapLocation");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.HotelMapLocationEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );

      print('fetchHotelMapLocation response ===>>> ${response['map_preview_url']}');

      if (response != "" || response != {}) {
        mapLocationLink.value = response['map_preview_url'];

        print("fetchHotelMapLocation ${hotelPhotos.length}");

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelMapLocation exception ==> ${e.toString()}");
      return false;
    } finally {
      // isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelMainReviewsList({hotelId}) async {
    hotelReviewWord.clear();
    hotelReviewWordScore.clear();
    print("fetchHotelMainReviewsList");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.HotelMetaDataEndPoint,
        {"hotel_id": hotelId, "locale": "en-gb"},
      );

      // print('fetchHotelMainReviewsList response ===>>> ${response['filters'][3]['categories']}');
      print('fetchHotelMainReviewsList response ===>>> ${response}');
      print('fetchHotelMainReviewsList response ===>>> ${response['total_reviews']}');
      print('fetchHotelMainReviewsList response ===>>> ${response['total_reviews'] == 0}');

      if (response['total_reviews'] != 0) {
        List tempList = response['filters'][3]['categories'];
        // Find the highest count
        int maxCount = tempList.map<int>((item) => item['count']).reduce((a, b) => a > b ? a : b);
        // Calculate the ratio and score for each item
        List<Map<String, dynamic>> scores = tempList.map((item) {
          double ratio = item['count'] / maxCount;
          double score = ratio * 10;
          return {'item': item['display_value'], 'ratio': ratio, 'score': score};
        }).toList();
        hotelReviewWord.clear();
        hotelReviewWordScore.clear();
        hotelReviewWord.value = response['filters'][3]['categories'];
        hotelReviewWordScore.value = scores;

        print("fetchHotelMainReviewsList ${hotelReviewWord.length}");

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelMainReviewsList exception ==> ${e.toString()}");
      return false;
    } finally {
      // isLoading(false);
      // await EasyLoading.dismiss();
    }
  }

  Future fetchHotelAmenties({hotelId}) async {
    print("fetchHotelAmenties");
    try {
      var response = await apiClient.callGetApi(
        ApiConstant.hotelDetailsAmentiesEndPoint,
        {
          "hotel_id": hotelId,
          "locale": "en-gb",
        },
      );

      if (response != null) {
        hotelAmenties.value = response;

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("fetchHotelAmenties exception ==> ${e.toString()}");
      return false;
    } finally {
      // isLoading(false);
      // await EasyLoading.dismiss();
    }
  }
}
