// import 'package:trippinr/auth_controller.dart';
// import 'package:trippinr/core/app_export.dart';
//
// import 'controller/login_controller.dart';
//
// // ignore_for_file: must_be_immutable
// class Login extends GetWidget<LoginController> {
//   final authController = Get.find<AuthController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         top: false,
//         bottom: false,
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             backgroundColor: ColorConstant.whiteA700,
//             body: Form(
//                 key: controller.formKey,
//                 child: SingleChildScrollView(
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: getVerticalSize(185.00),
//                         width: size.width,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(ImageConstant.imgRectangle23937),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: SafeArea(
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               // AppbarImage(
//                               //     height: getSize(24.00),
//                               //     width: getSize(24.00),
//                               //     svgPath: ImageConstant.imgArrowleft,
//                               //     color: ColorConstant.whiteA700,
//                               //     margin: getMargin(left: 20, top: 20),
//                               //     onTap: () {
//                               //       Get.back();
//                               //     }),
//                               Container(
//                                 margin: getMargin(top: size.height * 0.01),
//                                 height: getVerticalSize(95.00),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     AppbarTitle(
//                                         margin: getMargin(right: 0),
//                                         text: "lbl_explore_with".tr),
//                                     AppbarImage(
//                                       height: getVerticalSize(33.00),
//                                       width: getHorizontalSize(109.00),
//                                       svgPath: ImageConstant.imgGroupWhiteA700,
//                                       // margin: getMargin(right: 8)
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: getMargin(top: getVerticalSize(135.00)),
//                         child: Column(
//                           children: [
//                             Container(
//                                 padding: getPadding(
//                                     left: 19, top: 20, right: 19, bottom: 20),
//                                 decoration: AppDecoration.fillWhiteA700
//                                     .copyWith(
//                                         borderRadius:
//                                             BorderRadiusStyle.roundedBorder20),
//                                 child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Padding(
//                                           padding: getPadding(top: 2),
//                                           child: Text("lbl_login".tr,
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: AppTextStyle
//                                                   .txtPoppinsBold28)),
//                                       Padding(
//                                           padding: getPadding(top: 2),
//                                           child: Text(
//                                               "msg_enter_your_credential".tr,
//                                               overflow: TextOverflow.ellipsis,
//                                               textAlign: TextAlign.left,
//                                               style: AppTextStyle
//                                                   .txtPoppinsMedium16)),
//                                       CustomTextFormField(
//                                           autovalidateMode: AutovalidateMode
//                                               .onUserInteraction,
//                                           width: 335,
//                                           focusNode: FocusNode(),
//                                           controller:
//                                               controller.emailController,
//                                           hintText: "lbl_email".tr,
//                                           margin: getMargin(top: 14),
//                                           textInputAction: TextInputAction.done,
//                                           textInputType:
//                                               TextInputType.emailAddress,
//                                           prefix: Container(
//                                               margin: getMargin(
//                                                   left: 17,
//                                                   top: 17,
//                                                   right: 16,
//                                                   bottom: 17),
//                                               child: CustomImageView(
//                                                   svgPath:
//                                                       ImageConstant.imgMail)),
//                                           prefixConstraints: BoxConstraints(
//                                               maxHeight:
//                                                   getVerticalSize(58.00)),
//                                           validator: (value) {
//                                             if (!GetUtils.isEmail(value!))
//                                               return "Enter valid email";
//                                             // return null;
//
//                                             // if (value == null ||
//                                             //     (!isValidEmail(value,
//                                             //         isRequired: true))) {
//                                             //   return "Please enter valid email";
//                                             // }
//                                             // return null;
//                                           }),
//                                       SizedBox(
//                                         height: 15,
//                                       ),
//                                       // Container(
//                                       //     margin: getMargin(top: 16),
//                                       //     padding: getPadding(all: 17),
//                                       //     decoration: AppDecoration.fillGray10001
//                                       //         .copyWith(
//                                       //             borderRadius: BorderRadiusStyle
//                                       //                 .roundedBorder16),
//                                       //     child: Row(children: [
//                                       //       CustomImageView(
//                                       //           svgPath: ImageConstant.imgLock,
//                                       //           height: getSize(24.00),
//                                       //           width: getSize(24.00)),
//                                       //       Padding(
//                                       //           padding: getPadding(
//                                       //               left: 16, bottom: 2),
//                                       //           child: Text("lbl_password".tr,
//                                       //               overflow:
//                                       //                   TextOverflow.ellipsis,
//                                       //               textAlign: TextAlign.left,
//                                       //               style: AppTextStyle
//                                       //                   .txtPoppinsMedium14Gray600)),
//                                       //       Spacer(),
//                                       //       Padding(
//                                       //           padding: getPadding(top: 2),
//                                       //           child: InkWell(
//                                       //             onTap: () {
//                                       //               // Get.toNamed(
//                                       //               //     AppRoutes.forgot);
//                                       //             },
//                                       //             child: Text("lbl_forgot".tr,
//                                       //                 overflow:
//                                       //                     TextOverflow.ellipsis,
//                                       //                 textAlign: TextAlign.left,
//                                       //                 style: AppTextStyle
//                                       //                     .txtPoppinsSemiBold14Black90002),
//                                       //           ))
//                                       //     ])),
//                                       CustomTextFormField(
//                                           isObscureText: true,
//                                           suffix: Padding(
//                                               padding: getPadding(
//                                                   top: 18, right: 15),
//                                               child: InkWell(
//                                                 onTap: () {
//                                                   Get.toNamed(AppRoutes.forgot);
//                                                 },
//                                                 child: Text("lbl_forgot".tr,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     textAlign: TextAlign.left,
//                                                     style: AppTextStyle
//                                                         .txtPoppinsSemiBold14Black90002),
//                                               )),
//                                           autovalidateMode: AutovalidateMode
//                                               .onUserInteraction,
//                                           width: 335,
//                                           focusNode: FocusNode(),
//                                           controller:
//                                               controller.passwordController,
//                                           hintText: "lbl_password".tr,
//                                           // margin: getMargin(top: 14),
//                                           // textInputAction: TextInputAction.,
//                                           textInputType:
//                                               TextInputType.visiblePassword,
//                                           prefix: Container(
//                                               margin: getMargin(
//                                                 left: 17,
//                                                 top: 17,
//                                                 bottom: 17,
//                                                 right: 16,
//                                               ),
//                                               child: CustomImageView(
//                                                   svgPath:
//                                                       ImageConstant.imgLock)),
//                                           prefixConstraints: BoxConstraints(
//                                               maxHeight:
//                                                   getVerticalSize(58.00)),
//                                           validator: (value) {
//                                             // return null;
//
//                                             if (value == null ||
//                                                 (!isValidPassword(value,
//                                                     isRequired: true))) {
//                                               return "Enter valid password";
//                                             }
//                                             return null;
//                                           }),
//
//                                       CustomButton(
//                                           height: 58,
//                                           width: 335,
//                                           text: "lbl_login".tr,
//                                           margin: getMargin(top: 16),
//                                           fontStyle:
//                                               ButtonFontStyle.PoppinsMedium15,
//                                           onTap: () {
//                                             controller.onTapLogin(
//                                                 email: controller
//                                                     .emailController.text
//                                                     .trim(),
//                                                 password: controller
//                                                     .passwordController.text
//                                                     .trim());
//                                             //HomeRepository().fetchPopularHotels();
//
//                                             // Get.toNamed(
//                                             //     AppRoutes.bottom_nav_bar);
//                                             // controller.onTapLogin();
//                                           })
//                                     ])),
//                             Padding(
//                                 padding: getPadding(top: 9),
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Container(
//                                           height: getVerticalSize(2.00),
//                                           width: getHorizontalSize(94.00),
//                                           margin: getMargin(
//                                               top: 18, bottom: 18, left: 9),
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       getHorizontalSize(1.00)),
//                                               gradient: LinearGradient(
//                                                   begin: Alignment(-1, 10),
//                                                   end: Alignment(0, -5),
//                                                   colors: [
//                                                     // ColorConstant.blueGray10000,
//                                                     ColorConstant.blueGray10000,
//                                                     ColorConstant.blueGray10001,
//                                                   ]))),
//                                       Container(
//                                           width: getSize(38.00),
//                                           height: getSize(38.00),
//                                           margin: getMargin(left: 9),
//                                           padding: getPadding(),
//                                           decoration: AppDecoration
//                                               .txtFillGray10001
//                                               .copyWith(
//                                                   borderRadius:
//                                                       BorderRadiusStyle
//                                                           .txtCircleBorder19),
//                                           child: Center(
//                                             child: Text("lbl_or".tr,
//                                                 // overflow: TextOverflow.ellipsis,
//                                                 textAlign: TextAlign.center,
//                                                 style: AppTextStyle
//                                                     .txtPoppinsBold14Gray60001),
//                                           )),
//                                       Container(
//                                           height: getVerticalSize(2.00),
//                                           width: getHorizontalSize(94.00),
//                                           margin: getMargin(
//                                               left: 9, top: 18, bottom: 18),
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       getHorizontalSize(1.00)),
//                                               gradient: LinearGradient(
//                                                   begin: Alignment(0, 0.5),
//                                                   end: Alignment(1, 1),
//                                                   colors: [
//                                                     ColorConstant.blueGray10001,
//                                                     ColorConstant.blueGray10000
//                                                   ])))
//                                     ])),
//                             CustomButton(
//                                 height: 54,
//                                 width: 335,
//                                 text: "msg_login_with_google".tr,
//                                 margin: getMargin(top: 13),
//                                 variant: ButtonVariant.FillGray10001,
//                                 padding: ButtonPadding.PaddingT15,
//                                 fontStyle: ButtonFontStyle.PoppinsSemiBold14,
//                                 prefixWidget: Container(
//                                     margin: getMargin(right: 11),
//                                     child: CustomImageView(
//                                         svgPath: ImageConstant.imgGoogle)),
//                                 onTap: () {
//                                   onTapLoginwithgoogle();
//                                 }
//                                 // onTapLogin
//                                 // onTapLoginwithgoogle
//                                 ),
//                             CustomButton(
//                                 height: 54,
//                                 width: 335,
//                                 text: "msg_login_with_facebook".tr,
//                                 margin: getMargin(top: 12),
//                                 variant: ButtonVariant.FillBlueA400,
//                                 padding: ButtonPadding.PaddingT15,
//                                 fontStyle:
//                                     ButtonFontStyle.PoppinsSemiBold14WhiteA700,
//                                 prefixWidget: Container(
//                                     margin: getMargin(right: 11),
//                                     child: CustomImageView(
//                                         svgPath: ImageConstant.imgFile)),
//                                 onTap: () {
//                                   authController.isLoggedIn.value = true;
//                                   print(authController.isLoggedIn.value);
//                                   Get.offAndToNamed(AppRoutes.bottom_nav_bar);
//                                 }
//                                 // onTapLogin
//                                 ),
//                             CustomButton(
//                                 onTap: () {
//                                   // loginpopup();
//                                   authController.isLoggedIn.value = true;
//                                   Get.offAndToNamed(AppRoutes.bottom_nav_bar);
//                                 },
//                                 height: 54,
//                                 width: 335,
//                                 text: "msg_login_with_apple".tr,
//                                 margin: getMargin(top: 12),
//                                 variant: ButtonVariant.FillBlack90001,
//                                 padding: ButtonPadding.PaddingT15,
//                                 fontStyle:
//                                     ButtonFontStyle.PoppinsSemiBold14WhiteA700,
//                                 prefixWidget: Container(
//                                     margin: getMargin(right: 11),
//                                     child: CustomImageView(
//                                         svgPath: ImageConstant.imgApplelogo))),
//                             Padding(
//                                 padding: getPadding(top: 18),
//                                 child: Text("msg_don_t_have_an_account".tr,
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppTextStyle
//                                         .txtPoppinsMedium14Gray60001)),
//                             GestureDetector(
//                                 onTap: () {
//                                   onTapRegister();
//                                 },
//                                 child: Padding(
//                                     padding: getPadding(top: 3, bottom: 5),
//                                     child: Text("lbl_create_account".tr,
//                                         overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.left,
//                                         style: AppTextStyle
//                                             .txtPoppinsSemiBold14Yellow900))),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ))));
//   }
//
//   onTapArrowleft() {
//     Get.back();
//   }
//
//   // onTapLogin() {
//   //   if (_formKey.currentState!.validate()) {
//   //     print("valid");
//   //     // Get.toNamed(AppRoutes.bottom_nav_bar);
//   //   } else {
//   //     Get.snackbar("Error Login", "Enter valid email and Password");
//   //     print("Unvalid");
//   //   }
//   // }
//
//   onTapLoginwithgoogle() async {
//     await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
//       if (googleUser != null) {
//         controller.socialLogin(
//             email: googleUser.email, socialId: googleUser.id);
//         /*  print("value of email is ${googleUser.email}");
//         print("value of social id ${googleUser.id}");
//         print("value of serverAuthCode is ${googleUser.serverAuthCode}");
//         print("value of displayname is ${googleUser.displayName}");
//         print("value of photourl is ${googleUser.photoUrl}");*/
//
//         /*  homeRepository.fetchPopularHotels().then((value) {
//           if (value) {
//             Get.toNamed(AppRoutes.bottom_nav_bar);
//           }
//           print("=>$value");
//         });*/
//         //TODO Actions to be performed after signin
//       } else {
//         Get.snackbar('Error', 'user data is empty');
//       }
//     }).catchError((onError) {
//       Get.snackbar('Error', onError.toString());
//     });
//   }
//
//   onTapLoginwithfacebook() async {
//     await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
//       //TODO Actions to be performed after signin
//     }).catchError((onError) {
//       Get.snackbar('Error', onError.toString());
//     });
//   }
//
//   onTapRegister() {
//     Get.toNamed(AppRoutes.register);
//   }
// }
