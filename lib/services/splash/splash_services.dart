import 'dart:async';

import 'package:bloc_clean_code/config/routes/routes.dart';
import 'package:bloc_clean_code/config/routes/routes_name.dart';
import 'package:bloc_clean_code/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPrefernce().then(
      (value) {
        if (SessionController().isLogin ?? false) {
          print('hello');
          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushAndRemoveUntil(
                  context,
                  Routes.generateRoute(
                      const RouteSettings(name: RoutesName.homeScreen)),
                  (route) => false));
        } else {
          
          Timer(
              const Duration(seconds: 3),
              () => Navigator.pushAndRemoveUntil(
                  context,
                  Routes.generateRoute(
                      const RouteSettings(name: RoutesName.loginScreen)),
                  (route) => false));
        }
      },
    ).onError(
      (error, stackTrace) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(
                context,
                Routes.generateRoute(
                    const RouteSettings(name: RoutesName.loginScreen)),
                (route) => false));
      },
    );
  }
}
