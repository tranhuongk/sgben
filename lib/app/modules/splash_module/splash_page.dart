import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgben/app/routes/app_pages.dart';
import 'package:sgben/app/utils/widgets/custom_app_bar.dart';

class SplashPage extends GetView {
  @override
  Widget build(BuildContext context) {
    ///Your Function in the Future
    Future.delayed(Duration(seconds: 2), () {
      // 2s over, navigate to a new page
      Get.offNamed(AppRoutes.HOME);
    });

    ///Your widget
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            child: Center(
              child: FlutterLogo(
                size: Get.size.width * 0.4,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                bottom: Get.context!.mediaQueryPadding.bottom + 10,
              ),
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
