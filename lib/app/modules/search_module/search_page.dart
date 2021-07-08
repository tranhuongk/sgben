import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgben/app/modules/search_module/search_controller.dart';
import 'package:sgben/app/modules/search_module/widgets/custom_check_box.dart';
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
            if (controller.step == 0) _searchWidget(),
            if (controller.step == 1) _confirmWidget(),
            if (controller.step == 2) ...[
              Positioned(
                bottom: 0,
                child: SolidBottomSheet(
                  headerBar: _headerWidget(),
                  body: _contentWidget(),
                  autoSwiped: true,
                  toggleVisibilityOnTap: true,
                  draggableBody: true,
                  controller: controller.solidController,
                  showOnAppear: true,
                  maxHeight: 0.73.sh,
                ),
              ),
              Positioned(
                bottom: 0,
                width: 1.sw,
                child: _footerWidget(),
              )
            ]
          ],
        ),
      ),
    );
  }

  Container _footerWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4.w),
            blurRadius: 16.w,
            color: AppColors.riverBed.withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Container(
          height: 64.w,
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(width: 16.w),
              Expanded(
                child: CupertinoButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  pressedOpacity: 0.8,
                  child: Container(
                    height: 40.w,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.riverBed.withOpacity(0.16),
                      ),
                      borderRadius: BorderRadius.circular(24.w)
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            '2. Địa điểm',
                            style: AppTextStyles.semiBold14RiverBed,
                            maxLines: 1,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          top: 0,
                          child: Center(
                            child: Image.asset(
                              Assets.ASSETS_ICONS_ARROW_LEFT_PNG,
                              height: 12.w,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ButtonWithShadow(
                  onPressed: () {},
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          '3. Xác nhận',
                          style: AppTextStyles.semiBold14White,
                          maxLines: 1,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Center(
                          child: Image.asset(
                            Assets.ASSETS_ICONS_ARROW_RIGHT_PNG,
                            height: 12.w,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentWidget() {
    return Container(
      width: 1.sw,
      color: AppColors.alabaster,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 16.w),
                Image.asset(
                  Assets.ASSETS_IMAGES_BEN_FRAME_PNG,
                  width: 182.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 40.w,
                        width: 101.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.w),
                            bottomLeft: Radius.circular(24.w),
                          ),
                          color: AppColors.mustard.withOpacity(0.08),
                        ),
                        child: Center(
                          child: Text(
                            "Xe ba gác",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: AppTextStyles.regular14RiverBed72,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.w),
                      Image.asset(
                        Assets.ASSETS_IMAGES_BEN_BUTTON_PNG,
                        // height: 44.w,
                        width: 120.w,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text.rich(
                TextSpan(
                  text: '300,000',
                  style: AppTextStyles.bold24SelectiveYellow,
                  children: [
                    TextSpan(
                      text: '  VNĐ',
                      style: AppTextStyles.regular14RiverBed60,
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 3.w,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Loại hàng hóa',
                      style: AppTextStyles.regular14RiverBed60,
                      maxLines: 1,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Xà bần',
                      textAlign: TextAlign.right,
                      style: AppTextStyles.semiBold14RiverBed60,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 3.w,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Số xe dự kiến',
                        style: AppTextStyles.regular14RiverBed60,
                        maxLines: 1,
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.decrease,
                      child: Image.asset(
                        Assets.ASSETS_ICONS_DECREASE_PNG,
                        width: 32.w,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      constraints: BoxConstraints(maxWidth: 50.w),
                      child: Text(
                        "${controller.count}",
                        style: AppTextStyles.regular14RiverBed87,
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.increase,
                      child: Image.asset(
                        Assets.ASSETS_ICONS_INCREASE_PNG,
                        width: 32.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 13.w,
                ),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.riverBed.withOpacity(0.04),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.w),
                    bottomLeft: Radius.circular(24.w),
                    bottomRight: Radius.circular(24.w),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomCheckBox(
                          value: controller.listCheckbox[0],
                          shouldShowBorder: true,
                          borderColor: AppColors.mustard,
                          checkedFillColor: AppColors.mustard,
                          borderRadius: 8.w,
                          borderWidth: 1.w,
                          checkBoxSize: 24.w,
                          onChanged: (val) {
                            controller.checkboxChanged(val, 0);
                          },
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Lấy đất ướt',
                            style: AppTextStyles.regular14RiverBed,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text.rich(
                            TextSpan(
                              text: '100,000',
                              style: AppTextStyles.semiBold14RiverBed,
                              children: [
                                TextSpan(
                                  text: '  VNĐ',
                                  style: AppTextStyles.regular10RiverBed,
                                ),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.w),
                    Row(
                      children: [
                        CustomCheckBox(
                          value: controller.listCheckbox[1],
                          shouldShowBorder: true,
                          borderColor: AppColors.mustard,
                          checkedFillColor: AppColors.mustard,
                          borderRadius: 8.w,
                          borderWidth: 1.w,
                          checkBoxSize: 24.w,
                          onChanged: (val) {
                            controller.checkboxChanged(val, 1);
                          },
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Lấy đất bần',
                            style: AppTextStyles.regular14RiverBed,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text.rich(
                            TextSpan(
                              text: '200,000',
                              style: AppTextStyles.semiBold14RiverBed,
                              children: [
                                TextSpan(
                                  text: '  VNĐ',
                                  style: AppTextStyles.regular10RiverBed,
                                ),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.w),
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.coral.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(24.w),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 4.w,
                              right: 8.w,
                            ),
                            child: Image.asset(
                              Assets.ASSETS_ICONS_INFORMATION_PNG,
                              width: 16.w,
                            ),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(text: 'Đối với loại', children: [
                                TextSpan(
                                  text: ' xe ben 1 tấn',
                                  style: AppTextStyles.bold12Coral,
                                ),
                                TextSpan(
                                  text: ', quý khách vui lòng đảm bảo ',
                                ),
                                TextSpan(
                                  text: 'chiều rộng & chiều cao là ',
                                  style: AppTextStyles.medium12Coral,
                                ),
                                TextSpan(
                                  text: '1,680 x 2,220 ',
                                  style: AppTextStyles.bold12Coral,
                                ),
                                TextSpan(
                                  text: 'để xe vào hẻm ',
                                ),
                              ]),
                              style: AppTextStyles.regular12Coral,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: SizedBox(
                height: 76.w,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return IntrinsicHeight(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                child: Container(
                  color: AppColors.alabaster,
                  width: 1.sw,
                ),
              ),
            ],
          ),
          Container(
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
        ],
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
              ButtonWithShadow(onPressed: controller.confirmPressed),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWithShadow extends StatelessWidget {
  const ButtonWithShadow({
    Key? key,
    required this.onPressed,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
  }) : super(key: key);

  final Function() onPressed;
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1.sw,
      margin: margin ?? EdgeInsets.all(16.w),
      child: Stack(
        children: [
          Container(
            height: height ?? 40.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            // margin: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.mustard.withOpacity(0.5),
                  blurRadius: 10.w,
                  offset: Offset(0, 8.w),
                )
              ],
              borderRadius: BorderRadius.circular(24.w),
            ),
          ),
          CupertinoButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            pressedOpacity: 0.8,
            child: Container(
              height: height ?? 40.w,
              padding: padding ?? EdgeInsets.symmetric(horizontal: 12.w),
              alignment: Alignment.center,
              width: width ?? double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.mustard2selectiveYellow,
                ),
                borderRadius: BorderRadius.circular(24.w),
              ),
              child: child ??
                  Text.rich(
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
    );
  }
}
