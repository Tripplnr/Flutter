import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/home/controller/home_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/controller/search_tab_bar_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';

class HomeTopWidget extends GetView<HomeController> {
  const HomeTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        // 203.00,
        218.00,
      ),
      width: size.width,
      // width: getHorizontalSize(
      //   374.00,
      // ),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image:
      //             AssetImage(ImageConstant.imgRectangle1))),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: CustomImageView(
              imagePath: ImageConstant.imgRectangle1,
              height: getVerticalSize(
                179.00,
              ),
              width: getHorizontalSize(
                374.00,
              ),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 50,
            bottom: 50,
            // top: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppbarTitle(
                  text: "lbl_explore_with".tr,
                  margin: getMargin(
                    top: 2,
                    bottom: 2,
                  ),
                ),
                AppbarImage(
                  height: getVerticalSize(
                    33.00,
                  ),
                  width: getHorizontalSize(
                    109.00,
                  ),
                  svgPath: ImageConstant.imgGroupOrange400,
                  margin: getMargin(
                    left: 8,
                  ),
                ),
              ],
            ),
            // Center(
            //   child: CustomAppBar(
            //     height: getVerticalSize(
            //       33.00,
            //     ),
            //     centerTitle: true,
            //     title:
            //   ),
            // ),
          ),
          Positioned(
            top: size.height * 0.19,
            // alignment: Alignment.topCenter,
            child: InkWell(
              onTap: () {
                // controller.indexController.currentScreen.value = 1;
                final _controller = Get.put(SearchTabBarController());
                _controller.tabController.index = 0;
                _controller.index.value = 0;
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: SearchTabBar(
                    callFrom: "HOME",
                  ),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
                // print(controller
                //     .indexController.screenList[1]);
                print("ok");
              },
              child: Container(
                width: getHorizontalSize(158),
                height: getVerticalSize(48),
                // margin: getMargin(
                //   left: 119,
                //   right: 119,
                //   bottom: 633,
                // ),
                padding: getPadding(
                  all: 12,
                ),
                decoration: AppDecoration.fillYellow900.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: getSize(
                        24.00,
                      ),
                      width: getSize(
                        24.00,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: getPadding(
                          bottom: 2,
                        ),
                        child: Text(
                          "View Hotels",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppTextStyle.txtPoppinsSemiBold14,
                        ),
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgArrowrightWhiteA700,
                      height: getSize(
                        24.00,
                      ),
                      width: getSize(
                        24.00,
                      ),
                      // margin: getMargin(
                      //   left: 5,
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
