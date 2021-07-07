import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgben/app/theme/app_colors.dart';
import 'package:sgben/app/theme/app_text_theme.dart';
import 'package:sgben/const/resource.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.roundTopLeft,
    this.roundTopRight,
    this.roundBottomLeft,
    this.roundBottomRight,
    this.buttonIcon,
    this.title,
    this.margin,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  final double? roundTopLeft;
  final double? roundTopRight;
  final double? roundBottomLeft;
  final double? roundBottomRight;
  final String? buttonIcon;
  final String? title;
  final EdgeInsets? margin;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.riverBed.withOpacity(0.08),
            blurRadius: 24,
            offset: Offset(4, 8),
          ),
        ],
      ),
      child: CupertinoButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              buttonIcon ?? Assets.ASSETS_ICONS_BEN_TOUCH_PNG,
              width: 40.w,
              height: 40.w,
            ),
            SizedBox(height: 8.w),
            Text(
              title ?? 'Xúc đi',
              style: AppTextStyles.medium14RiverBed,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        padding: EdgeInsets.zero,
        onPressed: () {},
        color: AppColors.white,
        pressedOpacity: 0.7,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            roundTopLeft ?? 24.w,
          ),
          topRight: Radius.circular(
            roundTopRight ?? 8.w,
          ),
          bottomLeft: Radius.circular(
            roundBottomLeft ?? 8.w,
          ),
          bottomRight: Radius.circular(
            roundBottomRight ?? 8.w,
          ),
        ),
      ),
    );
  }
}
