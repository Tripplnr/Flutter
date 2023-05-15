import 'package:trippinr/core/app_export.dart';

import 'controller/splash_controller.dart';

// ignore_for_file: must_be_immutable
class Splash extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.black,
        body: Stack(
          children: [
            Container(
              color: ColorConstant.yellow900,
              width: size.width,
              height: size.height,
            ),
            Center(
              child: AppbarImage(
                height: getVerticalSize(
                  52.00,
                ),
                width: getHorizontalSize(
                  169.00,
                ),
                svgPath: ImageConstant.imgGroupOrange400,
                margin: getMargin(
                  left: 8,
                ),
                color: ColorConstant.whiteA700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
