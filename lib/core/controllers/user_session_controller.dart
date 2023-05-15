// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:trippinr/core/app_export.dart';

class UserSessionController extends GetxController {
  GetStorage box = GetStorage();
  var isLogin = false.obs;

  final _addressList = [].obs;
  final _currency = 'USD'.obs;
  final _email = ''.obs;
  final _firstName = ''.obs;
  final _hotelList = [].obs;
  final _lastName = ''.obs;
  final _token = ''.obs;

  List _currencyList = [].obs;

  init() async {
    // _isLogin.value = box.read(isLogInString) ?? false;
    _token.value = box.read(tokenString) ?? '';
    _hotelList.value = box.read(hotelListString) ?? [""];
    _addressList.value = box.read(addressListString) ?? [""];
    _currency.value = box.read(currencyString) ?? '';
    _currencyList = box.read(currencyListString) ?? [""];
    _lastName.value = box.read(lastNameString) ?? '';
    _firstName.value = box.read(firstNameString) ?? '';
    _email.value = box.read(emailString) ?? '';
  }

  // get isLogin => _isLogin.value;
  get token => _token.value;

  get currency => _currency.value;

  get currencyList => _currencyList;

  get hotelList => _hotelList.value;

  get addressList => _addressList.value;

  get firstName => _firstName.value;

  get lastName => _lastName.value;

  get email => _email.value;

  // void setIsLogin(bool value) {
  //   _isLogin.value = value;
  //   setPref(isLogInString, value);
  // }

  void setUserToken(String value) {
    _token.value = value;
    setPref(tokenString, value);
  }

  void setCurrency(String value) {
    _currency.value = value;
    setPref(currencyString, value);
  }

  void setFirstName(String value) {
    _firstName.value = value;
    setPref(firstNameString, value);
    update();
  }

  void setLastName(String value) {
    _lastName.value = value;
    setPref(lastNameString, value);
    update();
  }

  void setEmail(String value) {
    _email.value = value;
    setPref(emailString, value);
    update();
  }

  setCurrencyList(List value) {
    _currencyList = value;
    setPref(currencyListString, value);
    update();
  }

  setHotelList(List value) {
    _hotelList.value = value;
    setPref(hotelListString, value);
    update();
  }

  // setAddress(List<String> value) {
  //   // Remove duplicates from the input list
  //   final uniqueValues = value.toSet().toList();

  //   // Limit the list to a maximum of 5 elements
  //   final limitedValues = uniqueValues.length <= 5 ? uniqueValues : uniqueValues.sublist(0, 5);

  //   // Set the controller's list to the updated list
  //   _addressList.value = limitedValues;

  //   // Save the updated list to shared preferences
  //   setPref(addressListString, limitedValues);

  //   // Rebuild any widgets dependent on addressList
  //   update();
  // }

  Future<void> setAddress({value, placeIdToDelete}) async {
    final box = GetStorage();
    print("${value}\n${placeIdToDelete}");
    log("1 ${placeIdToDelete}");

    List<dynamic>? addresses = await box.read<List<dynamic>>(addressListString);
    // addresses!.clear();
    addresses ??= [];

    // Check if the new address already exists in the list
    if (!addresses.contains(value) && value != null) {
      // Add the new address to the beginning of the list
      addresses.insert(0, value);

      // Only keep the most recent 5 addresses
      if (addresses.length > 5) {
        addresses.removeLast();
      }

      // Save the updated list of addresses to GetStorage
      await box.write(addressListString, addresses);
    } else {
      // Delete an address
      if (placeIdToDelete != null) {
        log("hekljasflkjl ${placeIdToDelete}");
        addresses.removeWhere((address) => (jsonDecode(address)['place_id'] == (json.decode(placeIdToDelete))));

        // return jsonDecode(address)['place_id'] == placeIdToDelete;

        box.write(addressListString, addresses);

        log("hekljasflkjl 2");
      }
    }
  }

  void setPref(String key, dynamic value) async {
    await box.write(key, value);
  }

  getPref(String key) async {
    await box.read(key);
  }

  Future<void> logOut() async {
    await box.erase();
    await box.erase();
    isLogin(false);
    print('ERASEDDDDDDD');
  }
}
