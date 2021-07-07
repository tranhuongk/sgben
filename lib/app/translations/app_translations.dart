import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgben/app/translations/en_US.dart';
import 'package:sgben/app/translations/vi_VN.dart';

class AppTranslation {
  AppTranslation._();

  static final Locale locale = Get.deviceLocale!;
  static final Map<String, Map<String, String>> translations = {
    'en': en_US,
    'vi': vi_VN,
  };
}
