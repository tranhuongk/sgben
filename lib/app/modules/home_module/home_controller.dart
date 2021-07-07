import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgben/app/data/provider/home_provider.dart';

class HomeController extends GetxController {
  HomeController({this.provider});
  final HomeProvider? provider;

  final RxInt selectedIndex = 0.obs;
  final PageController pageIndicatorController =
      PageController(viewportFraction: 0.8);

  void onItemSelected(int index) {
    this.selectedIndex.value = index;
  }

  void onDotClicked(int index) {
    pageIndicatorController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
