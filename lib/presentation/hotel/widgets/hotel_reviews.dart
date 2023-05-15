// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:trippinr/core/app_export.dart';
import 'package:trippinr/presentation/hotel/controller/hotel_controller.dart';

import '../hotel_deals_Similar.dart';

// ignore_for_file: must_be_immutable
class HotalReviewPage extends StatelessWidget {
  var callFrom, controllerrr, neabyCities, reviewWords, reviewWordsScore, price, distance, physics;
  String? back;

  HotalReviewPage({
    Key? key,
    required this.controllerrr,
    required this.callFrom,
    required this.neabyCities,
    required this.reviewWords,
    required this.reviewWordsScore,
    required this.price,
    required this.distance,
    required this.back,
    this.physics,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("reviewwww   ${reviewWordsScore.length} ${HotelController().hotelReviews.value}");
    return SizedBox(
      width: size.width,
      child: SingleChildScrollView(
          // physics: physics ?? null,
          child: GetX<HotelController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            reviewWordsScore.length != 0 && reviewWordsScore[0]['score'] is double && !reviewWordsScore[0]['score'].isNaN
                ? Text("Rating".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 16))
                : Container(),
            SizedBox(
              height: 12,
            ),
            reviewWordsScore.length != 0 && reviewWordsScore[0]['score'] is double && !reviewWordsScore[0]['score'].isNaN
                ? Card(
                    elevation: 3,
                    child: Container(
                      padding: getPadding(all: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: reviewWords.take(5).length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: getPadding(top: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(reviewWords[index]['display_value'],
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyle.txtPoppinsSemiBold16Black900),
                                      Text("${(reviewWordsScore[index]['score']).toStringAsFixed(1)}",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppTextStyle.txtPoppinsSemiBold16Black900),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  LinearProgressIndicator(
                                    value: reviewWordsScore[index]['score'] / 10.0,
                                    backgroundColor: Colors.grey[300],
                                    valueColor: AlwaysStoppedAnimation<Color>(ColorConstant.yellow900),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 1,
              width: size.width,
              color: ColorConstant.gray100,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              controller.hotelReviews.value.count == 0 ? "0 Review Found" : "${controller.hotelReviews.value.count} Reviews",
              // "15 Reviews",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppTextStyle.txtPoppinsSemiBold16Black900.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            controller.hotelReviews.value.count == 0
                ? Center(
                    child: Text('No Review Found!'),
                  )
                : GetBuilder<HotelController>(
                    init: HotelController(),
                    initState: (controller) {},
                    builder: (controller) {
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        // physics: NeverScrollableScrollPhysics(),
                        physics: ScrollPhysics(),

                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 15,
                          );
                        },
                        itemCount: controller.showAllReviews.value
                            ? controller.hotelReviews.value.result!.length
                            : controller.hotelReviews.value.result!.length < 5
                                ? controller.hotelReviews.value.result!.length
                                : 5,
                        // itemCount: 5,

                        itemBuilder: (context, index) {
                          return HotalReviewItemWidget(
                            index: index,
                          );
                        },
                      );
                    },
                  ),
            SizedBox(
              height: 10,
            ),
            controller.hotelReviews.value.result!.length > 5
                ? !controller.showAllReviews.value
                    ? InkWell(
                        onTap: () {
                          controller.showAllReviews.value = true;
                          print("lestdkt");
                        },
                        child:
                            Text("See More", style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                      )
                    : InkWell(
                        onTap: () {
                          controller.showAllReviews.value = false;
                          print("lestt");
                        },
                        child:
                            Text("See Less", style: TextStyle(color: ColorConstant.yellow900, fontWeight: FontWeight.w600, fontSize: 16)),
                      )
                : Container(),
            SizedBox(
              height: 12,
            ),
            HomeHotelListSimilarWidget(
              distance: distance,
              price: price,
              callFrom: callFrom,
              controller: controllerrr,
              back: back,
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      })),
    );
  }
}

class HotalReviewItemWidget extends GetView<HotelController> {
  int? index;

  HotalReviewItemWidget({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          // imagePath: ImageConstant.imgEllipse1266,
          url: controller.hotelReviews.value.result![index!].author!.avatar != null
              ? controller.hotelReviews.value.result![index!].author!.avatar
              : "https://www.w3schools.com/howto/img_avatar.png",
          height: getSize(
            50.00,
          ),
          width: getSize(
            50.00,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              25.00,
            ),
          ),
          // margin: getMargin(
          //     // bottom: 40,
          //     ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                controller.hotelReviews.value.result![index!].pros == null && controller.hotelReviews.value.result![index!].pros == ""
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${controller.hotelReviews.value.result![index!].author!.name}",
                  // "lbl_malcolm_johnson".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.txtPoppinsSemiBold14Black90002,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  213.00,
                ),
                margin: getMargin(
                  top: controller.hotelReviews.value.result![index!].pros == "" ? 0 : 2,
                ),
                child: controller.hotelReviews.value.result![index!].pros == ""
                    ? null
                    : buildRichTextReadMore(
                        controller.hotelReviews.value.result![index!].pros!,
                        index!,
                        // "Love their drink specials. Bartenders super nice. Spent a week at UCSF andLove their drink specials. Bartenders super nice. Spent a week at UCSF and${index}",
                        // index!
                      ),
              ),
            ],
          ),
        ),
        CustomButton(
          height: 24,
          width: 48,
          text: controller.hotelReviews.value.result![index!].averageScore!.toStringAsFixed(1),
          // text: "3.0",
          margin: getMargin(
              // bottom: 51,
              ),
          variant: ButtonVariant.FillAmber60019,
          shape: ButtonShape.RoundedBorder7,
          padding: ButtonPadding.PaddingT2,
          fontStyle: ButtonFontStyle.PoppinsSemiBold12,
          prefixWidget: Container(
            margin: getMargin(
              right: 2,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgStarAmber600,
            ),
          ),
        ),
      ],
    );
  }

  buildRichTextReadMore(String text, int index) {
    return Obx(() {
      return Text.rich(
        TextSpan(
          text: controller.isExpanded[index]
              ? text
              : text.length > 50
                  ? text.substring(0, 50)
                  : text,
          children: [
            TextSpan(
              text: text.length > 50 && !controller.isExpanded[index] ? "... " : " ",
              style: TextStyle(
                color: Color(0xFF413934),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            text.length >= 20
                ? TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Single tapped.
                        controller.updateReadMore(index);
                      },
                    text: controller.isExpanded[index]
                        ? "Read less"
                        : text.length > 50
                            ? "Read more"
                            : "",
                    style: TextStyle(
                      color: ColorConstant.yellow900,
                      fontSize: getFontSize(
                        12,
                      ),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  )
                : TextSpan(),
          ],
        ),
        textAlign: TextAlign.left,
      );
    });
  }
}
