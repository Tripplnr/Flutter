import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/widgets/custom_toast.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  // var authToken = "".obs;
  UserSessionController _userSessionController = Get.find();
  var apiClient = ApiClient();
  TextEditingController currentpasswordcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onTapChangePassword({currentPassword, confirmPassword, password}) async {
    if (formKey.currentState!.validate()) {
      print("Hit Api");
      await changePasswordPost(
        password: newpasswordcontroller.value.text,
        confirmPassword: confirmpasswordcontroller.value.text,
        currentPassword: currentpasswordcontroller.value.text,
      );
    } else {
      print("Invalid");
    }
  }

  Future<dynamic> changePasswordPost(
      {currentPassword, confirmPassword, password}) async {
    // await SharedPref.getAuthToken().then((token) {
    //   if (token != null) {
    //     authToken.value = token.toString();

    //     print("passwordChange ${authToken.value}");
    //   }
    // });
    print("changePasswordPost");
    try {
      isLoading(true);
      var body = {
        "current_password": currentPassword,
        "password_confirmation": confirmPassword,
        "password": password,
      };
      var response = await apiClient.callPostApi(
          ApiConstant.changePassword, body,
          authToken: _userSessionController.token);
      print("changePasswordPost response $response");

      if (response['status'] == 200) {
        CustomToast.showToast(
            mesage: response['message'].toString(), bg_color: Colors.green);
        Get.back();
        return true;
      } else {
        CustomToast.showToast(
            mesage: response['message'].toString(), bg_color: Colors.red);

        return false;
      }
    } catch (e) {
      isLoading(false);
      // await EasyLoading.dismiss();
      CustomToast.showToast(mesage: e.toString());
      print("changePasswordPost Exception $e");

      return false;
    } finally {
      isLoading(false);

      // await EasyLoading.dismiss();
    }
  }

  @override
  void onInit() {
    // SharedPref.getAuthToken().then((token) {
    //   if (token != null) {
    //     authToken.value = token.toString();

    //     print("passwordChange ${authToken.value}");
    //   }
    // });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    currentpasswordcontroller.clear();
    newpasswordcontroller.clear();
    confirmpasswordcontroller.clear();
  }
}
