import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgben/app/modules/search_module/search_controller.dart';
import 'package:sgben/app/theme/app_colors.dart';
import 'package:sgben/app/theme/app_text_theme.dart';
import 'package:sgben/const/resource.dart';
import 'package:shadowed_image/shadowed_image.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Container(
              color: AppColors.blueLight,
            ),
            Positioned(
              top: Get.statusBarHeight > 100 ? 0 : 16.w,
              left: 16.w,
              child: SafeArea(
                child: CupertinoButton(
                  onPressed: controller.cancelPressed,
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
                        child: Obx(
                          () => Text(
                            '${controller.step < 1 ? 1 : controller.step > 3 ? 3 : controller.step}',
                            style: AppTextStyles.semiBold12RiverBed,
                          ),
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
            // if (controller.step == 0) _searchWidget(),
            // if (controller.step == 1) _confirmWidget(),
            Positioned(
              bottom: 0,
              child: SolidBottomSheet(
                headerBar: Positioned(
                  top: 100,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.w,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32.w),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4.w),
                          blurRadius: 24.w,
                          color: AppColors.mercury.withOpacity(0.04),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 2.21.w),
                        Padding(
                          padding: EdgeInsets.only(top: 4.w),
                          child: Image.asset(
                            Assets.ASSETS_ICONS_MARKER_MUSTARD_PNG,
                            width: 11.6.w,
                            height: 16.w,
                          ),
                        ),
                        SizedBox(width: 10.21.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Địa điểm xúc',
                                style: AppTextStyles.semiBold12RiverBed87,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                controller.location(),
                                style: AppTextStyles.regular12RiverBed60,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Container(
                  height: 500,
                  width: 1.sw,
                  color: AppColors.white,
                  child: Center(
                    child: Text('Content'),
                  ),
                ),
                autoSwiped: true,
                toggleVisibilityOnTap: true,
                draggableBody: true,
                controller: controller.solidController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchWidget() {
    return Positioned(
      bottom: 0,
      width: 1.sw,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.w),
            topRight: Radius.circular(32.w),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(16.w).copyWith(bottom: 0),
              // color: AppColors.green,
              child: TextField(
                controller: controller.textController,
                onChanged: controller.onChanged,
                cursorColor: AppColors.mustard,
                style: AppTextStyles.regular18RiverBed,
                decoration: InputDecoration(
                  hintText: "Địa điểm cần xúc",
                  hintStyle:
                      TextStyle(color: AppColors.riverBed.withOpacity(0.32)),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.w),
                  isDense: true,
                  border: InputBorder.none,
                  suffixIcon: Obx(
                    () => CupertinoButton(
                      padding: EdgeInsets.only(left: 8.w),
                      minSize: 0,
                      onPressed: controller.isActiveNext()
                          ? controller.onNextStepPressed
                          : null,
                      pressedOpacity: 0.8,
                      child: ShadowedImage(
                        image: Image.asset(
                          controller.isActiveNext()
                              ? Assets.ASSETS_ICONS_LEFT_ARROW_PNG
                              : Assets.ASSETS_ICONS_LEFT_ARROW_DISABLE_PNG,
                          fit: BoxFit.cover,
                        ),
                        blurRadius: controller.isActiveNext() ? 4.w : 0,
                        offset: Offset(0, controller.isActiveNext() ? 2.w : 0),
                      ),
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 9.6.w,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.mercury),
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 160.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                child: Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...controller.listSearchItem(),
                      SafeArea(
                        top: false,
                        child: SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _confirmWidget() {
    return Positioned(
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
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 24.w),
                child: Text(
                  controller.location(),
                  style: AppTextStyles.regular14RiverBed,
                ),
              ),
              SizedBox(height: 8.w),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.mercury,
                      width: 1.w,
                    ),
                  ),
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
                    onPressed: controller.confirmPressed,
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
    );
  }
}
