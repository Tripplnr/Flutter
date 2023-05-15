import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';
import 'package:trippinr/presentation/home/widgets/home_hotel_blog_widget.dart';
import 'package:trippinr/presentation/home/widgets/home_hotel_list_widget.dart';
import 'package:trippinr/presentation/home/widgets/home_top_widget.dart';

import 'controller/home_controller.dart';

// ignore_for_file: must_be_immutable
class Home extends GetView<HomeController> {
  AuthController _authController = Get.find();
  // HomeController controller = Get.find();
  // HomeController controller = Get.put(HomeController());
  UserSessionController _userSessionController = Get.find();
  // final _homeFormKey = GlobalKey<FormState>(debugLabel: "HomePage");
  BlogsController _blogsController = Get.put(BlogsController());
  RefreshController refreshController = RefreshController(initialRefresh: false);
  onRefreshLoader() async {
    await Future.delayed(
      Duration(milliseconds: 1000),
    );
    print("hjgjhghfhhjghj");

    await _authController.isLoggedIn.value
        ? _blogsController.getBlog(token: _userSessionController.token).then((value) async {
            if (value) {
              await controller.fetchPopularHotels();
              refreshController.refreshCompleted();
              print("hjgjhghfhhjghj");
            }
          })
        : _blogsController.getBlog().then((value) async {
            if (value) {
              await controller.fetchPopularHotels();

              refreshController.refreshCompleted();
              print("hjgjhghfhhjghj");
            }
          });

    print("hjgjhghfhhjghj");
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    // return GetX<HomeController>(
    return GetBuilder<HomeController>(
        // autoRemove: false,
        // global: true,
        init: HomeController(),
        builder: (controller) {
          log(Get.width.toString());

          return controller.isLoading.value && controller.blogController.isLoading.value ? _progressIndicator() : _body(controller);
        });
  }

  Widget _progressIndicator() {
    return SafeArea(
      top: false,
      child: Scaffold(
        // backgroundColor: Colors.black,
        backgroundColor: ColorConstant.gray100,

        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(top: 0),
          decoration: AppDecoration.fillGray100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  // enabled: _enabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: getVerticalSize(
                          // 203.00,
                          218.00,
                        ),
                        width: size.width,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                color: Colors.grey[50],
                                height: getVerticalSize(179.00),
                                width: getHorizontalSize(374.00),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                top: 50,
                                bottom: 50,
                                // top: 50,
                                child: Container()),
                            Positioned(
                              top: size.height * 0.19,
                              child: Container(
                                width: getHorizontalSize(140),
                                height: getVerticalSize(48),
                                decoration: AppDecoration.fillYellow900
                                    .copyWith(borderRadius: BorderRadiusStyle.circleBorder24, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: getPadding(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 2,
                              ),
                              child: Text(
                                "lbl_travel_blogs".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppTextStyle.txtPetitFormalScriptRegular16,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: getPadding(
                                bottom: 1,
                              ),
                              child: Text(
                                "lbl_see_all".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppTextStyle.txtPoppinsRegular14,
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgArrowright,
                              height: getSize(22.00),
                              width: getSize(22.00),
                              margin: getMargin(left: 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: getVerticalSize(290.00),
                        child: ListView.separated(
                          padding: getPadding(left: 20, top: 13),
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: getVerticalSize(
                                15.00,
                              ),
                            );
                          },
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 170,
                              margin: getMargin(
                                right: 15,
                              ),
                              decoration: AppDecoration.fillWhiteA700.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder16,
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: getPadding(
                              left: 20,
                              top: 14,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    top: 1,
                                  ),
                                  child: Text(
                                    "lbl_popular_hotels".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyle.txtPoppinsSemiBold16Black900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              159.00,
                            ),
                            child: ListView.separated(
                              padding: getPadding(
                                left: 20,
                                top: 5,
                              ),
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    8.00,
                                  ),
                                );
                              },
                              itemCount: 5,
                              // itemCount: controller.popularHotelsList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    // color: Colors.black,
                                    // height: 100,
                                    width: 192,
                                    margin: getMargin(
                                      right: 8,
                                    ),
                                    padding: getPadding(
                                      left: 5,
                                      top: 4,
                                      right: 5,
                                      bottom: 4,
                                    ),
                                    decoration: AppDecoration.fillWhiteA700.copyWith(
                                      borderRadius: BorderRadiusStyle.circleBorder9,
                                    ));
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(HomeController controller) {
    return WillPopScope(
      // key: _homeFormKey,
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          // key: _homeFormKey,
          backgroundColor: ColorConstant.gray100,
          body: SmartRefresher(
            controller: refreshController,
            // controller: controller.refreshController,
            enablePullDown: true,
            // enablePullUp: true,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext? context, LoadStatus? mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more");
                } else {
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            onRefresh: onRefreshLoader,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: AppDecoration.fillGray100,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HomeTopWidget(),
                          _bottomView(controller),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomView(HomeController controller) {
    return Expanded(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: size.width,
              decoration: AppDecoration.fillGray100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HomeHotelBlogWidget(),
                  HomeHotelListWidget(controller: controller),
                  HomeHotelListTrendingWidget(controller: controller),
                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
            // =====
          ],
        ),
      ),
    );
  }
}
