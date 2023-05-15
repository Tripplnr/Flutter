import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/widgets/custom_toast.dart';

class ForgotPasswordController extends GetxController {
  // var authToken = "".obs;
  UserSessionController _userSessionController = Get.find();
  var isLoading = false.obs;
  var apiClient = ApiClient();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onTapForgotPassword() {
    if (formKey.currentState!.validate()) {
      print("Hit Api");
      forgotPassword(emailController.value.text);
      // Get.back();
    } else {
      print("Invalid");
    }
  }

  Future<dynamic> forgotPassword(email) async {
    // await SharedPref.getAuthToken().then((token) {
    //   if (token != null) {
    //     authToken.value = token.toString();

    //     print("forgotPassword ${authToken.value}");
    //   }
    // });
    print("forgotPassword");
    try {
      isLoading(true);
      var body = {"email": email};
      var response = await apiClient.callPostApi(
          ApiConstant.forgotPassword, body,
          authToken: _userSessionController.token);
      print("forgotPassword response $response");

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
      print("forgotPassword Exception $e");

      return false;
    } finally {
      isLoading(false);

      // await EasyLoading.dismiss();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
