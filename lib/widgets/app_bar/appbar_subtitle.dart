import 'package:trippinr/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({required this.text, this.textAlign, this.margin, this.onTap});

  String text;
  var textAlign;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign ?? TextAlign.left,
          style: AppTextStyle.txtPoppinsSemiBold16WhiteA700.copyWith(
            color: ColorConstant.whiteA700,
          ),
        ),
      ),
    );
  }
}
