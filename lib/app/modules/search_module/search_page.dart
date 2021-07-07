import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgben/app/modules/search_module/search_controller.dart';
import 'package:sgben/app/theme/app_colors.dart';
import 'package:sgben/app/theme/app_text_theme.dart';
import 'package:sgben/const/resource.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.blueLight,
          ),
          Positioned(
            top: Get.statusBarHeight > 100 ? 0 : 16.w,
            left: 16.w,
            child: SafeArea(
              child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                pressedOpacity: 0.8,
                child: CircleAvatar(
                  radius: 18.w,
                  backgroundColor: AppColors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 3.w),
                    child: Image.asset(
                      Assets.ASSETS_ICONS_CANCEL_PNG,
                      width: 20.w,
                      height: 20.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.statusBarHeight > 100 ? 0 : 16.w,
            right: 16.w,
            child: SafeArea(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14.w,
                    backgroundColor: AppColors.mustard,
                    child: CircleAvatar(
                      radius: 13.w,
                      backgroundColor: AppColors.white,
                      child: Text(
                        '1',
                        style: AppTextStyles.semiBold12RiverBed,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "/3",
                    style: AppTextStyles.regular12RiverBed,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: 1.sw,
            child: SafeArea(
              child: Container(
                // height: 157.w,
                margin: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24.w),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w)
                          .copyWith(top: 24.w),
                      child: Text(
                        '25 bis phường Đa Kao, Quận 1, Thành phố Hồ Chí Minh',
                        style: AppTextStyles.regular14RiverBed,
                      ),
                    ),
                    SizedBox(height: 8.w),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Divider(
                        height: 1.w,
                        color: AppColors.mercury,
                      ),
                    ),
                    SizedBox(height: 4.w),
                    Stack(
                      children: [
                        Container(
                          height: 40.w,
                          width: double.infinity,
                          margin: EdgeInsets.all(24.w).copyWith(bottom: 16.w),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.mustard.withOpacity(0.5),
                                blurRadius: 10.w,
                              )
                            ],
                            borderRadius: BorderRadius.circular(24.w),
                          ),
                        ),
                        CupertinoButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          pressedOpacity: 0.8,
                          child: Container(
                            height: 40.w,
                            alignment: Alignment.center,
                            width: double.infinity,
                            margin: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: AppColors.mustard2selectiveYellow,
                              ),
                              borderRadius: BorderRadius.circular(24.w),
                            ),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 12.w),
                                      child: Image.asset(
                                        Assets.ASSETS_ICONS_MARKER_PNG,
                                        width: 12.w,
                                      ),
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  TextSpan(
                                    text: 'Xác nhận điểm xúc này',
                                    style: AppTextStyles.semiBold14White,
                                  )
                                ],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
