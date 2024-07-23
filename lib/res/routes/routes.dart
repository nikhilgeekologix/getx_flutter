import 'package:get/get.dart';
import 'package:getx_example/res/routes/routes_name.dart';
import 'package:getx_example/view/SplashScreen.dart';

class AppRoutes {
  appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => SplashScreen(),
            transitionDuration: Duration(microseconds: 250),
            transition: Transition.leftToRightWithFade)
      ];
}
