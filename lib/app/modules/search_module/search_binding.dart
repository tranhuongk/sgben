import 'package:get/get.dart';

import 'package:sgben/app/data/provider/search_provider.dart';
import 'package:sgben/app/modules/search_module/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(
        provider: SearchProvider(),
      ),
    );
  }
}
