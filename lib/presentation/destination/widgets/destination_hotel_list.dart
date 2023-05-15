import 'package:trippinr/core/app_export.dart';

class DestinationHotelList extends StatelessWidget {
  const DestinationHotelList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: getPadding(
              top: 20,
              left: 20,
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("lbl_recently_viewed".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppTextStyle.txtPoppinsSemiBold16Black900),
              Spacer(),
              Padding(
                  padding: getPadding(bottom: 3),
                  child: Text("lbl_see_all".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppTextStyle.txtPoppinsRegular14)),
              CustomImageView(
                  svgPath: ImageConstant.imgArrowright,
                  height: getSize(22.00),
                  width: getSize(22.00),
                  margin: getMargin(left: 1, bottom: 2, right: 20))
            ])),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: getPadding(top: 6, left: 20),
            child: IntrinsicWidth(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.hotel_home);
                },
                child: Container(
                    padding: getPadding(left: 5, top: 4, right: 5, bottom: 4),
                    decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder9),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgRectangle3,
                              height: getVerticalSize(96.00),
                              width: getHorizontalSize(182.00),
                              radius: BorderRadius.circular(
                                  getHorizontalSize(10.00))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 5, left: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("lbl_marriott".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppTextStyle
                                                .txtPoppinsMedium14),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgStar,
                                            height: getSize(14.00),
                                            width: getSize(14.00),
                                            margin: getMargin(
                                                left: 82, top: 4, bottom: 2)),
                                        Padding(
                                            padding:
                                                getPadding(left: 4, top: 2),
                                            child: Text("lbl_3_5".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppTextStyle
                                                    .txtPoppinsMedium12))
                                      ]))),
                          Padding(
                              padding: getPadding(left: 5, top: 4),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgLocation,
                                    height: getSize(16.00),
                                    width: getSize(16.00),
                                    margin: getMargin(bottom: 1)),
                                Padding(
                                    padding: getPadding(left: 6),
                                    child: Text("lbl_milan_italy".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.txtPoppinsMedium12))
                              ]))
                        ])),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.hotel_home);
                },
                child: Container(
                    margin: getMargin(left: 8),
                    padding: getPadding(left: 5, top: 4, right: 5, bottom: 4),
                    decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder9),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgRectangle396x182,
                              height: getVerticalSize(96.00),
                              width: getHorizontalSize(182.00),
                              radius: BorderRadius.circular(
                                  getHorizontalSize(10.00))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 7, left: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("lbl_hyatt".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppTextStyle
                                                .txtPoppinsMedium14),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgStar,
                                            height: getSize(14.00),
                                            width: getSize(14.00),
                                            margin: getMargin(
                                                left: 99, top: 2, bottom: 4)),
                                        Padding(
                                            padding:
                                                getPadding(left: 4, bottom: 2),
                                            child: Text("lbl_4_9".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppTextStyle
                                                    .txtPoppinsMedium12))
                                      ]))),
                          Padding(
                              padding: getPadding(left: 5, top: 1),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgLocation,
                                    height: getSize(16.00),
                                    width: getSize(16.00),
                                    margin: getMargin(bottom: 1)),
                                Padding(
                                    padding: getPadding(left: 6),
                                    child: Text("lbl_paris_france".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.txtPoppinsMedium12))
                              ]))
                        ])),
              )
            ]))),
      ],
    );
  }
}
