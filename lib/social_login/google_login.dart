import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/*class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {

        final UserCredential userCredential = await auth.signInWithPopup(authProvider);
        user = userCredential.user;

      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn;
      // final GoogleSignIn googleSignIn = GoogleSignIn(clientId: "com.googleusercontent.apps.4006083539-3n9sbo2ttfscfcl3l32p529o23crffpa");

      if (Platform.isAndroid) {
        googleSignIn = GoogleSignIn();
      } else {
        googleSignIn = GoogleSignIn(
            clientId: "4006083539-676gmfcq1dik44bfrvm3lr6vk027f9od.apps.googleusercontent.com");
      }

      print("userDetils11111......");
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      print("userDetils22222......");
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        log("idtocken...... ${googleSignInAuthentication.idToken}");
        print("aaaaaaaa...... ${googleSignInAuthentication.idToken}");
        print("aaaaaaaa...... ${googleSignInAuthentication.idToken!.length}");
        try {
          final UserCredential userCredential = await auth.signInWithCredential(credential);
          user = userCredential.user;

          print("userDetils...... ${user!.displayName ?? ""}");
          print("userDetils...... ${user.uid}");
          print("userDetils...... ${user.tenantId ?? ""}");
          // print("userDetils...... ${user!.getIdTokenResult()??""}");
          var b = await user.getIdTokenResult();
          print("userDetils...... ${b}");

          var a = await user.getIdToken();
          print("userDetils...... ${a.length}");
          // print("userDetils...... ${a}");
          log(a);
          print("userDetils...... ${a.length}");
          Future<dio.Response?> loginResponse = ApiClient().login(
              user.email!, googleSignInAuthentication.idToken!,
              source: 'google');
          //EasyLoading.show(status: LOADING_AUTHENTICATING);

          void printWrapped(String text) {
            final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
            pattern.allMatches(text).forEach((match) => print(match.group(0)));
          }

          loginResponse.then((response) async {
            if (response != null) {
              printWrapped("response===== > $response dd");

              Map<String, dynamic> loginResponse =
                  jsonDecode(response.toString());
              printWrapped("response===== > > ${loginResponse["status"]} ddd");

              print(
                  "response=====> > ${loginResponse["status"]['successful']}");
              if (loginResponse["token"] != null) {
                await Utils.saveToken(loginResponse["token"]);
                await Utils.saveRefreshToken(loginResponse["refreshToken"]);
                await Utils.saveCurrentUserDetails(jsonEncode(loginResponse["user"]));

                UserModel? user = await Utils.getCurrentUser();
                //
                // if (user != null) {
                //   Cache.userFullName = "${user.first_name} ${user.last_name}";
                //   Cache.userEmail = user.email;
                //   Cache.userPhone = user.phone;
                // }
                if (user != null) {
                  print("user.paymentSource!.brand");
                  // print(user.paymentSource?.brand);
                  Cache.userFullName = "${user.first_name} ${user.last_name}";
                  Cache.userEmail = user.email;
                  Cache.userPhone = user.phone;
                  if (user.paymentSources != null) {
                    if (user.paymentSources!.isNotEmpty) {
                      print(jsonEncode(user.paymentSources));
                      await Utils.savePaymentSource(jsonEncode(user.paymentSources!));
                      print(Utils.getPaymentSource());
                      print("User Payment Sources ===>> ${user.paymentSources!}");
                    }

                    // List<PaymentSources>? d = [];
                    // d.add(PaymentSources(
                    //   token: "asdfasdf",
                    //   brand: "master",
                    //   last4: "2133",
                    //   expMonth: 4,
                    //   expYear: 22
                    //
                    // ));
                    // Utils.savePaymentSource(jsonEncode(d));

                  }
                }
                //EasyLoading.dismiss();
                if (loginResponse["status"]['successful'] == true) {
                  print("TRUE");
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/", (route) => false);
                  print("TRUE");
                } else if (loginResponse["status"]['successful'] == false) {
                  print("FALSE");

                  //EasyLoading.showError(loginResponse["messageForUser"]);
                } else {
                  //EasyLoading.showError("Login failed, please try again.");
                }
                print("TEST");

                // switch (response.statusCode) {
                //   case 200:
                //
                //     Navigator.pushNamedAndRemoveUntil(
                //         context, "/", (route) => false);
                //     break;
                //   case 400:
                //     EasyLoading.showError(loginResponse["messageForUser"]);
                //     break;
                //   default:
                //     EasyLoading.showError("Login failed, please try again.");
                // }
              } else {
                //EasyLoading.dismiss();
                print("FALSE");

                var message = loginResponse["status"]["messageForUser"] ??
                    "Login failed, please try again.";
                //EasyLoading.showError(message);
              }
            } else {
              //EasyLoading.dismiss();
              print("FALSE");
              //EasyLoading.showError("Login failed, please try again.");
            }
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
        log(googleSignInAuthentication.idToken!);
      }
    }

    return user;
  }
}*/
