import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgben/app/data/provider/search_provider.dart';
import 'package:sgben/app/modules/search_module/widgets/search_item.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class SearchController extends GetxController {
  final SearchProvider? provider;
  SearchController({this.provider});

  final RxInt _step = 2.obs;
  final RxInt count = 1.obs;
  final RxString location =
      '25 bis , Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh'.obs;
  final TextEditingController textController = TextEditingController();

  final RxBool isActiveNext = false.obs;
  final RxList listSearchItem = [].obs;
  final RxList listCheckbox = [false, false].obs;
  final RxDouble height = 0.0.obs;

  final SolidController solidController = SolidController();

  List initList = [];
  @override
  onInit() {
    super.onInit();
    initList = [
      SearchItem(
        showBadge: true,
        value: 'Sử dụng vị trí hiện tại',
        searchInput: 'Sử dụng vị trí hiện tại',
        onPressed: onNextStepPressed,
      ),
      SearchItem(
        value:
            "561 Điện Biên Phủ, Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh",
        onPressed: onNextStepPressed,
      ),
      SearchItem(
        value: "154 Lê Văn sỹ, quận tân bình, thành phố Hồ chí minh",
        onPressed: onNextStepPressed,
      ),
    ];
    listSearchItem.addAll(initList);
    solidController.heightStream.listen((value) {
      height.value = value;
    });
  }

  int get step => _step.value;

  void confirmPressed() {
    print(_step.value);
    onNextStepPressed();
  }

  void onNextStepPressed([String? _location]) {
    _step.value++;
    if (_location != null) location.value = _location;
    print(_step.value);
  }

  void onChanged(String text) {
    isActiveNext.value = text.isNotEmpty ? true : false;
    List searchList = [
      SearchItem(
        value: "25 bis , Phường 25, Bình Thạnh, Thành phố Hồ Chí Minh",
        searchInput: text,
        onPressed: onNextStepPressed,
      ),
      SearchItem(
        value: "25 bis, quận tân bình, thành phố Hồ chí minh",
        onPressed: onNextStepPressed,
        searchInput: text,
      ),
    ];
    listSearchItem.clear();
    listSearchItem.addAll(text.isEmpty ? initList : searchList);
  }

  void cancelPressed() {
    if (step < 1)
      Get.back();
    else
      _step.value--;
  }

  void increase() => count.value++;
  void decrease() {
    if (count.value > 1) count.value--;
  }

  void checkboxChanged(bool val, int index) {
    listCheckbox[index] = val;
  }
}
