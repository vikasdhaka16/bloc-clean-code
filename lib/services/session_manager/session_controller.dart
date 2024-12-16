import 'dart:convert';

import 'package:bloc_clean_code/models/user/user_model.dart';
import 'package:bloc_clean_code/services/storage/local_storage.dart';
import 'package:flutter/foundation.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;
  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }
  Future<void> saveUserInPreference(dynamic user) async {
   
    await localStorage.setValue('token', jsonEncode(user));
    await localStorage.setValue('isLogin', 'true');
    
  }

  Future<void> getUserFromPrefernce() async {
    try {
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');

      if (userData.isNotEmpty) {
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true' ? true : false;
 
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
