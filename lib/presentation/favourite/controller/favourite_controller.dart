import 'package:intl/intl.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/blogs/blog_model/blog_model.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';
import 'package:trippinr/widgets/custom_toast.dart';

import '../../bottom_nav_bar/bottom_nav_bar_helper_methods.dart';

class FavouriteController extends GetxController {
  BottomNavBarHelperMethods _bottomNavBarHelperMethods =
      BottomNavBarHelperMethods();
  Datum? data;
  var apiClient = ApiClient();
  UserSessionController _userSessionController = Get.find();
  var blogController = BlogsController();
  var isLoading = false.obs;
  // var authToken = "".obs;
  getReadingTime(time) {
    // String time = '01:01:01';
    Duration duration = Duration(
        seconds: int.parse(time.split(':')[2]),
        minutes: int.parse(time.split(':')[1]),
        hours: int.parse(time.split(':')[0]));

    String formattedTime = duration.inMinutes.remainder(60) > 1
        ? "${duration.inMinutes.remainder(60)} mins"
        : "${duration.inMinutes.remainder(60)} min";
    // "${duration.inHours}hr ${duration.inMinutes.remainder(60)}min ${duration.inSeconds.remainder(60)}sec";

    print(formattedTime);

    return formattedTime;
  }

  Future<dynamic> shareBlog({int? blogId}) async {
    try {
      isLoading(true);

      // EasyLoading.show(
      // status: 'loading...', maskType: EasyLoadingMaskType.black);
      var response = await apiClient.callPostApi(
          ApiConstant.shareBlog, {"productId": blogId, "type": "Blog"},
          authToken: _userSessionController.token);

      // print("<==> ${authToken.value}");
      if (response['status'] == 200) {
        await blogController.getBlog(token: _userSessionController.token);
        // CustomToast.showToast(mesage: response['message'].toString());
        update();
        Logger.log(response);

        return true;
      } else {
        isLoading(false);
        // await EasyLoading.dismiss();
        CustomToast.showToast(mesage: response['message'].toString());
        update();

        return false;
      }
    } catch (e) {
      // await EasyLoading.dismiss();
      update();

      isLoading(false);

      print("Catach Error is ${e.toString()}");
    } finally {
      // await EasyLoading.dismiss();
      update();
      isLoading(false);
    }
    update();
  }

  Future<dynamic> shareLike({int? blogId}) async {
    try {
      isLoading(true);

      // EasyLoading.show(
      // status: 'loading...', maskType: EasyLoadingMaskType.black);
      var response = await apiClient.callPostApi(
          ApiConstant.likeBlog, {"productId": blogId, "type": "Blog"},
          authToken: _userSessionController.token);

      // print("<==> ${authToken.value}");
      if (response['status'] == 200) {
        blogController.getBlog(token: _userSessionController.token);
        // CustomToast.showToast(mesage: response['message'].toString());
        update();
        Logger.log(response);

        return true;
      } else {
        isLoading(false);
        // await EasyLoading.dismiss();
        CustomToast.showToast(mesage: response['message'].toString());
        update();

        return false;
      }
    } catch (e) {
      // await EasyLoading.dismiss();
      update();

      isLoading(false);

      print("Catach Error is ${e.toString()}");
    } finally {
      // await EasyLoading.dismiss();
      update();
      isLoading(false);
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    final args = Get.arguments;
    if (args != null) {
      data = args["listOfData"];
      //data.addAll(args["listOfData"]);
    }
    print("value of data is ${data}");

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd');
    final DateFormat serverFormater = DateFormat('dd MMM, yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  popupScreen(context) {
    Future.delayed(Duration(seconds: 0), () async {
      await _bottomNavBarHelperMethods.loginPopUp(context);
    });
  }
}
