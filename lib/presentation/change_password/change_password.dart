import 'package:trippinr/core/app_export.dart';

import 'controller/change_password_controller.dart';

// ignore_for_file: must_be_immutable
class ChangePassword extends GetWidget<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstant.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: getPadding(left: 20, right: 20, top: 15),
              height: size.height,
              width: size.width,
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomImageView(
                    //     svgPath: ImageConstant.imgArrowleftBlack90002,
                    //     height: getSize(24.00),
                    //     width: getSize(24.00),
                    //     onTap: () {
                    //       Get.back();
                    //     }),


                    Container(
                      margin: getMargin(left: 0),
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: CustomImageView(
                          svgPath: ImageConstant.imgArrowleft,
                          color: ColorConstant.black,
                          fit: BoxFit.scaleDown,
                          height: 20,
                          width: 20,
                        ),
                      ),

                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: getPadding(top: 2),
                        child: Text("Change Password",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppTextStyle.txtPoppinsBold28)),
                    SizedBox(
                      height: 13,
                    ),
                    Text("Enter your current password to change your password",
                        textAlign: TextAlign.left,
                        style: AppTextStyle.txtPoppinsMedium16),
                    SizedBox(
                      height: 13,
                    ),
                    CustomTextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      width: 335,
                      focusNode: FocusNode(),
                      controller: controller.currentpasswordcontroller,
                      hintText: "Current password".tr,
                      isObscureText: true,
                      margin: getMargin(top: 14),
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                          margin: getMargin(
                              left: 17, top: 17, right: 16, bottom: 17),
                          child:
                              CustomImageView(svgPath: ImageConstant.imgLock)),
                      prefixConstraints:
                          BoxConstraints(maxHeight: getVerticalSize(58.00)),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          return "Please valid current password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        width: 335,
                        focusNode: FocusNode(),
                        controller: controller.newpasswordcontroller,
                        hintText: "New password".tr,
                        margin: getMargin(top: 14),
                        isObscureText: true,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        prefix: Container(
                            margin: getMargin(
                                left: 17, top: 17, right: 16, bottom: 17),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgLock)),
                        prefixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(58.00)),
                        validator: (value) {
                          if (value == null ||
                              (!isValidPassword(value, isRequired: true))) {
                            return "Please enter new password";
                          } else if (controller.newpasswordcontroller.text ==
                              controller.currentpasswordcontroller.text) {
                            return "New password same as current password!\nPlease try another one.";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        width: 335,
                        focusNode: FocusNode(),
                        controller: controller.confirmpasswordcontroller,
                        hintText: "Confirm password".tr,
                        margin: getMargin(top: 14),
                        isObscureText: true,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        prefix: Container(
                            margin: getMargin(
                                left: 17, top: 17, right: 16, bottom: 17),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgLock)),
                        prefixConstraints:
                            BoxConstraints(maxHeight: getVerticalSize(58.00)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter confirm Password";
                          } else if (value !=
                              controller.newpasswordcontroller.text)
                          // (!isValidPassword(
                          //     value,
                          //     isRequired:
                          //         true))
                          {
                            return "Password do not match";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        height: 58,
                        width: 335,
                        text: "Change Password".tr,
                        margin: getMargin(top: 16),
                        fontStyle: ButtonFontStyle.PoppinsMedium15,
                        onTap: () {
                          controller.onTapChangePassword();
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
