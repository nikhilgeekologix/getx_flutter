import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_example/models/login_model/login_response_model.dart';
import 'package:getx_example/repository/login_repository/login_repository.dart';
import 'package:getx_example/utils/utils.dart';
import 'package:getx_example/view/home/home_view.dart';
import 'package:getx_example/view_models/controller/login/user_prefrence/user_prefrence_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final UserPreference userPreference = UserPreference();
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    var data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        userPreference
            .saveUser(LoginResponseModel.fromJson(value))
            .then((value) {
          Get.offAll(HomeView());
        }).onError((error, stackTrace) {
          Utils.snackBar('Error', error.toString());
        });
        Utils.snackSuccessBar('Login', 'Login Successfully');
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
