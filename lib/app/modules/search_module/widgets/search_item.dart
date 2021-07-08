import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgben/app/theme/app_colors.dart';
import 'package:sgben/app/theme/app_text_theme.dart';
import 'package:sgben/const/resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
    this.searchInput,
    this.value,
    this.showBadge,
    required this.onPressed,
  }) : super(key: key);
  final String? searchInput;
  final String? value;
  final bool? showBadge;
  final Function(String? value) onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(value),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: AppColors.white,
        elevation: 0,
        onPrimary: AppColors.grayAF,
        onSurface: AppColors.grayAF,
        shadowColor: AppColors.transparent,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(vertical: 5.w),
        child: Row(
          children: [
            SizedBox(width: 2.21.w),
            Badge(
              showBadge: showBadge ?? false,
              badgeContent: SizedBox(),
              badgeColor: AppColors.mustard,
              elevation: 0,
              borderSide: BorderSide(color: AppColors.white, width: 2.w),
              position: BadgePosition.bottomEnd(
                end: -4.w,
                bottom: -3.w,
              ),
              child: Image.asset(
                Assets.ASSETS_ICONS_MARKER_MERCURY_PNG,
                width: 11.6.w,
              ),
              padding: EdgeInsets.all(4.5.w),
            ),
            SizedBox(width: 10.21.w),
            Expanded(
                child: SubstringHighlight(
              text: value ?? "561 Điện Biên Phủ",
              term: searchInput ?? "",
              textStyle: AppTextStyles.regular14RiverBed,
              textStyleHighlight: AppTextStyles.semiBold14RiverBed,
            )
                // Text(
                //   ,
                //   style: AppTextStyles.regular14RiverBed,
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
