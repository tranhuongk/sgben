import 'package:get/get.dart';
import 'package:sgben/app/modules/home_module/home_binding.dart';
import 'package:sgben/app/modules/home_module/home_page.dart';
import 'package:sgben/app/modules/splash_module/splash_page.dart';
import 'package:sgben/app/modules/search_module/search_page.dart';
import 'package:sgben/app/modules/search_module/search_binding.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => SplashPage(),
    ),
  	GetPage(
			name: AppRoutes.SEARCH,
			page: () => SearchPage(),
			binding: SearchBinding(),
		),
	];
}
