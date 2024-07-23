import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_example/res/components/round_button.dart';
import 'package:getx_example/view/login/widgets/input_fields.dart';
import 'package:getx_example/view_models/controller/login/login_view_model.dart';

import '../../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    Get.delete<LoginViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _fromKey,
              child: Column(
                children: [
                  InputFields(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    hintText: 'Enter your email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('Email', 'Please enter your email');
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginVM.emailFocusNode.value,
                          loginVM.passwordFocusNode.value);
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InputFields(
                    controller: loginVM.passwordController.value,
                    focusNode: loginVM.passwordFocusNode.value,
                    hintText: 'Enter your password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar(
                            'Password', 'Please enter your password');
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Obx(() => RoundButton(
                height: 30.h,
                width: 200.w,
                loading: loginVM.loading.value,
                title: 'Login',
                onPress: () {
                  var email = loginVM.emailController.value.text;
                  var password = loginVM.passwordController.value.text;
                  if (_fromKey.currentState!.validate()) {
                    print("emailController ${email}");
                    print("passwordController ${password}");

                    if (email.isNotEmpty && password.isNotEmpty) {
                      loginVM.loginApi();
                    }
                  }
                }))
          ],
        ),
      ),
    );
  }
}
