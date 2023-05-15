import 'package:trippinr/core/app_export.dart';

import 'controller/forgot_password_controller.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Form(
              key: controller.formKey,
              child: Container(
                height: size.height,
                width: size.width,
                padding: getPadding(left: 20, right: 10, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                        svgPath: ImageConstant.imgArrowleftBlack90002,
                        height: getSize(24.00),
                        width: getSize(24.00),
                        onTap: () {
                          Get.back();
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: getPadding(top: 2),
                        child: Text("Forgot Password",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppTextStyle.txtPoppinsBold28)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                        "Enter your email address and we will send a link to reset your password",
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium16),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        width: 335,
                        focusNode: FocusNode(),
                        controller: controller.emailController,
                        hintText: "lbl_email".tr,
                        margin: getMargin(top: 14),
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        prefix: Container(
                            margin: getMargin(
                                left: 17, top: 17, right: 16, bottom: 17),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgMail)),
                        prefixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(58.00)),
                        validator: (value) {
                          // return null;

                          if (!GetUtils.isEmail(value!)) {
                            return "Please enter valid email";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                        height: 58,
                        width: 335,
                        text: "Continue",
                        margin: getMargin(top: 16),
                        fontStyle: ButtonFontStyle.PoppinsMedium15,
                        onTap: () {
                          controller.onTapForgotPassword();
                          // Get.back();
                        })
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
