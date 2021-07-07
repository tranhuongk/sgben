import 'package:get/get.dart';
import 'package:sgben/app/data/provider/home_provider.dart';
import 'package:sgben/app/modules/home_module/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        provider: HomeProvider(),
      ),
    );
  }
}
