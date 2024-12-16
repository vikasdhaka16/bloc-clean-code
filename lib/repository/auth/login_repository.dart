import 'package:bloc_clean_code/data/network/network_api_services.dart';
import 'package:bloc_clean_code/models/user/user_model.dart';

import '../../config/app_urls.dart';

class LoginRepository {
  final _api = NetworkApiServices();

  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrls.loginUrl, data);
    return UserModel.fromJson(response);
  }
}
