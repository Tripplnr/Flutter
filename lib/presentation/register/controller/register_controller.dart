import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/register/model/register_model.dart';
import 'package:trippinr/widgets/custom_toast.dart';

class RegisterController extends GetxController {
  final authController = Get.find<AuthController>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var passwordController = TextEditingController();
  var firstNameController1 = TextEditingController();
  var lastNameController1 = TextEditingController();
  var passwordController1 = TextEditingController();
  UserSessionController _userSessionController = Get.find();

  var emailController = TextEditingController();
  var emailController1 = TextEditingController();

  var isLoading = false.obs;
  // var homeRepository = HomeRepository();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var apiClient = ApiClient();
  onTapRegister(
      {String? firstName, String? lastName, String? email, String? password}) {
    if (formKey.currentState!.validate()) {
      signUpApi(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password)
          .then((value) {
        if (value) {
          firstNameController1.clear();
          lastNameController1.clear();
          emailController1.clear();
          passwordController1.clear();
        }
      });
      print("Register Successfully");
      // CustomToast.showToast(
      //     mesage: 'Register Successfully', bg_color: Colors.green);
    } else {
      print("invalid");
    }
    ;
  }

  Future<dynamic> signUpApi(
      {String? firstName,
      String? lastName,
      String? email,
      String? password}) async {
    try {
      isLoading(true);

      var response = await apiClient.callPostApi(
        ApiConstant.signupApi,
        {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password
        },
      );
      var registerDetail = RegisterModel.fromJson(response);
      if (registerDetail.status == 200) {
        // SharedPref.setAuthToken(registerDetail.data ?? "");
        _userSessionController.setUserToken(registerDetail.data ?? "");
        _userSessionController.setEmail(email ?? "");
        _userSessionController.setFirstName(firstName ?? "");
        _userSessionController.setLastName(lastName ?? "");
        Get.toNamed(AppRoutes.bottom_nav_bar);
        // Get.toNamed(AppRoutes.bottom_nav_bar);
        authController.isLoggedIn.value = true;
        isLoading(false);

        return true;
      } else if (registerDetail.status == 400) {
        isLoading(false);

        CustomToast.showToast(mesage: registerDetail.message.toString());
        print("Api hit 400 ${registerDetail.message}");
      } else {
        isLoading(false);

        print("Api does not hit Successfully");
        return false;
      }
    } catch (e) {
      isLoading(false);

      print("fetchHotelDetails exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> updateProfile(
    context,
    String? firstName,
    String? lastName,
  ) async {
    try {
      isLoading(true);

      var response = await apiClient.callPostApi(
        ApiConstant.updateApi,
        {
          "first_name": firstName,
          "last_name": lastName,
        },
        authToken: _userSessionController.token,
      );

      if (response['status'] == 200) {
        _userSessionController.setFirstName(firstNameController.text);
        _userSessionController.setLastName(lastNameController.text);
        // CustomToast.showToast(mesage: response['message'].toString());

        isLoading(false);
        Navigator.pop(context);
        return true;
      } else {
        isLoading(false);

        print("Api does not hit Successfully");
        return false;
      }
    } catch (e) {
      isLoading(false);

      print("updateProfile exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete();
    print("Register Controller Dispose");
    Get.lazyPut(() => RegisterController());

    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("Register Controller initialized");
    editPage();
    super.onInit();
  }

  editPage() async {
    // await SharedPref.getEmail().then((value) {
    //   if (value != null) {
    //     print("Register email $value");
    emailController.text = _userSessionController.email;
    //   }
    // });
    // await SharedPref.getFirstName().then((value1) {
    //   if (value1 != null) {
    //     print("Register first $value1");

    firstNameController.text = _userSessionController.firstName;
    //   }
    // });
    // await SharedPref.getLastName().then((value2) {
    //   if (value2 != null) {
    //     print("Register last $value2");

    lastNameController.text = _userSessionController.lastName;
    //   }
    // });
  }
}
