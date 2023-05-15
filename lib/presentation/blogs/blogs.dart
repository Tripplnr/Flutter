import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trippinr/core/app_export.dart';

import '../blogs/widgets/blogs_item_widget.dart';
import 'controller/blogs_controller.dart';

class Blogs extends StatelessWidget {
  // var _blogController = Get.find<BlogsController>();
  // RefreshController refreshController = RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogsController>(
        init: BlogsController(),
        initState: (BlogsController) async {
          // BlogsController.controller!.getBlogs.value.clear();
          // BlogsController.controller!.getBlogs.value
          //     .addAll(BlogsController.controller!.getBlogsTemp.value);
        },
        builder: (_blogController) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body:
              // SmartRefresher(
              //   controller: _blogController.blogrefreshController,
              //   enablePullDown: true,
              //   // enablePullUp: true,
              //   header: WaterDropHeader(),
              //   footer: CustomFooter(
              //     builder: (BuildContext? context, LoadStatus? mode) {
              //       Widget body;
              //       if (mode == LoadStatus.idle) {
              //         body = Text("pull up load");
              //       } else if (mode == LoadStatus.loading) {
              //         body = CupertinoActivityIndicator();
              //       } else if (mode == LoadStatus.failed) {
              //         body = Text("Load Failed!Click retry!");
              //       } else if (mode == LoadStatus.canLoading) {
              //         body = Text("release to load more");
              //       } else {
              //         body = Text("No more Data");
              //       }
              //       return Container(
              //         height: 55.0,
              //         child: Center(child: body),
              //       );
              //     },
              //   ),
              //   onRefresh: _blogController.onRefreshLoader,
              //   child:

                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomSearchView(
                          controller: _blogController.searchController,
                          textInputAction: TextInputAction.done,
                          height: 50, isDense: false,
                          onChanged: (string) {
                            print(string.length);
                            print(string.length - 1);
                            // var stringg = string.length - 1;
                            if (string.length == 0) {
                              _blogController.getBlogs.value.clear();
                              _blogController.getBlogs.value
                                  .addAll(_blogController.getBlogsTemp.value);
                            } else {
                              _blogController.getBlogs.value.clear();
                              _blogController.getBlogs.value
                                  .addAll(_blogController.getBlogsTemp.value);
                              _blogController.getBlogs.value = _blogController
                                  .getBlogs.value
                                  .where((e) => e.title!
                                      .toLowerCase()
                                      .contains(string.toLowerCase()))
                                  .toList();
                            }
                          },
                          width: size.width * 0.8,
                          // height: 42.0,
                          // focusNode: FocusNode(),

                          // controller: controller.frameOneController,
                          hintText: "Search Blog".tr,
                          // suffix: Icon(Icons.delete_forever_outlined),
                          prefix: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              top: 5,
                              right: 8,
                              bottom: 5,
                            ),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgSearchYellow900,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 42,
                          ),
                        ),
                        GetX<BlogsController>(
                          init: BlogsController(),
                          initState: (_) {},
                          builder: (_) {
                            return Padding(
                              padding: getPadding(
                                  // top: 14,
                                  left: size.width * 0.04,
                                  right: size.width * 0.04,
                                  top: 10),
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                      // height: getVerticalSize(
                                      //   14.00,
                                      // ),
                                      );
                                },
                                itemCount: _.getBlogs.value.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      BlogsItemWidget(index),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              // )
          );
        });
  }
}
