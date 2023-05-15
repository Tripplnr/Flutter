import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';
import 'package:trippinr/auth_controller.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/core/controllers/user_session_controller.dart';
import 'package:trippinr/presentation/bottom_nav_bar/bottom_nav_bar_helper_methods.dart';
import 'package:trippinr/presentation/favourite/controller/favourite_controller.dart';

import '../blogs/controller/blogs_controller.dart';

class FavouriteItem extends StatefulWidget {
  // StaticBlogModel? data;
  var data;
  var index;
  var initialUrl;
  var callFrom;

  FavouriteItem({required this.initialUrl, this.data, required this.index, this.callFrom});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  UserSessionController _userSessionController = Get.find();

  var htmlCon = """
<p><span style=\"font-family: Roboto, sans-serif; font-size: 12pt;\">Roboto Light</span></p>\r\n
<p><span style=\"font-family: 'Roboto Regular', sans-serif; font-size: 12pt;\">Roboto Regular</span></p>\r\n
<p><span style=\"font-family: Merriweather, serif; font-size: 12pt;\">Merriweather Light</span></p>\r\n
<p><span style=\"font-family: 'Merriweather Regular', serif; font-size: 12pt;\">Merriweather Regular</span></p>\r\n
<p><span style=\"font-family: 'Open Sans', sans-serif; font-size: 12pt;\">Open Sans</span></p>\r\n
<p><span style=\"font-family: 'Open Sans SemiBold', sans-serif; font-size: 12pt;\">Open Sans Semi Bold</span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>
""";
  ScrollController? _scrollController;
  ScrollController? _scrollController1;
  var controller = Get.find<FavouriteController>();
  //  = ScrollController();
  _scrollDown() {
    _scrollController1!.animateTo(
      0,
      // _scrollController!.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
    setState(() {
      _scrollController1!.jumpTo(
        // _scrollController!.position.maxScrollExtent,
        0,
      );
    });
  }

  var _isVisible = false.obs;

  @override
  void initState() {
    super.initState();
    print("dfsashjkadhjda");
    _isVisible.value = true;
    _scrollController1 = new ScrollController();
    _scrollController = new ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible.value == true) {
          /* only set when the previous state is false
             * Less widget rebuilds 
             */
          print("klajfkjsf**** ${_isVisible.value} up"); //Move IO away from setState
          setState(() {
            _isVisible.value = false;
          });
        }
      } else {
        if (_scrollController!.position.userScrollDirection == ScrollDirection.forward) {
          if (_isVisible.value == false) {
            /* only set when the previous state is false
               * Less widget rebuilds 
               */
            print("**** ${_isVisible.value} down"); //Move IO away from setState
            setState(() {
              _isVisible.value = true;
            });
          }
        }
      }
    });

    // _scrollController;
  }

  // print(newhtmlCon);
  final authController = Get.find<AuthController>();

  BottomNavBarHelperMethods _bottomNavBarHelperMethods = BottomNavBarHelperMethods();

  @override
  Widget build(BuildContext context) {
    var newhtmlCon =
        // htmlCon
        widget.data?.description
            .replaceAll("'Roboto Regular'", "Roboto-Regular")
            .replaceAll("'Merriweather Regular'", "Merriweather-Regular")
            .replaceAll("'Open Sans'", "Open-Sans")
            .replaceAll("'Open Sans SemiBold'", "Open-Sans-SemiBold");
    // controller.popupScreen();

    // : controller.popupScreen(context);

    authController.isLoggedIn.value
        ? null
        : Future.delayed(Duration(seconds: 3), () async {
            await _bottomNavBarHelperMethods.loginPopUp(context, callFrom: widget.callFrom);
          });

    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingActionButtonScreen(),
        backgroundColor: ColorConstant.gray100,
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            // setState(() {
              if (direction == ScrollDirection.reverse) {
                _isVisible.value = false;
                print('gajkhfdsaghd');
              } else if (direction == ScrollDirection.forward) {
                _isVisible.value = true;
              }
            // });
            return true;
          },
          child: Obx(
            () => ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: authController.isLoggedIn.value ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
                children: [
                  Stack(
                    children: [
                      Container(
                        height: getVerticalSize(300.00),
                        width: size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.data?.imagePath.toString() ??
                              "https://travel.home.sndimg.com/content/dam/images/travel/fullset/2012/05/14/fa/oyster-fake-outs_ss_012.rend.hgtvcom.616.462.suffix/1491582998555.jpeg"),
                          /* image: AssetImage(
                          ImageConstant.imgRectangle23908147x335,
                        )*/
                        )),
                        // child: SafeArea(
                        //   child: SizedBox(
                        //     child: Container(
                        //       height: 50,
                        //       width: 50,
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           print("jaslf");
                        //           Navigator.pop(context);
                        //         },
                        //         child: CustomImageView(
                        //           svgPath: ImageConstant.imgArrowleft,
                        //           color: ColorConstant.white,
                        //           height: getSize(24.00),
                        //           width: getSize(24.00),
                        //           alignment: Alignment.topLeft,
                        //           margin: getMargin(left: 20, top: 14),
                        //           // onTap: () {
                        //           //   // Navigator.pop(context);
                        //           // },
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                      Positioned(
                        top: 40,
                          left: 20,
                          child:  Container(
                            // margin: getMargin(left: 15),
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
                            child: InkWell(
                              onTap: (){
                                print("jaslf");
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
                      )
                    ],
                  ),
                  Padding(
                      padding: getPadding(left: 10, top: 19, right: 10),
                      child:
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                          Container(
                            width: size.width * 0.9,
                            child: Text(
                                //"msg_jaisalmer_travel2".tr,
                                widget.data?.title.toString() ?? 'msg_jaisalmer_travel2'.tr,
                                // overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppTextStyle.txtPoppinsBold20.copyWith(fontFamily: 'Merriweather-Regular', fontSize: 24)),
                          ),
                          Padding(
                              padding: getPadding(top: 8),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // CustomImageView(
                                    //     imagePath:
                                    //         ImageConstant.imgEllipse1271,
                                    //     height: getSize(20.00),
                                    //     width: getSize(20.00),
                                    //     radius: BorderRadius.circular(
                                    //         getHorizontalSize(10.00)),
                                    //     margin: getMargin(bottom: 1)),
                                    // Padding(
                                    //     padding:
                                    //         getPadding(left: 6, bottom: 1),
                                    //     child: Text("lbl_sofia_jeans".tr,
                                    //         overflow: TextOverflow.ellipsis,
                                    //         textAlign: TextAlign.left,
                                    //         style: AppTextStyle
                                    //             .txtPoppinsMedium13Black90001)),
                                    // Container(
                                    //     height: getSize(4.00),
                                    //     width: getSize(4.00),
                                    //     margin: getMargin(
                                    //         left: 6, top: 8, bottom: 9),
                                    //     decoration: BoxDecoration(
                                    //         color: ColorConstant.yellow900,
                                    //         borderRadius:
                                    //             BorderRadius.circular(
                                    //                 getHorizontalSize(
                                    //                     2.00)))),
                                    // Padding(
                                    //     padding: getPadding(left: 6, top: 1),
                                    //     child: Text("lbl_22_jan_2023".tr,
                                    //         overflow: TextOverflow.ellipsis,
                                    //         textAlign: TextAlign.left,
                                    //         style: AppTextStyle
                                    //             .txtPoppinsMedium13Gray600))

                                    Container(
                                      width: Get.width * 0.8,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                              left: 3,
                                              top: 1,
                                            ),
                                            child: Text(
                                              // "lbl_22_jan_2023".tr,
                                              controller.convertDateTimeDisplay(
                                                  widget.data?.createdAt.toString() ?? "2023-03-03T07:17:56.000000Z".tr),
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
                                              "Reading Time",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppTextStyle().txtPoppinsMedium12Black,
                                            ),
                                          ),
                                          Padding(
                                              padding: getPadding(left: 6, top: 1),
                                              child: Text(
                                                  //"lbl_22_jan_2023".tr,
                                                  // " blogData.reading_time!",
                                                  controller.getReadingTime(widget.data.readingTime),
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppTextStyle.txtPoppinsMedium13Gray600)),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: Get.width * 0.3,
                                    // ),
                                    GetBuilder<BlogsController>(
                                        init: BlogsController(),
                                        builder: (_controller) => CustomIconButton(
                                              onTap: authController.isLoggedIn.value
                                                  ? () {
                                                      _controller.likeBlog(
                                                        blogId: widget.data.id,
                                                        type: "blog",
                                                        index: widget.index,
                                                      );
                                                    }
                                                  : () async {
                                                      null;
                                                      // Future.delayed(Duration(seconds: 3),
                                                      //     () async {
                                                      //   await _bottomNavBarHelperMethods
                                                      //       .loginPopUp(context);
                                                      // });
                                                    },
                                              height: 38,
                                              width: 38,
                                              margin: getMargin(
                                                bottom: 0,
                                              ),
                                              child: CustomImageView(
                                                svgPath: _controller.getBlogs.value[widget.index].isFavorite == 0
                                                    ? ImageConstant.imgUnFavorite
                                                    : ImageConstant.imgFavorite,
                                                // color: data.isFavorite == 1 ? Colors.red : Colors.grey,
                                              ),
                                            )),
                                  ]))
                        ]),
                      ])),
                  Container(
                      width: size.width * 0.9,
                      margin: getMargin(top: 21, bottom: 80),
                      child: Html(shrinkWrap: true, data: newhtmlCon
                          // data?.description ?? "Hello this is description",
                          )
                      // Text(data?.description ?? "No description found!",
                      //     maxLines: 10,
                      //     textAlign: TextAlign.left,
                      //     style: AppTextStyle.txtPoppinsRegular12)
                      ),
                ]),
          ),

          // SizedBox(
          //     width: size.width,
          //     child: Container(
          //         width: size.width,
          //         decoration: AppDecoration.fillWhiteA700,
          //         child: )),
        ));
  }

  Widget floatingActionButtonScreen() {
    const duration = Duration(milliseconds: 300);

    return GetBuilder<BlogsController>(
      init: BlogsController(),
      builder: (blogController) {
        return Obx(()=>

          AnimatedOpacity(
          opacity: _isVisible.value ? 1 : 0,
          duration: duration,
          child: Container(
            height: size.height * .07,
            margin: getMargin(bottom: 20, top: 0),
            width: size.width * .38,
            child: FloatingActionButton(
              splashColor: Colors.transparent,
              backgroundColor: ColorConstant.white,
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              onPressed: () async {
                print("Like Blog");
                print("Like Count ${blogController.getBlogs.value[widget.index].likeCount.toString()}");
                controller.shareLike(blogId: widget.data.id);
                blogController.getBlog(token: _userSessionController.token);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgHand,
                        color: ColorConstant.yellow900,
                        height: 17,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      blogController.getBlogs.value.isEmpty?SizedBox():
                      Text(
                        blogController.getBlogs.value[widget.index].likeCount.toString(),
                        style: AppTextStyle.txtPoppinsSemiBlack14,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Container(
                    height: 15,
                    width: 2,
                    color: ColorConstant.gray400,
                  ),
                  InkWell(
                    onTap: () async {
                      Share.share('${ApiConstant.blogShare}${blogController.getBlogs.value[widget.index].slug}')
                          .then((value) async {
                        Future.delayed(Duration(seconds: 1), () async {
                          print("Share Blog");
                          print("Blog Count ${blogController.getBlogs.value[widget.index].shareCount.toString()}");
                          await controller.shareBlog(blogId: widget.data.id);
                          await blogController.getBlog(token: _userSessionController.token);
                        });
                      });
                    },
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgShare,
                          color: ColorConstant.yellow900,
                          height: 17,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        blogController.getBlogs.value.isEmpty?SizedBox():
                        Text(
                          blogController.getBlogs.value[widget.index].shareCount.toString(),
                          style: AppTextStyle.txtPoppinsSemiBlack14,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
