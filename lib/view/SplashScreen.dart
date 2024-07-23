import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_example/utils/utils.dart';

import '../res/assets/image_assets.dart';
import '../res/components/internet_exceptions_widget.dart';
import '../res/components/round_button.dart';
import '../view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    splashServices.isUserLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SizedBox(),
      ),
    );
  }
}
