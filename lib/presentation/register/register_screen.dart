import 'package:trippinr/core/app_export.dart';

import 'controller/register_controller.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatelessWidget {
  String? callFrom;
  RegisterScreen({this.callFrom});
  // GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // RegisterController controller = Get.put(RegisterController());

    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: GetBuilder<RegisterController>(
                init: RegisterController(),
                // initState: (state) {
                //   state.controller?.onInit();
                // },
                builder: (controller) {
                  return Form(
                      key: controller.formKey,
                      child: Container(
                          width: size.width,
                          child: SafeArea(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                          child: Container(
                                              width: size.width,
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        width: getHorizontalSize(
                                                            374.00),
                                                        padding: getPadding(
                                                            left: 19,
                                                            top: 10,
                                                            right: 19,
                                                            bottom: 10),
                                                        decoration: AppDecoration
                                                            .fillWhiteA700
                                                            .copyWith(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .roundedBorder20),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgArrowleftBlack90002,
                                                                  height:
                                                                      getSize(
                                                                          24.00),
                                                                  width: getSize(
                                                                      24.00),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    // Get.back();
                                                                  }),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                      callFrom ==
                                                                              "Edit"
                                                                          ? "Update Account"
                                                                          : "lbl_create_account"
                                                                              .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppTextStyle
                                                                          .txtPoppinsBold28)),
                                                              callFrom == "Edit"
                                                                  ? Container()
                                                                  : Padding(
                                                                      padding: getPadding(
                                                                          top:
                                                                              4),
                                                                      child: Text(
                                                                          "msg_enter_your_credential"
                                                                              .tr,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style:
                                                                              AppTextStyle.txtPoppinsMedium16)),
                                                              CustomTextFormField(
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  width: 335,
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      controller
                                                                          .firstNameController,
                                                                  hintText: callFrom ==
                                                                          "Edit"
                                                                      ? controller
                                                                          .firstNameController
                                                                          .value
                                                                          .text
                                                                      : "lbl_first_name"
                                                                          .tr,
                                                                  margin: getMargin(
                                                                      top: 14),
                                                                  prefix: Container(
                                                                      margin: getMargin(
                                                                          left:
                                                                              17,
                                                                          top:
                                                                              17,
                                                                          right:
                                                                              16,
                                                                          bottom:
                                                                              17),
                                                                      child: CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgUserGray600)),
                                                                  prefixConstraints:
                                                                      BoxConstraints(
                                                                          maxHeight:
                                                                              getVerticalSize(58.00)),
                                                                  validator: (value) {
                                                                    if (!isText(
                                                                        value)) {
                                                                      return "Please enter first name";
                                                                    }
                                                                    return null;
                                                                  }),
                                                              CustomTextFormField(
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  width: 335,
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      controller
                                                                          .lastNameController,
                                                                  hintText: callFrom ==
                                                                          "Edit"
                                                                      ? controller
                                                                          .lastNameController
                                                                          .value
                                                                          .text
                                                                      : "lbl_last_name"
                                                                          .tr,
                                                                  margin: getMargin(
                                                                      top: 16),
                                                                  prefix: Container(
                                                                      margin: getMargin(
                                                                          left:
                                                                              17,
                                                                          top:
                                                                              17,
                                                                          right:
                                                                              16,
                                                                          bottom:
                                                                              17),
                                                                      child: CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgUserGray600)),
                                                                  prefixConstraints:
                                                                      BoxConstraints(
                                                                          maxHeight:
                                                                              getVerticalSize(58.00)),
                                                                  validator: (value) {
                                                                    if (!isText(
                                                                        value)) {
                                                                      return "Please enter last name";
                                                                    }
                                                                    return null;
                                                                  }),
                                                              CustomTextFormField(
                                                                  enabled:
                                                                      callFrom != "Edit"
                                                                          ? true
                                                                          : false,
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  width: 335,
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      controller
                                                                          .emailController,
                                                                  hintText: callFrom ==
                                                                          "Edit"
                                                                      ? controller
                                                                          .emailController
                                                                          .value
                                                                          .text
                                                                      : "lbl_email"
                                                                          .tr,
                                                                  margin: getMargin(
                                                                      top: 16),
                                                                  textInputType:
                                                                      TextInputType
                                                                          .emailAddress,
                                                                  prefix: Container(
                                                                      margin: getMargin(
                                                                          left:
                                                                              17,
                                                                          top:
                                                                              17,
                                                                          right:
                                                                              16,
                                                                          bottom:
                                                                              17),
                                                                      child: CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgMail)),
                                                                  prefixConstraints:
                                                                      BoxConstraints(maxHeight: getVerticalSize(58.00)),
                                                                  validator: (value) {
                                                                    if (!GetUtils.isEmail(
                                                                            value!)
                                                                        // value ==
                                                                        //         null ||
                                                                        //     (!isValidEmail(
                                                                        //         value,
                                                                        //         isRequired:
                                                                        //             true))
                                                                        )
                                                                      return "Please enter valid email";
                                                                    return null;

                                                                    // return null;
                                                                  }),
                                                              callFrom == "Edit"
                                                                  ? Container()
                                                                  : CustomTextFormField(
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .done,
                                                                      width:
                                                                          335,
                                                                      focusNode:
                                                                          FocusNode(),
                                                                      controller:
                                                                          controller
                                                                              .passwordController,
                                                                      hintText: callFrom ==
                                                                              "Edit"
                                                                          ? "********"
                                                                          : "lbl_password"
                                                                              .tr,
                                                                      margin:
                                                                          getMargin(
                                                                              top:
                                                                                  16),
                                                                      textInputType:
                                                                          TextInputType
                                                                              .visiblePassword,
                                                                      prefix: Container(
                                                                          margin: getMargin(
                                                                              left:
                                                                                  17,
                                                                              top:
                                                                                  17,
                                                                              right:
                                                                                  16,
                                                                              bottom:
                                                                                  17),
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgLock)),
                                                                      prefixConstraints:
                                                                          BoxConstraints(
                                                                              maxHeight: getVerticalSize(
                                                                                  58.00)),
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            (!isValidPassword(value,
                                                                                isRequired: true))) {
                                                                          return "msg_password_validation"
                                                                              .tr;
                                                                        }
                                                                        return null;
                                                                      },
                                                                      isObscureText:
                                                                          true),
                                                              callFrom == "Edit"
                                                                  ? Container()
                                                                  : CustomTextFormField(
                                                                      autovalidateMode: AutovalidateMode
                                                                          .onUserInteraction,
                                                                      width:
                                                                          335,
                                                                      focusNode:
                                                                          FocusNode(),
                                                                      // controller:
                                                                      //     controller
                                                                      //         .passwordController,
                                                                      hintText:
                                                                          "msg_confirm_password"
                                                                              .tr,
                                                                      margin:
                                                                          getMargin(
                                                                              top:
                                                                                  16),
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .done,
                                                                      textInputType:
                                                                          TextInputType
                                                                              .visiblePassword,
                                                                      prefix: Container(
                                                                          margin: getMargin(
                                                                              left:
                                                                                  17,
                                                                              top:
                                                                                  17,
                                                                              right:
                                                                                  16,
                                                                              bottom:
                                                                                  17),
                                                                          child: CustomImageView(
                                                                              svgPath: ImageConstant
                                                                                  .imgLock)),
                                                                      prefixConstraints: BoxConstraints(
                                                                          maxHeight: getVerticalSize(
                                                                              58.00)),
                                                                      validator:
                                                                          (value) {
                                                                        if (value!
                                                                            .isEmpty) {
                                                                          return "Please enter confirm Password";
                                                                        } else if (value !=
                                                                            controller.passwordController.text)
                                                                        // (!isValidPassword(
                                                                        //     value,
                                                                        //     isRequired:
                                                                        //         true))
                                                                        {
                                                                          return "Password do not match";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      isObscureText:
                                                                          true),
                                                              CustomButton(
                                                                  height: 58,
                                                                  width: 335,
                                                                  text: callFrom ==
                                                                          "Edit"
                                                                      ? "Update Account"
                                                                      : "lbl_create_account"
                                                                          .tr,
                                                                  margin: getMargin(
                                                                      top: 16,
                                                                      bottom:
                                                                          10),
                                                                  padding:
                                                                      ButtonPadding
                                                                          .PaddingAll17,
                                                                  fontStyle:
                                                                      ButtonFontStyle
                                                                          .PoppinsMedium15,
                                                                  onTap: () {
                                                                    callFrom ==
                                                                            "Edit"
                                                                        ? controller.updateProfile(
                                                                            context,
                                                                            controller
                                                                                .firstNameController.text,
                                                                            controller
                                                                                .lastNameController.text)
                                                                        : controller.onTapRegister(
                                                                            firstName:
                                                                                controller.firstNameController.text,
                                                                            lastName: controller.lastNameController.text,
                                                                            email: controller.emailController.text,
                                                                            password: controller.passwordController.text);
                                                                  }),
                                                            ])),
                                                    callFrom == "Edit"
                                                        ? Container()
                                                        : Padding(
                                                            padding: getPadding(
                                                                top: 115),
                                                            child: Text(
                                                                "msg_already_have_an"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppTextStyle
                                                                    .txtPoppinsMedium14Gray60001)),
                                                    callFrom == "Edit"
                                                        ? Container()
                                                        : GestureDetector(
                                                            onTap: () {
                                                              onTapLogin();
                                                            },
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 2,
                                                                        bottom:
                                                                            34),
                                                                child: Text(
                                                                    "lbl_login"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppTextStyle
                                                                        .txtPoppinsSemiBold14Yellow900)))
                                                  ]))))
                                ]),
                          )));
                })));
  }

  onTapImgArrowleft() {
    Get.back();
  }

  // onTapRegister() {
  //   if (_formKey.currentState!.validate()) {
  //     print("valid");
  //     // Get.toNamed(AppRoutes.login);
  //   } else {}
  //   ;
  // }

  onTapLogin() {
    // Get.toNamed(AppRoutes.home);
    Get.back();
  }
}
