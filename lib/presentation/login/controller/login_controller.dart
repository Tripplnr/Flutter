import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';
import 'package:trippinr/presentation/destination/controller/destination_controller.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';
import 'package:trippinr/widgets/custom_toast.dart';

import '../../../auth_controller.dart';
import '../../bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import '../model/social_model.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isLoading1 = false.obs;
  var blogController = Get.put(BlogsController());
  var apiClient = ApiClient();
  UserSessionController _userSessionController = Get.find();
  // var homeRepository = HomeRepository();
  final authController = Get.find<AuthController>();
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  var _email = "";
  var _firstName  = "";
  var _lastName  = "";
  @override
  void onInit() {
    // TODO: implement onInit
    // SharedPref.getAuthToken().then((token) {
    //   print("value of token is ${token}");
    // });
    super.onInit();
  }

  bool isValidPassword(String password) {
    String pattern =
        r'^(?=.*?[a-zA-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~%():;<>?]).{8,}$';
    return RegExp(pattern).hasMatch(password);
  }

  onTapLogin({String? email, String? password}) {
    if (formKey.currentState!.validate()) {
      loginApi(email: email, password: password).then((value) {
        if (value) {
          emailController.clear();
          passwordController.clear();
          final _con = Get.put(BottomNavBarController());
          _con.initialIndex.value = 3;

          print(_con.initialIndex.value);
          // Navigator.pop(context);
          print("kjafshdlkajhssk");
          Get.put(HomeController());
          Get.put(HotelController());
          Get.put(DestinationController());
        }
        return;
        // Get.back();
      });
    } else {
      print("Invalid");
    }
  }

  Future<dynamic> loginApi({String? email, String? password}) async {
    try {
      isLoading(true);
      update();
      var response = await apiClient.callPostApi(
        ApiConstant.loginApi,
        {"email": email, "password": password},
      );
      // var loginDetail = LoginModel.fromJson(response);
      if (response['status'] == 200) {
        var _controller = Get.find<AuthController>();
        _controller.isLoggedIn(true);
        print("First Name => ${response['data']['first_name']}");
        print("Last Name => ${response['data']['last_name']}");
        print("Email => ${response['data']['email']}");
        _userSessionController
            .setUserToken(response['data']['access_token'] ?? "");
        _userSessionController.setEmail(response['data']['email'] ?? "");
        _userSessionController
            .setFirstName(response['data']['first_name'] ?? "");
        _userSessionController.setLastName(response['data']['last_name'] ?? "");
        Logger.log(_userSessionController.firstName);
        Logger.log(_userSessionController.lastName);

        await blogController.getBlog(token: _userSessionController.token);

        isLoading(false);
        Get.back();
        return true;
      } else if (response['status'] == 400) {
        isLoading(false);

        CustomToast.showToast(mesage: response['message'].toString());
      } else {
        isLoading(false);

        return false;
      }
    } catch (e) {
      print("fetchHotelDetails exception ==> ${e.toString()}");
      isLoading(false);

      return false;
    } finally {
      isLoading(false);
      update();
    }
    update();
  }

  Future<dynamic> socialLogin({String? email, String? socialId}) async {
    isLoading(true);
    update();
    try {
      var response = await apiClient.callPostApi(
        ApiConstant.socialLoginApi,
        {"email": email, "social_id": socialId},
      );
      var socialLoginDetail = SocialLoginModel.fromJson(response);
      if (socialLoginDetail.status == 200) {
        _userSessionController.setUserToken(socialLoginDetail.token.toString());

        Get.toNamed(AppRoutes.bottom_nav_bar);
        print("Api hit successfully");
      } else if (socialLoginDetail.status == 400) {
        print("Failed to hit api 400");
        return false;
      } else {
        print("Failed to hit api");
        return false;
      }
    } catch (e) {
      isLoading(false);
      print("Social logiin catch error is ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      update();
    }
    update();
  }

  // login(BuildContext context) async {
  //   if (emailController.text == null || emailController.text.trim() == "") {
  //     EasyLoading.showError(TEXT_ERROR_MESSAGE_LOGIN_PROVIDE_EMAIL);
  //     return;
  //   }
  //
  //   if (!EmailValidator.validate(emailController.text.trim())) {
  //     EasyLoading.showError(TEXT_ERROR_MESSAGE_LOGIN_PROVIDE_VALID_EMAIL);
  //     return;
  //   }
  //
  //   if (passwordController.text == null ||
  //       passwordController.text.trim() == "") {
  //     EasyLoading.showError(TEXT_ERROR_MESSAGE_LOGIN_PROVIDE_PASSWORD);
  //     return;
  //   }
  //
  //   EasyLoading.show(status: LOADING_AUTHENTICATING);
  //
  //   Future<dio.Response?> loginResponse =
  //   ApiClient().login(emailController.text, passwordController.text);
  //   loginResponse.then((response) async {
  //     if (response != null) {
  //       print("login response ==> $response");
  //
  //       log(response.toString());
  //
  //       Map<String, dynamic> loginResponse = jsonDecode(response.toString());
  //
  //       if (loginResponse["token"] != null) {
  //         await Utils.saveToken(loginResponse["token"]);
  //         await Utils.saveRefreshToken(loginResponse["refreshToken"]);
  //
  //         await Utils.saveCurrentUserDetails(jsonEncode(loginResponse["user"]));
  //
  //         UserModel? user = await Utils.getCurrentUser();
  //         if (user != null) {
  //           print("user.paymentSource!.brand");
  //           // print(user.paymentSource?.brand);
  //           Cache.userFullName = "${user.first_name} ${user.last_name}";
  //           Cache.userEmail = user.email;
  //           Cache.userPhone = user.phone;
  //           if (user.paymentSources != null) {
  //             if (user.paymentSources!.isNotEmpty) {
  //               print(jsonEncode(user.paymentSources));
  //               await Utils.savePaymentSource(jsonEncode(user.paymentSources!));
  //               print(Utils.getPaymentSource());
  //               print("User Payment Sources ===>> ${user.paymentSources!}");
  //             }
  //
  //             // List<PaymentSources>? d = [];
  //             // d.add(PaymentSources(
  //             //   token: "asdfasdf",
  //             //   brand: "master",
  //             //   last4: "2133",
  //             //   expMonth: 4,
  //             //   expYear: 22
  //             //
  //             // ));
  //             // Utils.savePaymentSource(jsonEncode(d));
  //
  //           }
  //         }
  //
  //         EasyLoading.dismiss();
  //
  //         switch (response.statusCode) {
  //           case 200:
  //             Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
  //             break;
  //           case 400:
  //             EasyLoading.showError(loginResponse["messageForUser"]);
  //             break;
  //           default:
  //             EasyLoading.showError("Login failed, please try again.");
  //         }
  //       } else {
  //         EasyLoading.dismiss();
  //         var message = loginResponse["status"]["messageForUser"] ??
  //             "Login failed, please try again.";
  //         EasyLoading.showError(message);
  //       }
  //     } else {
  //       EasyLoading.dismiss();
  //       EasyLoading.showError("Login failed, please try again.");
  //     }
  //   });
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.clear();
    passwordController.clear();
  }

  Future<GoogleSignInAccount?> googleSignInProcess() async {
    update();
    isLoading1(true);
    final GoogleSignIn _googleSignIn;

    if (Platform.isAndroid) {
      _googleSignIn = GoogleSignIn();
    } else {
      _googleSignIn = GoogleSignIn(
          clientId:
              "912173153696-ckptv6q9sffcgcs5jk7390tkfo26avc5.apps.googleusercontent.com");
    }
    update();

    // GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser =
        await _googleSignIn.signIn().then((value) async {
      if (value != null) {
        log("googleSignInProcess $value");
        _userSessionController.setEmail(value.email);
        var _names = value.displayName!.split(' ');
        _userSessionController.setFirstName(_names[0]);
        _userSessionController.setLastName(_names[1]);
        update();

        await ApiClient().callPostApi(ApiConstant.socialLoginApi,
            {"email": value.email, "social_id": value.id,"first_name":_names[0],"last_name":_names[1]}).then((value) async {
          if (value != null) {
            log("googleSignInProcess $value");
            print("googleSignInProcess Google Login Successfully");
            print("googleSignInProcess ${value['token']}");

            _userSessionController.setUserToken(value['token']);
            if(value["data"]!=null) {
              _userSessionController.setEmail(value["data"]["email"]);
              _userSessionController.setFirstName(value["data"]["first_name"]);
              _userSessionController.setLastName(value["data"]["last_name"]);
            }
            await blogController.getBlog(token: _userSessionController.token);

            Get.back();
            isLoading1(false);

            authController.isLoggedIn(true);
            authController.isLoggedInSocial(true);
          }
        });
        isLoading1(false);
        isLoading(false);
        update();
        print("object");
        return;
      }
      return null;
    });
    isLoading1(false);
    isLoading(false);
    print("object1");

    update();

    return googleUser;
  }

  Future<void> signInWithApple() async {
    isLoading(true);
    update();
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      // .then((value) {
      if(credential !=null){
      if (credential != "") {
        print(credential.givenName);
        print(credential.familyName);
        print(credential.userIdentifier);
        print("signInWithApple \n $credential \n ${credential.userIdentifier}");
        // c1efa69c75d0d49cc900613d42b841836.0.rrru.SMdlb-GKwmDVK5s-nrT0hQ
        // var emailIfNull = 'sahilselfmade@gmail.com';
        // var _names = value.givenName?.split(' ');
        String fullName = credential.givenName??"";
        List<String> nameParts = fullName.split(' ');
        String? firstName = nameParts.isNotEmpty ? nameParts[0] : "";
        // String? lastName = nameParts.length > 1 ? nameParts[1] : "";

        print("First name: $firstName");
        // print("Last name: $lastName");
        _storeUserInformationInKeychain(
            credential.email ?? "",firstName,credential.familyName??"");


        if (credential.email == null || credential.givenName == null) {
          await _loadUserInformationFromKeychain();
          // then((value) {
          _userSessionController
              .setFirstName(_firstName);
          _userSessionController
              .setLastName(_lastName);
          print('objectLName');

          // SharedPref.setAppleEmail(emailIfNull??value.email.toString());
          _userSessionController.setEmail(_email);

          // });
        } else {
          _userSessionController
              .setFirstName(firstName);
          _userSessionController
              .setLastName(credential.familyName??"");
          print('objectLName');

          // SharedPref.setAppleEmail(emailIfNull??value.email.toString());
          _userSessionController.setEmail(credential.email ?? "");
          // _userSessionController.setFirstName(value.givenName.toString());
          // SharedPref.setAppleEmail(emailIfNull);
          // SharedPref.getAppleEmail().then((value) async {
          //   emailIfNull = value.toString();
          //   print('signInWithApple object $value \n $emailIfNull');
          //   print(value);
          //   print(emailIfNull);
          // });
        }

        ApiClient().callPostApi(ApiConstant.socialLoginApi, {
          "email": _userSessionController.email != "" &&
              _userSessionController.email != null
              ? _userSessionController.email
              : _email,
          "social_id": credential.userIdentifier,
          "first_name": _userSessionController.firstName != "" &&
              _userSessionController.firstName != null
              ? _userSessionController.firstName
              : _firstName,
          "last_name": _userSessionController.lastName != "" &&
              _userSessionController.lastName != null
              ? _userSessionController.lastName
              : _lastName
        }).then((value) {
          if (value != null) {
            // print("signInWithApple $value");
            print("signInWithApple Apple Login Successfully");
            print(value);
            // print("signInWithApple ${value['token']}");

            // SharedPref.setAuthToken(value['token']);
            _userSessionController.setUserToken(value['token']);
            if (value["data"] != null) {
              _userSessionController.setEmail(value["data"]['email'] ?? "");
              _userSessionController
                  .setFirstName(value["data"]["first_name"] ?? "");
              _userSessionController
                  .setLastName(value["data"]["last_name"] ?? "");
              blogController.getBlog(token: _userSessionController.token);
            }

            authController.isLoggedIn(true);
            authController.isLoggedInSocial(true);
            Get.back();
            isLoading(false);
            update();
          }
        });
        isLoading(false);
        update();
        // Navigator.pop(context);
      } else {
        isLoading(false);
        update();
        print("signInWithApple value_apple_null");
        print(credential);
      }
    }else{
        isLoading(false);
        update();
        print("signInWithApple value_apple_null");
        print(credential);
      }
        isLoading(false);
        update();
      // });

      // Use the credential to sign in to your backend server
      // ...
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to sign in with Apple: $error',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }



  Future<void> _storeUserInformationInKeychain(String email, String firstName, String lastName) async {
    if(email.isNotEmpty) {
      await _storage.write(key: 'apple_email', value: email);
    }
    if(firstName.isNotEmpty) {
      await _storage.write(key: 'apple_first_name', value: firstName);
    }
    if(lastName.isNotEmpty) {
      await _storage.write(key: 'apple_last_name', value: lastName);
    }
  }

  Future<void> _loadUserInformationFromKeychain() async {
    _email = await _storage.read(key: 'apple_email') ?? '';
    _firstName = await _storage.read(key: 'apple_first_name') ?? '';
    _lastName = await _storage.read(key: 'apple_last_name') ?? '';

   print("datafromkeychain");
   print(_email);
   print(_firstName);
   print(_lastName);
  }
}
