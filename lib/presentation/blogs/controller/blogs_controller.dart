import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/blogs/blog_model/blog_model.dart';
import 'package:trippinr/presentation/blogs/blog_model/like_blog.dart';
import 'package:trippinr/widgets/custom_toast.dart';

class BlogsController extends GetxController {
  TextEditingController searchController = TextEditingController();
  UserSessionController _userSessionController = Get.find();
  AuthController _authController = Get.find();
  // RxString authToken = "".obs;
  var searchText = ''.obs;
  var isLoading = false.obs;
  var searchResults = [].obs;
  var apiClient = ApiClient();
  RxBool likeUnlikeBlogImg = false.obs;
  Rx<List<Datum>> getBlogs = Rx<List<Datum>>([]);
  Rx<List<Datum>> getBlogsTemp = Rx<List<Datum>>([]);
  Rx<List<Datum>> getFavBlogs = Rx<List<Datum>>([]);

  RefreshController blogrefreshController =
      RefreshController(initialRefresh: false);
  onRefreshLoader() async {
    await Future.delayed(
      Duration(milliseconds: 1000),
    );
    print("hjgjhghfhhjghj");

    await _authController.isLoggedIn.value
        ? getBlog(token: _userSessionController.token).then((value) {
            if (value) {
              // fetchPopularHotels();
              blogrefreshController.refreshCompleted();
              print("hjgjhghfhhjghj");
            }
          })
        : getBlog().then((value) {
            if (value) {
              blogrefreshController.refreshCompleted();
              print("hjgjhghfhhjghj");
            }
          });

    print("hjgjhghfhhjghj");

    // await _homeController
    //     .getBlog(token: _userSessionController.token ?? "")
    //     .then((value) => setState(() {
    //           RefreshController().refreshCompleted();
    //         }));
  }

  @override
  void onReady() {
    super.onReady();
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd');
    final DateFormat serverFormater = DateFormat('dd MMM, yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

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

  @override
  void onInit() {
    // TODO: implement onInit
    _userSessionController.token != null
        ? getBlog(token: _userSessionController.token)
        : getBlog();

    // SharedPref.getAuthToken().then((token) {
    //   if (token == null) {
    //     getBlog();
    //     print("getBlogs ${getBlogs.value}");
    //   } else {
    //     authToken.value = token;
    //     getBlog();
    //     print("getBlogs ${getBlogs.value}");
    //   }
    // });
    super.onInit();
  }

  Future<dynamic> getBlog({token}) async {
    print("getBlog");
    getBlogs.value.clear();
    getBlogsTemp.value.clear();
    try {
      isLoading(true);
      // EasyLoading.show(
      //     status: 'loading...', maskType: EasyLoadingMaskType.black);
      var response = await apiClient.callPostApi(
          ApiConstant.getBlogApi + "?page=1", {},
          authToken: token ?? _userSessionController.token);
      // log("getBlog response $response");

      var blogDetail = BlogModel.fromJson(response);
      // print("getBlog blogDetails $blogDetail");

      print("getBlog token ${_userSessionController.token}");
      if (blogDetail.status == 200) {
        getBlogs.value.addAll(blogDetail.data!.data!);
        getBlogsTemp.value = List.from(blogDetail.data!.data!);
        // getBlogsTemp.value.addAll(blogDetail.data!.data!);
        print("getBlog value ${getBlogs.value[0].readingTime}");
        print("getBlog shareCount ${getBlogs.value[0].shareCount}");

        update();
        return true;
      } else if (blogDetail.status == 400) {
        CustomToast.showToast(mesage: blogDetail.message.toString());
      } else {
        CustomToast.showToast(mesage: blogDetail.message.toString());
        update();
        isLoading(false);

        return false;
      }
    } catch (e) {
      isLoading(false);
      // await EasyLoading.dismiss();
      // CustomToast.showToast(mesage: e.toString());
      print("getBlog Exception $e");

      return false;
    } finally {
      isLoading(false);
      update();

      // await EasyLoading.dismiss();
    }
    update();
  }

  RxInt isFavourite = 0.obs;
  Future<dynamic> likeBlog({int? blogId, String? type, index}) async {
    try {
      isLoading(true);

      // EasyLoading.show(
      // status: 'loading...', maskType: EasyLoadingMaskType.black);
      var response = await apiClient.callPostApi(
          ApiConstant.likeBlogApi, {"blogId": blogId, "type": type},
          authToken: _userSessionController.token);
      var likeBlogDetail = LikeBlogModel.fromJson(response);
      // print("<==> ${authToken.value}");
      if (likeBlogDetail.status == 200) {
        if (getBlogs.value[index].isFavorite == 1) {
          getBlogs.value[index].isFavorite = 0;
          print("object ${getBlogs.value[index].isFavorite}");
          update();
        } else {
          getBlogs.value[index].isFavorite = 1;
          print("object ${getBlogs.value[index].isFavorite}");

          update();
        }
        // CustomToast.showToast(mesage: likeBlogDetail.message.toString());
        return true;
      } else if (likeBlogDetail.status == 400) {
        // await EasyLoading.dismiss();
        isLoading(false);

        CustomToast.showToast(mesage: likeBlogDetail.message.toString());
      } else {
        isLoading(false);
        // await EasyLoading.dismiss();
        CustomToast.showToast(mesage: likeBlogDetail.message.toString());
        update();

        return false;
      }
    } catch (e) {
      // await EasyLoading.dismiss();
      isLoading(false);

      print("Catach Error is ${e.toString()}");
    } finally {
      // await EasyLoading.dismiss();
      isLoading(false);
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
    // frameOneController.dispose();
  }
}
