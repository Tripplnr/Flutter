// showDialog(
//           context: context,
//           builder: (BuildContext context) => AlertDialog(
//             title: const Text("Enter Your Email"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 20),
//                   // height: 200,
//                   width: Get.width / 1.5,
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: email,
//                         onTap: () {
//                           print(email.text);
//                         },
//                         decoration: const InputDecoration(
//                           hintText: "Enter email",
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                       SizedBox(
//                         width: Get.width,
//                         height: 50,
//                       ),
//                       SizedBox(
//                         width: Get.width,
//                         height: 50,
//                         child: BrandedElevatedButton(
//                           text: "Add Email",
//                           onPressed: () {
//                             if (email.text.isNotEmpty &&
//                                 email.text != "" &&
//                                 email.text.contains("@")) {
//                               print("====>>>${email.text}");
//                               Future<dio.Response?> loginResponse =
//                                   ApiClient().login(
//                                       email.text, identityToken,
//                                       source: 'apple');
//                               EasyLoading.show(
//                                   status: LOADING_AUTHENTICATING);

//                               loginResponse.then((response) async {
//                                 if (response != null) {
//                                   printWrapped(
//                                       "response===== > $response dd");
//                                   Map<String, dynamic> loginResponse =
//                                       jsonDecode(response.toString());
//                                   printWrapped(
//                                       "response===== > > ${loginResponse["status"]} ddd");
//                                   debugPrint(
//                                       "response=====> > ${loginResponse["status"]['successful']}");
//                                   if (loginResponse["token"] != null) {
//                                     await Utils.saveToken(
//                                         loginResponse["token"]);
//                                     await Utils.saveRefreshToken(
//                                         loginResponse["refreshToken"]);
//                                     await Utils.saveCurrentUserDetails(
//                                         jsonEncode(
//                                             loginResponse["user"]));
//                                     UserModel? user =
//                                         await Utils.getCurrentUser();
//                                     //
//                                     // if (user != null) {
//                                     //   Cache.userFullName = "${user.first_name} ${user.last_name}";
//                                     //   Cache.userEmail = user.email;
//                                     //   Cache.userPhone = user.phone;
//                                     // }
//                                     if (user != null) {
//                                       print("user.paymentSource!.brand");
//                                       Cache.userFullName =
//                                           "${user.first_name} ${user.last_name}";
//                                       Cache.userEmail = user.email;
//                                       Cache.userPhone = user.phone;
//                                       if (user.paymentSources != null) {
//                                         if (user
//                                             .paymentSources!.isNotEmpty) {
//                                           print(jsonEncode(
//                                               user.paymentSources));
//                                           await Utils.savePaymentSource(
//                                               jsonEncode(
//                                                   user.paymentSources!));
//                                           print(Utils.getPaymentSource());
//                                           print(
//                                               "User Payment Sources ===>> ${user.paymentSources!}");
//                                         }
//                                       }
//                                     }
//                                     // EasyLoading.dismiss();
//                                     if (loginResponse["status"]
//                                             ['successful'] ==
//                                         true) {
//                                       print("TRUE");
//                                       Navigator.pushNamedAndRemoveUntil(
//                                           context, "/", (route) => false);
//                                       print("TRUE");
//                                     } else if (loginResponse["status"]
//                                             ['successful'] ==
//                                         false) {
//                                       print("FALSE");

//                                       EasyLoading.showError(loginResponse[
//                                           "messageForUser"]);
//                                     } else {
//                                       EasyLoading.showError(
//                                           "Login failed, please try again.");
//                                     }
//                                     print("TEST");
//                                   } else {
//                                     EasyLoading.dismiss();
//                                     print("FALSE");

//                                     var message = loginResponse["status"]
//                                             ["messageForUser"] ??
//                                         "Login failed, please try again.";
//                                     EasyLoading.showError(message);
//                                   }
//                                 } else {
//                                   EasyLoading.dismiss();
//                                   print("FALSE");

//                                   EasyLoading.showError(
//                                       "Login failed, please try again.");
//                                 }
//                               });
//                             } else if (!email.text.contains('@')) {
//                               EasyLoading.showError(
//                                   "Please Enter Valid Email.");
//                             } else {
//                               EasyLoading.showError(
//                                   "Please Enter Your Email.");
//                             }
//                           },)
