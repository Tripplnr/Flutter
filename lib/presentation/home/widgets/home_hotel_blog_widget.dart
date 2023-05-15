import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/blogs/controller/blogs_controller.dart';
import 'package:trippinr/presentation/home/widgets/home_blog_widget.dart';
import 'package:trippinr/presentation/search_tab_bar/controller/search_tab_bar_controller.dart';
import 'package:trippinr/presentation/search_tab_bar/search_tab_bar.dart';

class HomeHotelBlogWidget extends StatelessWidget {
  // var blogController = Get.find<BlogsController>();
  // var blogController;
  HomeHotelBlogWidget({
    // this.blogController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogsController>(
        init: BlogsController(),
        builder: (blogController) {
          return Column(
            children: [
              Container(
                padding: getPadding(
                  left: 20,
                  // top: 34,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 2,
                      ),
                      child: Text(
                        "lbl_travel_blogs".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        // style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(),
                        style: AppTextStyle.txtPoppinsBold20.copyWith(),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        final _controller = Get.put(SearchTabBarController());
                        _controller.tabController.index = 1;
                        _controller.index.value = 1;

                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: SearchTabBar(callFrom: "HOME"),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Padding(
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
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgArrowright,
                      height: getSize(
                        22.00,
                      ),
                      width: getSize(
                        22.00,
                      ),
                      margin: getMargin(
                        left: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 285,
                // getVerticalSize(
                //   285.00,
                // ),
                child: ListView.separated(
                  padding: getPadding(
                    left: 20,
                    top: 13,
                  ),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: getVerticalSize(
                        15.00,
                      ),
                    );
                  },
                  itemCount: blogController.getBlogsTemp.value.take(3).length,
                  itemBuilder: (context, index) {
                    var blogData = blogController.getBlogsTemp.value[index];
                    // TravelBlogHomeWidgetModel
                    // model = controller
                    //         .homeModelObj
                    //         .value
                    //         .listrectangle23908ItemList[
                    //     index];
                    return HomeBlogWidget(
                      data: blogData,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          );
        });
  }
}
