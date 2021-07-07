import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sgben/app/routes/app_pages.dart';
import 'package:sgben/app/theme/app_theme.dart';
import 'package:sgben/app/translations/app_translations.dart';
import 'package:sgben/app/utils/common.dart';
import 'package:sgben/app/utils/extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    "Your device locale: ${Get.deviceLocale}".logStr(name: 'Locale');
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GestureDetector(
        // Dismiss keyboard when clicked outside
        onTap: () => Common.dismissKeyboard(),
        child: GetMaterialApp(
          initialRoute: AppRoutes.HOME,
          theme: AppThemes.themData,
          getPages: AppPages.pages,
          locale: AppTranslation.locale,
          translationsKeys: AppTranslation.translations,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
