import 'package:get/get.dart';
import 'package:sgben/app/data/provider/search_provider.dart';

class SearchController extends GetxController {
  final SearchProvider? provider;
  SearchController({this.provider});

  final _text = 'Search'.obs;
  set text(text) => this._text.value = text;
  get text => this._text.value;
}
