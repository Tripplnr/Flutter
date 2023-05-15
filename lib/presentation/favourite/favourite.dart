import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';
import 'package:trippinr/presentation/favourite/controller/favourite_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/controller/search_tab_bar_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';

import 'favourite_item.dart';

class Favourite extends GetWidget<FavouriteController> {
  var controller = Get.put(FavouriteController());
  // var blogController = Get.find<BlogsController>();
  String? callFrom;
  Favourite({this.callFrom});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    //   margin: getMargin(left: 20),
                    // ),


                Container(
                margin: getMargin(left: 15),
                height: 34,
                width: 34,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
                child: InkWell(
                  onTap: (){
                    print("FavItendsklahkj");
                    final _controller = Get.put(SearchTabBarController());
                    _controller.tabController.index = 1;
                    _controller.index.value = 1;

                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: SearchTabBar(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation:
                      PageTransitionAnimation.cupertino,
                    );
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

                    // AppbarImage(
                    //   height: getSize(24.00),
                    //   width: getSize(24.00),
                    //   svgPath: ImageConstant.imgArrowleft,
                    //   color: ColorConstant.whiteA700,
                    //   margin: getMargin(
                    //     left: 20,
                    //   ),
                    //   onTap: () {
                    //     print("FavItendsklahkj");
                    //     final _controller = Get.put(SearchTabBarController());
                    //     _controller.tabController.index = 1;
                    //     _controller.index.value = 1;
                    //
                    //     PersistentNavBarNavigator.pushNewScreen(
                    //       context,
                    //       screen: SearchTabBar(),
                    //       withNavBar: true, // OPTIONAL VALUE. True by default.
                    //       pageTransitionAnimation:
                    //           PageTransitionAnimation.cupertino,
                    //     );
                    //   },
                    // ),
                    AppbarSubtitle(
                        margin: getMargin(right: 0), text: "lbl_favorites".tr),
                    Container(
                      margin: getMargin(right: 44),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Expanded(
                child: GetBuilder(
              init: BlogsController(),
              builder: (blogController) {
                return Container(
                    // margin: getMargin(top: 100),
                    width: size.width,
                    child: SingleChildScrollView(
                      // physics: NeverScrollableScrollPhysics(),
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: blogController.getBlogs.value.length,
                          itemBuilder: (context, index) {
                            var blogData = blogController.getBlogs.value[index];
                            return blogData.isFavorite == 0
                                ? Container()
                                : blogController.getBlogs.value.isEmpty
                                    ? Center(
                                        child: Text(
                                          'No Data Found!',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 24),
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                            InkWell(
                                              onTap: () {
                                                // Get.toNamed(AppRoutes.favourite_details);
                                                PersistentNavBarNavigator
                                                    .pushNewScreen(
                                                  context,
                                                  screen: FavouriteItem(
                                                      initialUrl:
                                                          blogData.webViewUrl,
                                                      index: index,
                                                      data: blogData),
                                                  withNavBar:
                                                      true, // OPTIONAL VALUE. True by default.
                                                  pageTransitionAnimation:
                                                      PageTransitionAnimation
                                                          .cupertino,
                                                );
                                              },
                                              child: Container(
                                                width: size.width,
                                                // width: getHorizontalSize(335.00),
                                                margin: getMargin(
                                                    left: size.width * 0.04,
                                                    bottom: 0,
                                                    top: 10,
                                                    right: size.width * 0.04),
                                                decoration: AppDecoration
                                                    .fillWhiteA700
                                                    .copyWith(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                      child: CustomImageView(
                                                          // imagePath: ImageConstant
                                                          //     .imgRectangle23908147x335,
                                                          url: blogData
                                                              .imagePath!,
                                                          // imagePath: list_blogs[index].image,
                                                          height:
                                                              getVerticalSize(
                                                            // 280.00
                                                            200.00,
                                                          ),
                                                          fit: BoxFit.cover,
                                                          width: size.width,
                                                          radius: BorderRadius.only(
                                                              // topLeft: Radius.circular(
                                                              //     getHorizontalSize(8.00)),
                                                              // topRight: Radius.circular(
                                                              //   getHorizontalSize(8.00),
                                                              // ),
                                                              )),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                          left: 12,
                                                          top: 13,
                                                          right: 12),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.7,
                                                                  child: Text(
                                                                      blogData
                                                                          .title!,
                                                                      // "msg_jaisalmer_travel"
                                                                      // .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines: 2,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      // style: AppTextStyle
                                                                      //     .txtPoppinsSemiBold16
                                                                    style: AppTextStyle.txtPoppinsSemiBold16.copyWith(fontSize: 20, fontFamily: 'Merriweather-Regular'),

                                                                  ),
                                                                ),
                                                                Row(children: [
                                                                  // CustomImageView(
                                                                  //     imagePath:
                                                                  //         ImageConstant
                                                                  //             .imgEllipse1271,
                                                                  //     height: getSize(
                                                                  //         18.00),
                                                                  //     width: getSize(
                                                                  //         18.00),
                                                                  //     radius: BorderRadius
                                                                  //         .circular(
                                                                  //             getHorizontalSize(
                                                                  //                 9.00))),
                                                                  // Padding(
                                                                  //     padding:
                                                                  //         getPadding(
                                                                  //             left: 6,
                                                                  //             bottom:
                                                                  //                 1),
                                                                  //     child: Text(
                                                                  //         "lbl_sofia_jeans"
                                                                  //             .tr,
                                                                  //         overflow:
                                                                  //             TextOverflow
                                                                  //                 .ellipsis,
                                                                  //         textAlign:
                                                                  //             TextAlign
                                                                  //                 .left,
                                                                  //         style: AppTextStyle
                                                                  //             .txtPoppinsMedium12)),

                                                                  Padding(
                                                                    padding:
                                                                        getPadding(
                                                                      left: 2,
                                                                      top: 1,
                                                                    ),
                                                                    child: Text(
                                                                      // "lbl_22_jan_2023".tr,
                                                                      blogController.convertDateTimeDisplay(blogData
                                                                          .createdAt
                                                                          .toString()),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppTextStyle
                                                                          .txtPoppinsMedium12Gray600,

                                                                    ),
                                                                  ),

                                                                  Padding(
                                                                    padding:
                                                                        getPadding(
                                                                      left: 6,
                                                                      top: 1,
                                                                    ),
                                                                    child: Text(
                                                                      "Reading Time",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      // style: AppTextStyle()
                                                                      //     .txtPoppinsMedium12Black,
                                                                      style: AppTextStyle.txtPoppinsMedium12Gray600.copyWith(color: Colors.black, fontSize: 14),
                                                                    ),
                                                                  ),

                                                                  Padding(
                                                                    padding:
                                                                        getPadding(
                                                                      left: 6,
                                                                      top: 1,
                                                                    ),
                                                                    child: Text(
                                                                      controller
                                                                          .getReadingTime(
                                                                              blogData.readingTime),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      // style: AppTextStyle
                                                                      //     .txtPoppinsSemiBold12OrangeA20001,
                                                                      style: AppTextStyle.txtPoppinsMedium12Gray600.copyWith(color: ColorConstant.yellow900),
                                                                    ),
                                                                  ),
                                                                ])
                                                              ]),
                                                          CustomIconButton(
                                                            onTap: () {
                                                              blogController
                                                                  .likeBlog(
                                                                blogId:
                                                                    blogData.id,
                                                                type: "blog",
                                                                index: index,
                                                              );
                                                            },
                                                            height: 38,
                                                            width: 38,
                                                            margin: getMargin(
                                                                bottom: 2),
                                                            child:
                                                                CustomImageView(
                                                              svgPath: blogData
                                                                          .isFavorite ==
                                                                      0
                                                                  ? ImageConstant
                                                                      .imgUnFavorite
                                                                  : ImageConstant
                                                                      .imgFavorite,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // Container(
                                                    //   // width: getHorizontalSize(307.00),
                                                    //   margin: getMargin(
                                                    //       top: 9,
                                                    //       left: 12,
                                                    //       right: 12,
                                                    //       bottom: 0),
                                                    //   child: Text(
                                                    //       // "msg_my_holidays_in_rajasthan".tr,
                                                    //       blogData
                                                    //           .textDescriptions!,
                                                    //       maxLines: 3,
                                                    //       overflow: TextOverflow
                                                    //           .ellipsis,
                                                    //       textAlign:
                                                    //           TextAlign.left,
                                                    //       style: AppTextStyle()
                                                    //           .txtPoppinsRegular12),
                                                    // ),
                                                    // Container(
                                                    //   alignment:
                                                    //       Alignment.centerLeft,
                                                    //   margin: getMargin(
                                                    //       // top: 9,
                                                    //       left: 12,
                                                    //       right: 12,
                                                    //       bottom: 10),
                                                    //   child: Text(
                                                    //     'Read More',
                                                    //     textAlign:
                                                    //         TextAlign.left,
                                                    //     style: TextStyle(
                                                    //       color: ColorConstant
                                                    //           .yellow900,
                                                    //       fontSize: getFontSize(
                                                    //         12,
                                                    //       ),
                                                    //       fontFamily: 'Poppins',
                                                    //       fontWeight:
                                                    //           FontWeight.w500,
                                                    //     ),
                                                    //   ),
                                                    // ),
                                                    SizedBox(height: 10,)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // Spacer()

                                            SizedBox(
                                              height: 20,
                                            )
                                          ]);
                          }),
                    ));
              },
            )),
          ],
        ),
      ),
    );
  }

  onTapArrowleft5() {
    Get.back();
  }
}
