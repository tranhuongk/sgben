import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgben/app/modules/home_module/home_controller.dart';
import 'package:sgben/app/modules/home_module/widgets/button.dart';
import 'package:sgben/app/modules/home_module/widgets/custom_effect.dart';
import 'package:sgben/app/routes/app_pages.dart';
import 'package:sgben/app/theme/app_colors.dart';
import 'package:sgben/app/theme/app_text_theme.dart';
import 'package:sgben/app/utils/widgets/bottom_navy_bar.dart';
import 'package:sgben/app/utils/widgets/custom_paint.dart';
import 'package:sgben/const/resource.dart';
import 'package:shadowed_image/shadowed_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(title: Text(AppStrings.homeTitle.tr)),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            height: 248.w,
            width: 1.sw,
            child: Image.asset(
              Assets.ASSETS_IMAGES_BACKGROUND_PNG,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 175.w,
            width: 1.sw,
            child: CustomPaint(
              size: Size(1.sh, 1.sw * 1.915),
              painter: RPSCustomPainter(),
            ),
          ),
          Positioned(
            top: 230.w,
            width: 1.sw,
            bottom: 0,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 16.w,
                bottom: 84.w,
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 16.w,
                children: [
                  CustomButton(
                    width: 223.w,
                    height: 104.w,
                    margin: EdgeInsets.only(left: 16.w),
                  ),
                  CustomButton(
                    width: 104.w,
                    height: 104.w,
                    margin: EdgeInsets.only(right: 16.w),
                    buttonIcon: Assets.ASSETS_ICONS_POUR_MORE_PNG,
                    roundTopLeft: 8.w,
                    roundTopRight: 24.w,
                    title: 'Đổ thêm',
                  ),
                  CustomButton(
                    width: 104.w,
                    height: 104.w,
                    margin: EdgeInsets.only(left: 16.w),
                    buttonIcon: Assets.ASSETS_ICONS_CONVEY_PNG,
                    title: 'Chuyển tải',
                    roundTopLeft: 8.w,
                    roundBottomLeft: 24.w,
                  ),
                  CustomButton(
                    width: 104.w,
                    height: 104.w,
                    buttonIcon: Assets.ASSETS_ICONS_DISMANTLING_PNG,
                    title: 'Tháo dỡ',
                    roundTopLeft: 8.w,
                  ),
                  CustomButton(
                    width: 104.w,
                    height: 104.w,
                    margin: EdgeInsets.only(right: 16.w),
                    buttonIcon: Assets.ASSETS_ICONS_CAR_RENTAL_PNG,
                    title: 'Thuê xe',
                    roundTopLeft: 8.w,
                    roundTopRight: 24.w,
                    roundBottomRight: 24.w,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 64.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.w),
                    ),
                    child: CupertinoButton(
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.ASSETS_ICONS_HISTORY_REQUEST_PNG,
                            width: 40.w,
                            height: 40.w,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              'Lịch sử yêu cầu',
                              style: AppTextStyles.normal14RiverBed,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          CircleAvatar(
                            radius: 4.w,
                            backgroundColor: AppColors.selectiveYellow,
                          )
                        ],
                      ),
                      onPressed: () {},
                      color: AppColors.white,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      borderRadius: BorderRadius.circular(32.w),
                      pressedOpacity: 0.8,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ).copyWith(top: 5.w),
                    width: 1.sw,
                    child: Text(
                      'Khám phá thêm',
                      style: AppTextStyles.semiBold14RiverBed,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 160.w,
                    child: PageView(
                      controller: controller.pageIndicatorController,
                      children: List.generate(
                        6,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32.w),
                            child: Image.asset(
                              index % 2 != 0
                                  ? Assets.ASSETS_IMAGES_IMAGE_ITEM_2_PNG
                                  : Assets.ASSETS_IMAGES_IMAGE_ITEM_1_PNG,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SafeArea(
                    top: false,
                    child: SizedBox(
                      width: 1.sw,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: controller.pageIndicatorController,
                          effect: CustomScaleEffect(
                            dotColor: AppColors.riverBed.withOpacity(0.12),
                            activeDotColor: AppColors.mustard,
                            activePaintStyle: PaintingStyle.stroke,
                          ),
                          onDotClicked: controller.onDotClicked,
                          count: 6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 142.w,
            width: 1.sw,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.saddleBrown.withOpacity(0.30),
                      offset: Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: CupertinoButton(
                  child: ShadowedImage(
                    image: Image.asset(
                      Assets.ASSETS_ICONS_LEFT_ARROW_PNG,
                      width: 40.w,
                    ),
                    blurRadius: 4.w,
                    offset: Offset(0, 4.w),
                  ),
                  onPressed: () => Get.toNamed(AppRoutes.SEARCH),
                  pressedOpacity: 0.8,
                  color: AppColors.white,
                  padding: EdgeInsets.zero,
                  minSize: 72.w,
                  borderRadius: BorderRadius.circular(72.w),
                ),
              ),
            ),
          ),
          Positioned(
            width: 1.sw,
            top: 106.w,
            child: Center(
              child: Text(
                'Tôi cần xúc xà bần',
                style: AppTextStyles.medium18White,
              ),
            ),
          ),
          Positioned(
            top: Get.statusBarHeight > 100 ? 0 : 16.w,
            child: SafeArea(
              child: Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(36.w),
                      child: Image.asset(
                        Assets.ASSETS_IMAGES_AVATAR_PNG,
                        width: 36.w,
                        height: 36.w,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'Chào buổi sáng, ',
                          style: AppTextStyles.regular14White,
                          children: [
                            TextSpan(
                              text: 'Thiện Nguyễn',
                              style: AppTextStyles.semiBold14White,
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            width: 1.sw,
            bottom: 0,
            child: Obx(
              () => Padding(
                padding: EdgeInsets.all(14.w),
                child: SafeArea(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.w),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 8.w,
                        sigmaY: 8.w,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(32.w),
                        ),
                        height: 56.w,
                        child: BottomNavyBar(
                          selectedIndex: controller.selectedIndex(),
                          showElevation: false,
                          onItemSelected: controller.onItemSelected,
                          backgroundColor: AppColors.transparent,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          containerHeight: 56.w,
                          itemCornerRadius: 24.w,
                          iconSize: 14.w,
                          items: [
                            BottomNavyBarItem(
                              icon: Image.asset(
                                Assets.ASSETS_ICONS_HOME_PNG,
                                width: 14.w,
                                height: 16.w,
                                color: controller.selectedIndex() == 0
                                    ? AppColors.selectiveYellow
                                    : AppColors.riverBed.withOpacity(0.6),
                              ),
                              title: Text(
                                'Trang chủ',
                                style: AppTextStyles.semiBold14SelectiveYellow,
                              ),
                              tooltip: 'Trang chủ',
                              activeColor: AppColors.mustard,
                              inactiveColor:
                                  AppColors.riverBed.withOpacity(0.6),
                              textAlign: TextAlign.center,
                            ),
                            BottomNavyBarItem(
                              icon: Image.asset(
                                Assets.ASSETS_ICONS_HISTORY_PNG,
                                width: 14.w,
                                height: 16.w,
                                color: controller.selectedIndex() == 1
                                    ? AppColors.selectiveYellow
                                    : AppColors.riverBed.withOpacity(0.6),
                              ),
                              title: Text(
                                'Lịch sử',
                                style: AppTextStyles.semiBold14SelectiveYellow,
                              ),
                              tooltip: 'Lịch sử',
                              activeColor: AppColors.mustard,
                              inactiveColor:
                                  AppColors.riverBed.withOpacity(0.6),
                              textAlign: TextAlign.center,
                            ),
                            BottomNavyBarItem(
                              icon: Image.asset(
                                Assets.ASSETS_ICONS_WALLET_PNG,
                                width: 14.w,
                                height: 16.w,
                                color: controller.selectedIndex() == 2
                                    ? AppColors.selectiveYellow
                                    : AppColors.riverBed.withOpacity(0.6),
                              ),
                              title: Text(
                                'Ví',
                                style: AppTextStyles.semiBold14SelectiveYellow,
                              ),
                              tooltip: 'Ví',
                              activeColor: AppColors.mustard,
                              inactiveColor:
                                  AppColors.riverBed.withOpacity(0.6),
                              textAlign: TextAlign.center,
                            ),
                            BottomNavyBarItem(
                              icon: Badge(
                                badgeContent: Text(
                                  '1',
                                  style: AppTextStyles.normal8White,
                                ),
                                badgeColor: AppColors.coral,
                                position: BadgePosition.bottomEnd(
                                  end: -7.w,
                                  bottom: -7.w,
                                ),
                                borderSide: BorderSide(color: AppColors.white),
                                elevation: 0,
                                child: Image.asset(
                                  Assets.ASSETS_ICONS_NOTIFICATION_PNG,
                                  width: 14.w,
                                  height: 16.w,
                                  color: controller.selectedIndex() == 3
                                      ? AppColors.selectiveYellow
                                      : AppColors.riverBed.withOpacity(0.6),
                                ),
                              ),
                              title: Text(
                                'Thông báo',
                                style: AppTextStyles.semiBold14SelectiveYellow,
                              ),
                              tooltip: 'Thông báo',
                              activeColor: AppColors.mustard,
                              inactiveColor:
                                  AppColors.riverBed.withOpacity(0.6),
                              textAlign: TextAlign.center,
                            ),
                            BottomNavyBarItem(
                              icon: Image.asset(
                                Assets.ASSETS_ICONS_USER_PNG,
                                width: 14.w,
                                height: 16.w,
                                color: controller.selectedIndex() == 4
                                    ? AppColors.selectiveYellow
                                    : AppColors.riverBed.withOpacity(0.6),
                              ),
                              title: Text(
                                'Người dùng',
                                style: AppTextStyles.semiBold14SelectiveYellow,
                              ),
                              tooltip: 'Người dùng',
                              activeColor: AppColors.mustard,
                              inactiveColor:
                                  AppColors.riverBed.withOpacity(0.6),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
