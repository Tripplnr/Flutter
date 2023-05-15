import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';

class SettingsController extends GetxController {
  UserSessionController _userSessionController = Get.find();
  TextEditingController textEditingController = TextEditingController();
  var unitSelected = "Kms".obs;
  var index = 0.obs;
  var isLoading = false.obs;

  var data = "".obs;
  var termOfUse = "".obs;
  var privacyPolicy = "".obs;
  var aboutUs = "".obs;
  var firstName = "".obs;
  var lastName = "".obs;

  updatedVariable() {
    data.value = textEditingController.value.text.toString();
    print(data.value);
  }

  Future onselected() async {
    textEditingController.value =
        TextEditingValue(selection: TextSelection.collapsed(offset: 0));
    // _userSessionController.box.erase();
    // print(_userSessionController.currencyList);
    // await _userSessionController.currencyList == [null]
    // await getCurrencyList();
    // : null;
    await Get.toNamed(AppRoutes.currency);
  }

  Future editPage() async {
    // await SharedPref.getFirstName().then((value) {
    //   if (value != null) {
    //     print("First Name $value");
    firstName.value = _userSessionController.firstName;
    Logger.log(_userSessionController.firstName);
    Logger.log("===>>>${_userSessionController.lastName}");
    //   }
    // });
    // await SharedPref.getLastName().then((value) {
    //   if (value != null) {
    //     print("Last Name $value");

    lastName.value = _userSessionController.lastName;
    //   }
    // });
  }

  // onLogout() {
  //   // SharedPref.clear();

  //   // print("google auth ${GoogleAuthHelper().alreadySignIn()}");
  //   // GoogleAuthHelper().alreadySignIn().then((value) {
  //   //   if (value) {
  //   //     GoogleAuthHelper().googleSignOutProcess();
  //   //     print("value is 11");
  //   //     return;
  //   //   }
  //   // });
  //   // print("value is 22");
  //   AuthController().isLoggedIn(false);
  //   Get.toNamed(AppRoutes.bottom_nav_bar);
  // }
  var currencyListAPI = [].obs;
  var currencyCountryListAPI = [].obs;
  var currencyListRateAPI = [].obs;
  var currencyList = [
    "AUD - Australian Dollar",
    "CAD - Canadian Dollar",
    "EUR - Euro",
    "USD - United States Dollar",
  ].obs;
// ! Currency List

  var apiClient = ApiClient();

  // Future getCurrencyList() async {
  //   var query = {
  //     "keyWord": '',
  //   };
  //   print("currencyList");
  //   try {
  //     isLoading(true);
  //     var response = await apiClient.callGetApi(
  //       ApiConstant.currencyApi,
  //       query,
  //     );
  //     print("currencyList response $response");
  //     tempcurrencyList.clear();
  //     currencyList.clear();
  //     if (response['success'] == true) {
  //       update();
  //       // currencyListModel.value = currencyModel.exchangeRates;

  //       currencyListAPI.value = await (response['data'] as List<dynamic>)
  //           .map((e) => (e as Map<String, dynamic>))
  //           .toList();
  //       // await (response['exchange_rates'] as List<dynamic>)
  //       //     .map((e) => ExchangeRate.fromMap(e as Map<String, dynamic>))
  //       //     .toList();

  //       currencyListAPI.forEach((e) {
  //         currencyList.add("${e['currency_code']} ${e['country']}");
  //       });
  //       currencyListAPI.forEach((e) {
  //         tempcurrencyList.add("${e['currency_code']} ${e['country']}");
  //       });
  //       // currencyCountryListAPI.forEach((e) {
  //       //   currencyList.add(e['country']);
  //       // });
  //       print("currencyListiii $currencyList");
  //       return true;
  //     } else {
  //       update();
  //       return false;
  //     }
  //   } catch (e) {
  //     isLoading(false);

  //     print("currencyList Exception $e");
  //     return false;
  //   } finally {
  //     isLoading(false);
  //     update();
  //   }
  // }

  Future deleteAccount() async {
    print("deleteAccount");
    try {
      isLoading(true);
      var response = await apiClient.callPostApi(ApiConstant.deleteApi, {},
          authToken: _userSessionController.token);
      print("currencyList response response");

      if (response['success'] == true) {
        update();
        // currencyListModel.value = currencyModel.exchangeRates;
        Get.back();
        return true;
      } else {
        update();
        return false;
      }
    } catch (e) {
      isLoading(false);

      print("currencyList Exception $e");
      return false;
    } finally {
      isLoading(false);
      update();
    }
  }

//   Future currencyLists() async {
//     var query = {
//       "currency": 'USD',
//       "locale": 'en-gb',
//     };
//     print("currencyList");
//     try {
//       isLoading(true);
//       var response = await apiClient.callGetApi(
//         ApiConstant.CurrencyListEndPoint,
//         query,
//       );
//       print("currencyList response response");
//       var currencyModel = CurrencyModel.fromMap(response);
//       print("currencyList $currencyModel");

//       if (currencyModel.exchangeRates != null) {
//         update();
//         // currencyListModel.value = currencyModel.exchangeRates;

//         currencyListAPI.value =
//             await (response['exchange_rates'] as List<dynamic>)
//                 .map((e) => ExchangeRate.fromMap(e as Map<String, dynamic>))
//                 .toList();
//         tempcurrencyList.clear();
//         currencyListAPI.forEach((e) {
//           currencyList.add(e.currency);
//           // _userSessionController.setCurrencyList(currencyList);
//         });
//         print("currencyList $currencyListRateAPI");
//         return true;
//       } else {
// // CustomToast.showToast(mesage: response['message'].toString());
//         // print("currencyList $currencyListAPI");

//         update();
//         return false;
//       }
//     } catch (e) {
//       isLoading(false);
// // await EasyLoading.dismiss();
// // CustomToast.showToast(mesage: e.toString());
//       print("currencyList Exception $e");
//       return false;
//     } finally {
//       isLoading(false);
//       update();
// // await EasyLoading.dismiss();
//     }
//     update();
//   }

  var tempcurrencyList = [
    "AUD - Australian Dollar",
    "CAD - Canadian Dollar",
    "EUR - Euro",
    "USD - United States Dollar",
  ].obs;

  onTap() {
    tempcurrencyList.value;
  }

  onTapLegalInformation() async {
    try {
      var response = await ApiClient().callGetApi(
        ApiConstant.termOfUseAPI,
        {},
      );

      print('response $response');
      if (response['success'] == true) {
        // var jsonData = json.decode(response.body);
        print('test');
        termOfUse.value = response['data']['conditions'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("onTapLegalInformation exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // EasyLoading.dismiss();
    }
  }

  onTapPrivacyPolicy() async {
    try {
      var response = await ApiClient().callGetApi(
        ApiConstant.privacyPolicy,
        {},
      );

      print('response $response');
      if (response['success'] == true) {
        // var jsonData = json.decode(response.body);
        print('test');
        privacyPolicy.value = response['data']['conditions'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("onTapLegalInformation exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // EasyLoading.dismiss();
    }
  }

  onTapAboutUs() async {
    try {
      var response = await ApiClient().callGetApi(
        ApiConstant.aboutUsAPI,
        {},
      );

      print('response $response');
      if (response['success'] == true) {
        // var jsonData = json.decode(response.body);
        print('test');
        aboutUs.value = response['data']['conditions'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("onTapLegalInformation exception ==> ${e.toString()}");
      return false;
    } finally {
      isLoading(false);
      // EasyLoading.dismiss();
    }
  }

  unitTypeList(text, isSelected) {
    return InkWell(
      onTap: () {
        unitSelected.value = text;

        print("===>>> ${unitSelected.value}");
      },
      child: Container(
        // width: 115,
        // height: 35,
        // decoration: BoxDecoration(color: ColorConstant.gray10001),
        child: Center(
          child: Container(
            height: 29,
            width: 50,
            decoration: BoxDecoration(
              color: isSelected ? ColorConstant.yellow900 : Colors.transparent,
              borderRadius: BorderRadius.circular(48),
            ),
            child: Center(
              child: Text(text,
                  style: TextStyle(
                    color:
                        isSelected ? ColorConstant.white : ColorConstant.black,
                    fontSize: getFontSize(
                      14,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  // currencySearchItems(String searchItem) {
  //   List results = [];
  //   if (searchItem.isEmpty) {
  //     results = currencyList;
  //   } else {
  //     results = currencyList
  //         .where((user) => user[index.value]
  //             .toString()
  //             .toLowerCase()
  //             .contains(searchItem.toLowerCase()))
  //         .toList();
  //   }
  //   tempcurrencyList.value = results;
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // tempcurrencyList.value.clear();
    // tempcurrencyList.value = currencyList;
    editPage();
    data.value = "USD";
    onTapLegalInformation();
    onTapAboutUs();
    onTapPrivacyPolicy();
    data.value = "USD";
    onTapLegalInformation();
    onTapAboutUs();
    onTapPrivacyPolicy();
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
