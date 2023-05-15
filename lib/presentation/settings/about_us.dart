import 'package:flutter_html/flutter_html.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/settings/controller/settings_controller.dart';

class AboutUs extends GetWidget<SettingsController> {
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
                    // AppbarImage(
                    //     height: getSize(24.00),
                    //     width: getSize(24.00),
                    //     svgPath: ImageConstant.imgArrowleft,
                    //     color: ColorConstant.whiteA700,
                    //     margin: getMargin(
                    //       left: 20,
                    //     ),
                    //     onTap: () {
                    //       // Get.back(canPop: true);
                    //       Navigator.pop(context);
                    //     }),

                    Container(
                      margin: getMargin(left: 13),
                      height: 34,
                      width: 33,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
                      child: InkWell(
                        onTap: (){
                          // Get.back(canPop: true);
                                Navigator.pop(context);
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
                    AppbarSubtitle(
                        margin: getMargin(right: 15), text: "About Us".tr),
                    Container(
                      margin: getMargin(right: 24),
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
                    child: Html(data: controller.aboutUs.value.toString()))),
          ],
        ),
      ),
    );
  }
}
