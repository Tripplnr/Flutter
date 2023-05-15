import 'dart:io';

import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/settings/controller/settings_controller.dart';

class Currency extends GetWidget<SettingsController> {
  UserSessionController _userSessionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          // extendBody: true,
          // extendBodyBehindAppBar: true,
          backgroundColor: ColorConstant.white,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // RawAutocomplete(
                //     optionsViewBuilder: (BuildContext context),
                //     optionsBuilder: (TextEditingValue texteditingvalue){
                //
                //     }),
                Container(
                  color: ColorConstant.yellow900,
                  height: getVerticalSize(Platform.isAndroid ? 100.00 : 120),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppbarImage(
                            height: getSize(24.00),
                            width: getSize(24.00),
                            svgPath: ImageConstant.imgArrowleft,
                            color: ColorConstant.whiteA700,
                            margin: getMargin(
                              left: 20,
                            ),
                            onTap: () {
                              Get.back(canPop: true);
                            }),
                        AppbarSubtitle(
                            margin: getMargin(right: 20),
                            text: "lbl_currency".tr),
                        Container(
                          margin: getMargin(right: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomSearchView(
                  controller: controller.textEditingController,
                  isDense: false,
                  width: size.width * 0.8,
                  height: 42.0,
                  // focusNode: FocusNode(),
                  onChanged: (string) {
                    print(string.length);
                    print(string.length - 1);
                    // var stringg = string.length - 1;
                    if (string.length == 0) {
                      controller.tempcurrencyList.clear();
                      controller.tempcurrencyList
                          .addAll(controller.currencyList);
                    } else {
                      controller.tempcurrencyList.clear();
                      controller.tempcurrencyList
                          .addAll(controller.currencyList);
                      controller.tempcurrencyList.value = controller
                          .tempcurrencyList
                          .where((e) =>
                              e.toLowerCase().contains(string.toLowerCase()))
                          .toList();
                    }
                    print("alkjfsd; ${controller.tempcurrencyList.length}");
                    print("lkafs; ${controller.currencyList.length}");
                  },
                  // controller: controller.frameOneController,
                  hintText: "Search".tr,
                  prefix: Container(
                    margin: getMargin(
                      left: 10,
                      top: 5,
                      right: 8,
                      bottom: 5,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgSearchYellow900,
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      32.00,
                    ),
                  ),
                ),

                // CustomTextFormField(
                //   controller: controller.textEditingController,
                //
                //   onChanged: (value) => controller.currencySearchItems(value),
                //   // autovalidateMode: AutovalidateMode.onUserInteraction,
                //   width: 335,
                //   focusNode: FocusNode(),
                //   hintText: "Search".tr,
                //   margin: getMargin(top: 14),
                //   textInputAction: TextInputAction.done,
                //   textInputType: TextInputType.emailAddress,
                //   prefix: Container(
                //     padding: getPadding(left: 10, right: 10),
                //     child: Icon(Icons.search_outlined),
                //   ),
                //   // Container(
                //   //     margin:
                //   //         getMargin(left: 17, top: 17, right: 16, bottom: 17),
                //   //     child: CustomImageView(svgPath: ImageConstant.imgMail)),
                //   prefixConstraints:
                //       BoxConstraints(maxHeight: getVerticalSize(58.00)),
                //   // validator: (value) {
                //   //   if (!GetUtils.isEmail(value!)) return "Enter valid email";
                //   //   // return null;
                //   //
                //   //   // if (value == null ||
                //   //   //     (!isValidEmail(value,
                //   //   //         isRequired: true))) {
                //   //   //   return "Please enter valid email";
                //   //   // }
                //   //   // return null;
                //   // }
                // ),
                GetX<SettingsController>(builder: (con) {
                  return Expanded(
                    child: SingleChildScrollView(
                      // physics: NeverScrollableScrollPhysics(),
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: getPadding(all: 0),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: con.tempcurrencyList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: getMargin(
                                top: 0,
                              ),
                              padding: getPadding(left: 20, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      con.textEditingController.text =
                                          controller.tempcurrencyList[index]
                                              .toString();
                                      con.data.value = controller
                                          .tempcurrencyList[index]
                                          .toString();

                                      _userSessionController.setCurrency(
                                          controller.tempcurrencyList[index]
                                              .substring(0, 3));

                                      Get.back();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          con.tempcurrencyList[index],
                                          style:
                                              AppTextStyle.txtPoppinsMedium14,
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgArrowright,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 1,
                                    width: size.width,
                                    color: ColorConstant.gray10001,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  );
                }),
              ],
            ),
          )),
    );
  }

  onTapArrowleft5() {
    Get.back();
  }
}
