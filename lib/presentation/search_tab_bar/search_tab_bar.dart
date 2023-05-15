// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/blogs/blogs.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';
import 'package:trippinr/presentation/destination/destination.dart';
import 'package:trippinr/presentation/hotel/controller/controller.dart';

import '../destination/controller/destination_controller.dart';
import 'controller/search_tab_bar_controller.dart';

class SearchTabBar extends StatefulWidget {
  final String? callFrom;
  const SearchTabBar({
    Key? key,
    this.callFrom,
  }) : super(key: key);
  @override
  State<SearchTabBar> createState() => _SearchTabBarState();
}

class _SearchTabBarState extends State<SearchTabBar> with SingleTickerProviderStateMixin {
  var controller = Get.put(SearchTabBarController());
  var desCon = Get.put(DestinationController());
  @override
  void initState() {
    super.initState();
    controller.index.value == 0 ? desCon.recentAddressShow(false) : null;
    print("Blog INIT");
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HotelController());
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.transparent,
        backgroundColor: ColorConstant.gray100,

        body: SafeArea(
            top: false,
            child: GetBuilder<HotelController>(
              init: HotelController(),
              builder: (_c) {
                return Obx(() {
                  return Stack(
                    children: [
                      Container(
                        width: size.width,
                        height:
                            controller.index.value == 0 ? getVerticalSize(224.00) : getVerticalSize(Platform.isAndroid ? 110.00 : 125.0),
                        color: ColorConstant.yellow900,
                        // color: Colors.red,
                        child: SafeArea(
                          child: Column(
                            children: [
                              Row(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  controller.index.value == 0
                                      ? Center(
                                          child: Container(
                                            margin: getMargin(
                                              top: 18,
                                              left: 10,
                                            ),
                                            child: widget.callFrom != "HOME"
                                                ? null
                                                : Container(
                                                    margin: getMargin(left: 13),
                                                    height: 34,
                                                    width: 33,
                                                    decoration:
                                                        BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
                                                    child: InkWell(
                                                      onTap: widget.callFrom != "HOME"
                                                          ? null
                                                          : () {
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
                                            // InkWell(
                                            //         onTap: widget.callFrom !=
                                            //                 "HOME"
                                            //             ? null
                                            //             : () {
                                            //                 Navigator.pop(
                                            //                     context);
                                            //               },
                                            //         child: CustomImageView(
                                            //           svgPath: ImageConstant
                                            //               .imgArrowleft,
                                            //           color: Colors.white,
                                            //           height: 24,
                                            //           width: 24,
                                            //         ),
                                            //       ),
                                          ),
                                        )
                                      : widget.callFrom != "HOME"
                                          ? Container(
                                              height: 34,
                                              width: 34,
                                            )
                                          : Center(
                                              child: Container(
                                                height: 34,
                                                width: 34,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFFFA254)),
                                                margin: getMargin(
                                                  top: 18,
                                                  left: 10,
                                                ),
                                                child: InkWell(
                                                  onTap: widget.callFrom != "HOME"
                                                      ? null
                                                      : () {
                                                          Navigator.pop(context);
                                                        },
                                                  child: CustomImageView(
                                                    svgPath: ImageConstant.imgArrowleft,
                                                    color: Colors.white,
                                                    fit: BoxFit.none,
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                  Container(
                                      margin: getMargin(top: 18),
                                      width: getHorizontalSize(162.00),
                                      height: getVerticalSize(44),
                                      decoration: BoxDecoration(color: ColorConstant.orangeA200)
                                          .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),

                                      // padding: getMargin(all: 5),
                                      padding: getPadding(all: 0),
                                      child: GetBuilder<SearchTabBarController>(
                                        init: SearchTabBarController(),
                                        builder: (controlle) {
                                          return Container(
                                            child: TabBar(
                                              padding: getPadding(all: 0),
                                              labelPadding: getPadding(left: 5, right: 5),

                                              controller: controlle.tabController,
                                              onTap: (index) {
                                                controller.index.value == 0 ? desCon.recentAddressShow(false) : null;

                                                print(index);
                                                var controllerR = Get.put(BlogsController());
                                                print("bloghafskj");

                                                controllerR.getBlogs.value.clear();
                                                controllerR.getBlogs.value.addAll(controllerR.getBlogsTemp.value);
                                                controllerR.searchController.text = "";
                                                print('Cuurent Screen ==> ${controller.index.value}');
                                                if (index != controller.index.value) {
                                                  controller.index.value = index;
                                                } else {
                                                  // ShowToast.show(msg: 'Please add business first!');
                                                  print('Cuurent Screen ==> ${controller.index.value}');
                                                }
                                              },
                                              labelColor: ColorConstant.black90002,
                                              unselectedLabelColor: ColorConstant.whiteA700,
                                              indicator: null,
                                              isScrollable: false,
                                              indicatorColor: Colors.transparent,
                                              dividerColor: Colors.transparent,
                                              indicatorWeight: 0.00001,
                                              // indicator: BoxDecoration(
                                              //     color: ColorConstant.whiteA700,
                                              //     borderRadius: BorderRadius.circular(
                                              //         getHorizontalSize(17.00))),
                                              tabs: [
                                                Container(
                                                  width: getHorizontalSize(76),
                                                  height: getVerticalSize(34),
                                                  decoration: BoxDecoration(
                                                      color: controller.index.value == 0 ? Colors.white : Colors.transparent,
                                                      borderRadius: BorderRadius.circular(60)),
                                                  child: Center(
                                                    child: Text(
                                                      "lbl_hotels".tr,
                                                      style: TextStyle(fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: getHorizontalSize(76),
                                                  height: getVerticalSize(34),
                                                  decoration: BoxDecoration(
                                                      color: controller.index.value == 1 ? Colors.white : Colors.transparent,
                                                      borderRadius: BorderRadius.circular(60)),
                                                  child: Center(
                                                    child: Text(
                                                      "lbl_blogs".tr,
                                                      style: TextStyle(fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                                // Tab(text: "lbl_hotels".tr),tr

                                                // Tab(text: "lbl_blogs".tr),
                                                // Container(
                                                //   width: getHorizontalSize(76.00),
                                                //   height: getVerticalSize(34),
                                                //   child: Center(child: Text("lbl_blogs".tr)),
                                                //   // padding: getPadding(all: 10),
                                                //   decoration: BoxDecoration(
                                                //       color: ColorConstant.whiteA700,
                                                //       borderRadius: BorderRadius.circular(
                                                //           getHorizontalSize(17.00))),
                                                // ),
                                                // Tab(text: "lbl_hotels".tr),
                                              ],
                                            ),
                                          );
                                        },
                                      )),
                                  Container(
                                    margin: getMargin(
                                      top: 18,
                                      right: 34,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          top: Platform.isAndroid
                              ? 105
                              : controller.index.value == 0
                                  ? 120
                                  : 120,
                          // left: 20,
                          // right: 20,
                        ),
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller.tabController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Destination(),
                            ),
                            Blogs(),
                            // Center(),
                            // Center(),
                          ],
                        ),
                      ),
                    ],
                  );
                });
              },
            )),
      ),
    );
  }
}
