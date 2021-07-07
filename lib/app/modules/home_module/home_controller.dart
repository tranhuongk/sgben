import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgben/app/data/provider/home_provider.dart';

class HomeController extends GetxController {
  HomeController({this.provider});
  final HomeProvider? provider;

  final RxInt selectedIndex = 0.obs;
  final PageController _pageController = PageController();

  void onItemSelected(int index) {
    this.selectedIndex.value = index;
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void decrease() {
    this.selectedIndex.value -= 1;
  }
}
