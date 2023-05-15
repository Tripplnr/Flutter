import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

class HotelPhotos extends GetView<HotelController> {
  final String hotelName;

  HotelPhotos({required this.hotelName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          // padding: getPadding(left: 5, right: 5, top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: getMargin(left: 0),
                height: 34,
                width: 34,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
                child: InkWell(
                  onTap: () async {
                    // await Get.delete<HotelController>();
                    // Get.back();
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
              Expanded(
                child: Container(
                  padding: getPadding(left: 5, right: 5),
                  child: Text(
                    // 'Capital O Hotel Ocean',
                    hotelName,
                    style: AppTextStyle().txtPoppinsSemiBold18Black26092B.copyWith(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // Container(
              //   margin: getMargin(left: 0),
              //   height: 34,
              //   width: 34,
              // )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            // physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GridView.custom(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  physics: ScrollPhysics(),

                  // semanticChildCount: controller.imgListPhotos.length,
                  semanticChildCount: controller.hotelPhotos.value.length,
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 2),
                    ],
                  ),
                  padding: getPadding(bottom: 20),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: controller.hotelPhotos.value.length,
                    // childCount: controller.imgListPhotos.length,
                    // childCount: controller.imgList.length,
                    (context, index) => InkWell(
                      onTap: () {
                        print("sjk");
                        Get.to(() => ImageZoomView(
                              url: controller.hotelPhotos[index]['url_1440'],
                              urlList: controller.hotelPhotos,
                              tappedPhotoIndex: index,
                            ));
                      },
                      child: Image.network(
                        // controller.imgListPhotos[index],
                        // controller.hotelPhotos[index]['url_1440'],
                        // controller.hotelPhotos[index]['url_square60'],
                        controller.hotelPhotos[index]['url_max'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageZoomView extends StatelessWidget {
  final String url;
  final List<dynamic> urlList;
  final int tappedPhotoIndex;
  const ImageZoomView({
    required this.url,
    required this.urlList,
    required this.tappedPhotoIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Container(
            margin: getMargin(left: 20, top: 20),
            height: 34,
            width: 34,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFF1F3F5)),
            child: InkWell(
              onTap: () async {
                // await Get.delete<HotelController>();
                // Get.back();
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
        ),
        body: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stack(
            //   children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: CarouselSlider.builder(
                itemCount: urlList.length,
                // .take(5)
                // .length,
                itemBuilder: (BuildContext? context, int index, int pageIndex) {
                  // controller.imgIndex = pageIndex;
                  // final item =
                  // controller.hotelPhotos[index!];
                  return GestureDetector(
                    child: Center(
                      child:
                          // Hero(
                          //   tag: 'imageHero',
                          //   child:
                          Image.network(
                        urlList[index]["url_1440"],
                      ),
                      // ),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                    },
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  // autoPlay: true,
                  // autoPlayInterval: Duration(seconds: 1),
                  // clipBehavior: Clip.none,
                  initialPage: tappedPhotoIndex,
                  aspectRatio: 1,
                  // enlargeCenterPage: false,
                  // padEnds:
                  //     false, // take full width, remove padding from all size
                  onPageChanged: (index, reason) {},
                ),
              ),
            ),

            // GestureDetector(
            //   child: Center(
            //     child: Hero(
            //       tag: 'imageHero',
            //       child: Image.network(
            //         url,
            //       ),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // Positioned(
            //   child:

            // )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
