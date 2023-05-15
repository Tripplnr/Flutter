// import 'package:trippinr/auth_controller.dart';
// import 'package:trippinr/core/app_export.dart';
//
// import 'controller/login_popup_controller.dart';
//
// // ignore_for_file: must_be_immutable
// class LogoinPopup extends GetWidget<LogoinPopupController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: getMargin(top: 250),
//         height: 50,
//         width: size.width,
//         decoration: BoxDecoration(
//             color: Colors.red, borderRadius: BorderRadius.circular(16)),
//         child: AlertDialog(
//             insetPadding:
//                 EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
//             content: SingleChildScrollView(
//               child: Container(
//                 // margin: getMargin(top: getVerticalSize(135.00)),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                         padding: getPadding(top: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Text("lbl_login".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style: AppTextStyle.txtPoppinsBold28),
//                             ),
//                             Container(
//                                 height: 30,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: ColorConstant.gray10001),
//                                 child: Icon(
//                                   Icons.close,
//                                   color: ColorConstant.black,
//                                 )),
//                           ],
//                         )),
//                     Padding(
//                         padding: getPadding(top: 2),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text("msg_enter_your_credential".tr,
//                               overflow: TextOverflow.ellipsis,
//                               textAlign: TextAlign.left,
//                               style: AppTextStyle.txtPoppinsMedium16),
//                         )),
//                     CustomTextFormField(
//                         width: 335,
//                         focusNode: FocusNode(),
//                         // controller: controller.emailController,
//                         hintText: "lbl_email".tr,
//                         margin: getMargin(top: 14),
//                         textInputAction: TextInputAction.done,
//                         textInputType: TextInputType.emailAddress,
//                         prefix: Container(
//                             margin: getMargin(
//                                 left: 17, top: 17, right: 16, bottom: 17),
//                             child: CustomImageView(
//                                 svgPath: ImageConstant.imgMail)),
//                         prefixConstraints:
//                             BoxConstraints(maxHeight: getVerticalSize(58.00)),
//                         validator: (value) {
//                           return null;
//
//                           // if (value == null ||
//                           //     (!isValidEmail(
//                           //         value,
//                           //         isRequired:
//                           //             true))) {
//                           //   return "Please enter valid email";
//                           // }
//                           // return null;
//                         }),
//                     Container(
//                         margin: getMargin(top: 16),
//                         padding: getPadding(all: 17),
//                         decoration: AppDecoration.fillGray10001.copyWith(
//                             borderRadius: BorderRadiusStyle.roundedBorder16),
//                         child: Row(children: [
//                           CustomImageView(
//                               svgPath: ImageConstant.imgLock,
//                               height: getSize(24.00),
//                               width: getSize(24.00)),
//                           Padding(
//                               padding: getPadding(left: 16, bottom: 2),
//                               child: Text("lbl_password".tr,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.left,
//                                   style:
//                                       AppTextStyle.txtPoppinsMedium14Gray600)),
//                           Spacer(),
//                           Padding(
//                               padding: getPadding(top: 2),
//                               child: InkWell(
//                                 onTap: () {
//                                   // Get.toNamed(
//                                   //     AppRoutes.forgot);
//                                 },
//                                 child: Text("lbl_forgot".tr,
//                                     overflow: TextOverflow.ellipsis,
//                                     textAlign: TextAlign.left,
//                                     style: AppTextStyle
//                                         .txtPoppinsSemiBold14Black90002),
//                               ))
//                         ])),
//                     CustomButton(
//                       height: 58,
//                       width: 335,
//                       text: "lbl_login".tr,
//                       margin: getMargin(top: 16),
//                       fontStyle: ButtonFontStyle.PoppinsMedium15,
//                       onTap: () {
//                         print("lbl_login");
//                         final _controller = Get.find<AuthController>();
//                         _controller.isLoggedIn.value = true;
//                         Navigator.pop(context);
//                       },
//                       // onTap: onTapLogin
//                     ),
//                     Padding(
//                         padding: getPadding(top: 9),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               // Container(
//                               //   height: 2,
//                               //   width: 100,
//                               //   decoration: BoxDecoration(
//                               //       color: Colors.red,
//                               //       borderRadius: BorderRadius.circular(
//                               //           getHorizontalSize(1.00)),
//                               //       gradient: LinearGradient(
//                               //           begin: Alignment(0, 0.1),
//                               //           end: Alignment(1, 2),
//                               //           colors: [
//                               //             ColorConstant.blueGray10000,
//                               //             ColorConstant.blueGray10001
//                               //           ])),
//                               // ),
//                               Container(
//                                   height: getVerticalSize(2.00),
//                                   width: getHorizontalSize(94.00),
//                                   margin:
//                                       getMargin(top: 18, bottom: 18, left: 9),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                           getHorizontalSize(1.00)),
//                                       gradient: LinearGradient(
//                                           begin: Alignment(-1.5, 0.5),
//                                           end: Alignment(1, 1),
//                                           colors: [
//                                             ColorConstant.blueGray10000,
//                                             ColorConstant.blueGray10001
//                                           ]))),
//                               Container(
//                                   width: getSize(38.00),
//                                   height: getSize(38.00),
//                                   margin: getMargin(left: 9),
//                                   padding: getPadding(),
//                                   decoration: AppDecoration.txtFillGray10001
//                                       .copyWith(
//                                           borderRadius: BorderRadiusStyle
//                                               .txtCircleBorder19),
//                                   child: Center(
//                                     child: Text("lbl_or".tr,
//                                         // overflow: TextOverflow.ellipsis,
//                                         textAlign: TextAlign.center,
//                                         style: AppTextStyle
//                                             .txtPoppinsBold14Gray60001),
//                                   )),
//                               Container(
//                                   height: getVerticalSize(2.00),
//                                   width: getHorizontalSize(94.00),
//                                   margin:
//                                       getMargin(left: 9, top: 18, bottom: 18),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(
//                                           getHorizontalSize(1.00)),
//                                       gradient: LinearGradient(
//                                           begin: Alignment(0, 0.5),
//                                           end: Alignment(1, 1),
//                                           colors: [
//                                             ColorConstant.blueGray10001,
//                                             ColorConstant.blueGray10000
//                                           ])))
//                             ])),
//                     CustomButton(
//                       height: 54,
//                       width: 335,
//                       text: "msg_login_with_google".tr,
//                       margin: getMargin(top: 13),
//                       variant: ButtonVariant.FillGray10001,
//                       padding: ButtonPadding.PaddingT15,
//                       fontStyle: ButtonFontStyle.PoppinsSemiBold14,
//                       prefixWidget: Container(
//                           margin: getMargin(right: 11),
//                           child: CustomImageView(
//                               svgPath: ImageConstant.imgGoogle)),
//                       // onTap: onTapLogin
//                       // onTapLoginwithgoogle
//                     ),
//                     CustomButton(
//                       height: 54,
//                       width: 335,
//                       text: "msg_login_with_facebook".tr,
//                       margin: getMargin(top: 12),
//                       variant: ButtonVariant.FillBlueA400,
//                       padding: ButtonPadding.PaddingT15,
//                       fontStyle: ButtonFontStyle.PoppinsSemiBold14WhiteA700,
//                       prefixWidget: Container(
//                           margin: getMargin(right: 11),
//                           child:
//                               CustomImageView(svgPath: ImageConstant.imgFile)),
//                       // onTap: onTapLogin
//                     ),
//                     CustomButton(
//                         // onTap: onTapLogin,
//                         height: 54,
//                         width: 335,
//                         text: "msg_login_with_apple".tr,
//                         margin: getMargin(top: 12),
//                         variant: ButtonVariant.FillBlack90001,
//                         padding: ButtonPadding.PaddingT15,
//                         fontStyle: ButtonFontStyle.PoppinsSemiBold14WhiteA700,
//                         prefixWidget: Container(
//                             margin: getMargin(right: 11),
//                             child: CustomImageView(
//                                 svgPath: ImageConstant.imgApplelogo))),
//                     Padding(
//                         padding: getPadding(top: 18),
//                         child: Text("msg_don_t_have_an_account".tr,
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: AppTextStyle.txtPoppinsMedium14Gray60001)),
//                     GestureDetector(
//                         onTap: () {
//                           // onTapRegister();
//                         },
//                         child: Padding(
//                             padding: getPadding(top: 3, bottom: 5),
//                             child: Text("lbl_create_account".tr,
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: AppTextStyle
//                                     .txtPoppinsSemiBold14Yellow900))),
//                   ],
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }
