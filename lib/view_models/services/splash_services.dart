import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:getx_example/view/home/home_view.dart';
import 'package:getx_example/view/login/login_view.dart';
import 'package:getx_example/view_models/controller/login/user_prefrence/user_prefrence_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isUserLogin() {
    userPreference.getUser().then((value) {
      print(value.token);
      if (value.token == null || value.token!.isEmpty) {
        Timer(Duration(seconds: 3), () => Get.offAll(LoginView()));
      } else {
        Timer(Duration(seconds: 3), () => Get.offAll(HomeView()));
      }
    });
  }
}
