import 'package:fluro/fluro.dart';
import 'package:geodot/screens/dashboard.dart';
import 'package:geodot/screens/login.dart';

import '../screens/register.dart';

class Routes {

  static final router = FluroRouter();

  static var loginPageHandler = Handler(handlerFunc: (context, params){
    return const LoginPage();
  });
  static var registerPageHandler = Handler(handlerFunc: (context, params){
    return const RegisterPage();
  });

  static var dashBoardPageHandler = Handler(handlerFunc: (context, params){
    return const DashBoardPage();
  });




  //routes
  static dynamic defineRoutes() {
    router.define("login", handler: loginPageHandler, transitionType: TransitionType.fadeIn);
    router.define("register", handler: registerPageHandler, transitionType: TransitionType.fadeIn);
    router.define("dashboard", handler: dashBoardPageHandler, transitionType: TransitionType.fadeIn);
  }
}