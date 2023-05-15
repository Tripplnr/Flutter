import 'dart:developer';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';
import 'package:trippinr/presentation/home/models/popular_hotel_model.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

class HomeController extends GetxController {
  var apiClient = ApiClient();
  var _authController = Get.find<AuthController>();
  var _userSessionController = Get.find<UserSessionController>();
  var isLoading = false.obs;
  var isLoading1 = false.obs;
  // var popularHotelsList = [].obs;
  var popularHotelsList = [].obs;
  var trendingHotelsList = [].obs;
  var recentlyViewHotelsList = [].obs;
  var popularHotelsListTemp = [].obs;
  var nearByHotels = [].obs;
  var similarHotelsList = [].obs;
  var homeHotelIndex = "".obs;
  var hotelController = Get.find<HotelController>();
  var blogController = Get.find<BlogsController>();
  // var blogController = Get.put(BlogsController());

  // final indexController = Get.put(BottomNavBarController());
  var selectedindex = 1.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  onRefreshLoader() async {
    await Future.delayed(
      Duration(milliseconds: 1000),
    );
    print("hjgjhghfhhjghj");

    await _authController.isLoggedIn.value
        ? blogController
            .getBlog(token: _userSessionController.token)
            .then((value) async {
            if (value) {
              await fetchPopularHotels();
              refreshController.refreshCompleted();
              print("hjgjhghfhhjghj");
            }
          })
        : blogController.getBlog().then((value) async {
            if (value) {
              await fetchPopularHotels();

              refreshController.refreshCompleted();
              print("hjgjhghfhhjghj");
            }
          });

    print("hjgjhghfhhjghj");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  onInit() {
    super.onInit();
    // recentlyViewHotelsList.addAll(_userSessionController.hotelList);

    fetchPopularHotels();
    _authController.isLoggedIn.value
        ? blogController.getBlog(token: _userSessionController.token)
        : blogController.getBlog();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapPopularHotel(hotelId) async {
    await hotelController.fetchHotelDetails(hotelId: hotelId);
  }

  Future fetchPopularHotels() async {
    var endDate = DateTime.now().add(Duration(days: 1)).format('yyyy-MM-dd');
    var todayDate = DateTime.now().format('yyyy-MM-dd');

    print(todayDate);
    print(endDate);

    isLoading(true);

    update();
    print("fetchPopularHotels");
    var body = {
      "room_number": "1",
      "locale": "en-gb",
      "longitude": _authController.longitude.value,
      "filter_by_currency": _userSessionController.currency,

      "latitude": _authController.latitude.value,
      "units": "metric",
      "adults_number": "1",
      // "checkout_date": "2023-09-06",
      "checkout_date": endDate,
      "checkin_date": todayDate,
      // "checkin_date": "2023-09-05",

      // "longitude": "76.7808",
      // "latitude": "30.3783",

      // "latitude": "65.9667",
      // //
      // "longitude": "-18.5333",

      "order_by": "class_descending",
      // "order_by": "popularity",
      // "checkout_date": apiFormattedDate,
      // "filter_by_currency": _authController.currencyCode.value,
    };
    print(body);

    try {
      var response = await apiClient.callGetApi(
        ApiConstant.homePopularHotelEndPoint,
        body,
      );
      print('responseeee $response');

      PopularHotelModel _popularHotelModel =
          PopularHotelModel.fromJson(response);
      // if (_userSessionController.hotelList.length == 0) {
      //   popularHotelsList.addAll(_popularHotelModel.result!);
      //   print("Hotel List Count ${popularHotelsList.length}");
      // } else
      if (_popularHotelModel != null) {
        // var jsonData = json.decode(response.body);
        print('test');
        print("fetchPopularHotels response.body\n ==> ${response} ");
        popularHotelsList.value = _popularHotelModel.result!;
        popularHotelsListTemp.value = _popularHotelModel.result!;
        trendingHotelsList.value =  List.from(_popularHotelModel.result!)  ;
        nearByHotels.value = _popularHotelModel.result!;
        // var similarHotel = [];
        // similarHotel = _popularHotelModel.result!;
        similarHotelsList.value = _popularHotelModel.result!;
        // var filterSimilar = similarHotel
        //     .where((element) => double.parse(element.distance) <= 10.0);
        // log("similar ${filterSimilar.length} ${popularHotelsList.length}");
        // similarHotelsList.addAll(filterSimilar);
        // log("similar ${similarHotelsList.length}");
        // log(_popularHotelModel.result);
        // _userSessionController.setHotelList(_popularHotelModel.result!);
        // print(_userSessionController.hotelList);
        log("similar ${_popularHotelModel.result}");


        nearByHotels
            .sort((a, b) => a.distance.compareTo(b.distance));
        print("trendingHotelsList ${nearByHotels.length}");



        trendingHotelsList
            .sort((a, b) => b.resultClass.compareTo(a.resultClass));
        print("trendingHotelsList ${trendingHotelsList.length}");

        for(var a in trendingHotelsList){
          if(a.resultClass<3){
            trendingHotelsList.remove(a);
          }
        }
        print(".........RRRRRR");
        var toRemove = [].obs;
        for(var a in nearByHotels){

          for(var b in trendingHotelsList.take(5)){

            if(a==b){
              toRemove.add(a);
            }
          }
        }
print("toRemove.length");
print(toRemove.length);
        nearByHotels.removeWhere( (e) => toRemove.contains(e));


        update();
        return true;
      } else {
        // isLoading(false);

        return false;
      }
    } catch (e) {
      print("fetchPopularHotels exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // EasyLoading.dismiss();
      update();
    }
  }
}
