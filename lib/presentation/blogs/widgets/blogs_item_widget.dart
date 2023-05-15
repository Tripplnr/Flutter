import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
import 'package:trippinr/presentation/favourite/favourite_item.dart';

import '../controller/blogs_controller.dart';

// ignore: must_be_immutable
class BlogsItemWidget extends GetView<BlogsController> {
  int? index;
  // BlogsController _blogController = Get.put(BlogsController());
  var _blogController = Get.find<BlogsController>();
  var authController = Get.find<AuthController>();
  BottomNavBarHelperMethods _bottomNavBarHelperMethods = BottomNavBarHelperMethods();

  BlogsItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        bottom: 10,
      ),
      width: size.width,
      decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadius.circular(10)),
      child: GetBuilder<BlogsController>(
          init: BlogsController(),
          builder: (controller) {
            return InkWell(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: FavouriteItem(
                    initialUrl: _blogController.getBlogs.value[index!].webViewUrl,
                    data: _blogController.getBlogs.value[index!],
                    index: index,
                    callFrom: "Read More Blog",
                  ),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CustomImageView(
                      // imagePath: ImageConstant.imgRectangle23908,
                      url: _blogController.getBlogs.value[index ?? 0].imagePath.toString(),
                      // height: getVerticalSize(
                      //   280.00,
                      // ),
                      // height: 672,

                      height: getVerticalSize(
                        // 280.00
                        220.00,
                      ),
                      width: size.width,

                      fit: BoxFit.cover,
                      // radius: BorderRadius.only(
                      //   topLeft: Radius.circular(
                      //     getHorizontalSize(
                      //       8.00,
                      //     ),
                      //   ),
                      //   topRight: Radius.circular(
                      //     getHorizontalSize(
                      //       8.00,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: getPadding(
                        left: 12,
                        top: 13,
                        right: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width > 450 ? size.width * 0.69 : size.width * 0.72,
                                child: Text(
                                  _blogController.getBlogs.value[index ?? 0].title.toString(),
                                  // "msg_varanasi_worth_exploring".tr,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.txtPoppinsSemiBold16.copyWith(fontSize: 20, fontFamily: 'Merriweather-Regular'),
                                ),
                              ),
                              Row(
                                children: [
                                  // CustomImageView(
                                  //   url: _blogController.getBlogs
                                  //           .value[index ?? 0].user?.image
                                  //           .toString() ??
                                  //       "No description found!",
                                  //   // imagePath: ImageConstant.imgEllipse1271,
                                  //   height: getSize(
                                  //     18.00,
                                  //   ),
                                  //   width: getSize(
                                  //     18.00,
                                  //   ),
                                  //   radius: BorderRadius.circular(
                                  //     getHorizontalSize(
                                  //       9.00,
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: getPadding(
                                  //     left: 6,
                                  //     bottom: 1,
                                  //   ),
                                  //   child: Text(
                                  //     // "lbl_sofia_jeans".tr,
                                  //     _blogController.getBlogs.value[index ?? 0]
                                  //         .user!.firstName
                                  //         .toString(),
                                  //     overflow: TextOverflow.ellipsis,
                                  //     textAlign: TextAlign.left,
                                  //     style: AppTextStyle.txtPoppinsMedium12,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: getPadding(
                                      left: 0,
                                      top: 1,
                                    ),
                                    child: Text(
                                      // "lbl_22_jan_2023".tr,
                                      _blogController
                                          .convertDateTimeDisplay(_blogController.getBlogs.value[index ?? 0].createdAt.toString()),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle.txtPoppinsMedium12Gray600,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 6,
                                      top: 1,
                                    ),
                                    child: Text(
                                      // "lbl_22_jan_2023".tr,
                                      "Reading Time",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle.txtPoppinsMedium12Gray600.copyWith(color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 6,
                                      top: 1,
                                    ),
                                    child: Text(
                                      // "lbl_22_jan_2023".tr,
                                      _blogController.getReadingTime(_blogController.getBlogs.value[index ?? 0].readingTime.toString()),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyle.txtPoppinsMedium12Gray600.copyWith(color: ColorConstant.yellow900),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CustomIconButton(
                            height: 38,
                            width: 38,
                            margin: getMargin(
                              bottom: 2,
                            ),
                            onTap: authController.isLoggedIn.value
                                ? () {
                                    _blogController.likeBlog(
                                      blogId: controller.getBlogs.value[index!].id,
                                      type: "blog",
                                      index: index,
                                    );
                                  }
                                : () async {
                                    // await _bottomNavBarHelperMethods
                                    // .loginPopUp(context, callFrom: "Home");
                                    // Future.delayed(Duration(seconds: 0),
                                    //     () async {
                                    await _bottomNavBarHelperMethods.loginPopUp(context);
                                    // });

                                    // print(
                                    //         "value of fav is ${_blogController.getBlogs.value[index!].isFavorite}");
                                    //     //_blogController.getBlogs.value[index ?? 0].isFavorite = 1;
                                    //     /* if (_blogController.getBlogs.value[index ?? 0].isFavorite == 1)
                                    // {
                                    //   _blogController.getBlogs.value[index ?? 0].isFavorite = 0;
                                    // }*/
                                    //     _blogController.likeBlog(
                                    //         blogId: controller.getBlogs.value[index!].id,
                                    //         type: "blog",
                                    //         index: index);
                                  },
                            child: GetBuilder<BlogsController>(
                              init: BlogsController(),
                              initState: (_) {},
                              builder: (_) {
                                return CustomImageView(
                                  svgPath:
                                      _.getBlogs.value[index!].isFavorite == 0 ? ImageConstant.imgUnFavorite : ImageConstant.imgFavorite,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //     alignment: Alignment.centerLeft,
                  //     width: size.width,
                  //     margin: getMargin(
                  //       left: 13,
                  //       right: 13,
                  //       top: 9,
                  //       bottom: 0,
                  //     ),
                  //     child: Text(
                  //         _blogController.getBlogs.value[index!].textDescriptions!.length > 100
                  //             ? _blogController.getBlogs.value[index!].textDescriptions!.substring(0, 50)
                  //             : controller.getBlogs.value[index!].textDescriptions ?? "No description found!",
                  //         maxLines: 10,
                  //         textAlign: TextAlign.left,
                  //         style: AppTextStyle().txtPoppinsRegular12)),
                  // InkWell(
                  //   onTap: () {
                  //     PersistentNavBarNavigator.pushNewScreen(
                  //       context,
                  //       screen: FavouriteItem(
                  //         initialUrl: _blogController.getBlogs.value[index!].webViewUrl,
                  //         data: _blogController.getBlogs.value[index!],
                  //         index: index,
                  //         callFrom: "Read More Blog",
                  //       ),
                  //       withNavBar: true, // OPTIONAL VALUE. True by default.
                  //       pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  //     );
                  //   },
                  //   child: Container(
                  //     margin: const EdgeInsets.only(left: 12.0, bottom: 7),
                  //     child: Text(
                  //       "lbl_read_more".tr,
                  //       style: TextStyle(
                  //         color: ColorConstant.yellow900,
                  //         fontSize: getFontSize(
                  //           12,
                  //         ),
                  //         fontFamily: 'Poppins',
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
