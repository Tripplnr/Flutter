import 'package:flutter_html/flutter_html.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/settings/controller/settings_controller.dart';

class PrivacyPolicy extends GetWidget<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: ColorConstant.yellow900,
              height: getVerticalSize(100.00),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    // margin: getMargin(left: 20),
                    // ),
                    AppbarImage(
                        height: getSize(24.00),
                        width: getSize(24.00),
                        svgPath: ImageConstant.imgArrowleft,
                        color: ColorConstant.whiteA700,
                        margin: getMargin(
                          left: 20,
                        ),
                        onTap: () {
                          // Get.back(canPop: true);
                          Navigator.pop(context);
                        }),
                    AppbarSubtitle(
                        margin: getMargin(right: 0), text: "Term of use".tr),
                    Container(
                      margin: getMargin(right: 20),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Html(data: controller.privacyPolicy.value.toString())),
            ),
          ],
        ),
      ),
    );
  }
}
