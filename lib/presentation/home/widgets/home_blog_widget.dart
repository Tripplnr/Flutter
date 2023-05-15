import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
import 'package:trippinr/presentation/favourite/favourite_item.dart';

import '../controller/home_controller.dart';

class HomeBlogWidget extends GetView<HomeController> {
  var data;
  var index;
  HomeBlogWidget({this.data, this.index});
  final authController = Get.find<AuthController>();
  final blogController = Get.find<BlogsController>();
  BottomNavBarHelperMethods _bottomNavBarHelperMethods = BottomNavBarHelperMethods();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width > 450 ? 400 : 335,
      margin: getMargin(
        right: 15,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _image(context),
          SizedBox(
            height: 5,
          ),
          _header(context),
          // _description(context),
          // InkWell(
          //   onTap: () {
          //     PersistentNavBarNavigator.pushNewScreen(
          //       context,
          //       screen: FavouriteItem(
          //         initialUrl: data.webViewUrl,
          //         index: index,
          //         data: data,
          //         callFrom: "Read More Home",
          //       ),
          //       withNavBar: true, // OPTIONAL VALUE. True by default.
          //       pageTransitionAnimation: PageTransitionAnimation.cupertino,
          //     );
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 12.0, bottom: 7),
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
        ],
      ),
    );
  }

  // Expanded _description(BuildContext context) {
  //   return Expanded(
  //     child: InkWell(
  //       onTap: () {
  //         PersistentNavBarNavigator.pushNewScreen(
  //           context,
  //           screen: FavouriteItem(
  //             initialUrl: data.webViewUrl,
  //             data: data,
  //             index: index,
  //             callFrom: "Read More Home",
  //           ),
  //           withNavBar: true, // OPTIONAL VALUE. True by default.
  //           pageTransitionAnimation: PageTransitionAnimation.cupertino,
  //         );
  //       },
  //       child: Container(
  //         width: getHorizontalSize(
  //           291.00,
  //         ),
  //         margin: getMargin(
  //           left: 12,
  //           top: 0,
  //           bottom: 0,
  //         ),
  //         child: Text(
  //           data!.textDescriptions!,
  //           maxLines: 2,
  //           style: TextStyle(
  //             overflow: TextOverflow.ellipsis,
  //             color: ColorConstant.gray700,
  //             fontSize: getFontSize(
  //               12,
  //             ),
  //             fontFamily: 'Poppins',
  //             fontWeight: FontWeight.w400,
  //           ),
  //         ),
  //         // RichText(
  //         //   maxLines: 2,
  //         //   // overflow: TextOverflow.ellipsis,
  //         //   text: TextSpan(
  //         //     children: [
  //         //       TextSpan(
  //         //         // text: "msg_after_seeing_the2".tr,
  //         //
  //         //         text: data!.description,
  //         //         style: TextStyle(
  //         //           overflow: TextOverflow.ellipsis,
  //         //           color: ColorConstant.gray700,
  //         //           fontSize: getFontSize(
  //         //             12,
  //         //           ),
  //         //           fontFamily: 'Poppins',
  //         //           fontWeight: FontWeight.w400,
  //         //         ),
  //         //       ),
  //         //       // TextSpan(
  //         //       //   recognizer: TapGestureRecognizer()
  //         //       //     ..onTap = () {
  //         //       //       PersistentNavBarNavigator.pushNewScreen(
  //         //       //         context,
  //         //       //         screen: FavouriteItem(),
  //         //       //         withNavBar:
  //         //       //             true, // OPTIONAL VALUE. True by default.
  //         //       //         pageTransitionAnimation:
  //         //       //             PageTransitionAnimation.cupertino,
  //         //       //       );
  //         //       //     },
  //         //       //   text: "lbl_read_more".tr,
  //         //       //   style: TextStyle(
  //         //       //     color: ColorConstant.yellow900,
  //         //       //     fontSize: getFontSize(
  //         //       //       12,
  //         //       //     ),
  //         //       //     fontFamily: 'Poppins',
  //         //       //     fontWeight: FontWeight.w500,
  //         //       //   ),
  //         //       // ),
  //         //     ],
  //         //   ),
  //         //   textAlign: TextAlign.left,
  //         // ),
  //       ),
  //     ),
  //   );
  // }

  Align _header(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: Get.width > 450 ? 380 : 320,
                  child: Text(
                    // "msg_varanasi_worth_exploring".tr,
                    data!.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppTextStyle.txtPoppinsSemiBold16.copyWith(fontSize: 20, fontFamily: 'Merriweather-Regular'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width > 450 ? 320 : 270,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            BlogsController().convertDateTimeDisplay(data.createdAt.toString()),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppTextStyle.txtPoppinsMedium12Gray600,
                          ),
                          Padding(
                            padding: getPadding(
                              left: 6,
                              // top: 1,
                            ),
                            child: Text(
                              "Reading Time",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle().txtPoppinsMedium12Black.copyWith(fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 6,
                              // top: 1,
                            ),
                            child: Text(
                              BlogsController().getReadingTime(data!.readingTime!),
                              // '5s',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.txtPoppinsSemiBold12OrangeA20001,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<BlogsController>(
                        init: BlogsController(),
                        builder: (_controller) => CustomIconButton(
                              onTap: authController.isLoggedIn.value
                                  ? () {
                                      _controller.likeBlog(
                                        blogId: data.id,
                                        type: "blog",
                                        index: index,
                                      );
                                    }
                                  : () async {
                                      // await _bottomNavBarHelperMethods
                                      // .loginPopUp(context, callFrom: "Home");
                                      // Future.delayed(Duration(seconds: 1), () async {
                                      await _bottomNavBarHelperMethods.loginPopUp(
                                        context,
                                        // callFrom: "Read More Home",
                                      );
                                      // });
                                    },
                              height: 38,
                              width: 38,
                              // margin: getMargin(
                              //     // bottom: 5,
                              //     ),
                              child: CustomImageView(
                                height: Get.width > 450 ? 30 : 38,
                                width: Get.width > 450 ? 30 : 38,
                                fit: BoxFit.contain,
                                svgPath: data.isFavorite == 0 ? ImageConstant.imgUnFavorite : ImageConstant.imgFavorite,
                                // color: data.isFavorite == 1 ? Colors.red : Colors.grey,
                              ),
                            )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell _image(BuildContext context) {
    return InkWell(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: FavouriteItem(
            initialUrl: data.webViewUrl,
            data: data,
            index: index,
            callFrom: "Read More Home",
          ),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: CustomImageView(
        // imagePath: ImageConstant.imgRectangle23908,
        // imagePath: data!.image,
        url: data.imagePath,
        height: 170,
        width: Get.width > 450 ? 400 : 335,
        fit: BoxFit.fill,
        radius: BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              8.00,
            ),
          ),
        ),
      ),
    );
  }
}
