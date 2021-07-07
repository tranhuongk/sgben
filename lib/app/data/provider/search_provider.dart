import 'package:sgben/app/data/model/api/api_connect.dart';
import 'package:sgben/app/data/model/user.dart';
import 'package:sgben/app/utils/constants.dart';

class SearchProvider {
  SearchProvider();

  // Get request
  Future<User> getUser() async {
    return User.fromJson(
      (await ApiConnect.instance.get(Constants.user)).body(),
    );
  }
}
