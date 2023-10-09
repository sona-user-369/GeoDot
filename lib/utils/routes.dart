import 'package:fluro/fluro.dart';
import 'package:geodot/controllers/add_contact_controller.dart';
import 'package:geodot/screens/dashboard.dart';
import 'package:geodot/screens/login.dart';

import '../screens/add_contact.dart';
import '../screens/register.dart';
import '../screens/contacts.dart';

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

  static var contactPageHandler = Handler(handlerFunc: (context, params){
    return const ContactsPage();
  });

  static var addContactPageHandler = Handler(handlerFunc: (context, params){
    return const AddContactPage();
  });




  //routes
  static dynamic defineRoutes() {
    router.define("login", handler: loginPageHandler, transitionType: TransitionType.fadeIn);
    router.define("register", handler: registerPageHandler, transitionType: TransitionType.fadeIn);
    router.define("dashboard", handler: dashBoardPageHandler, transitionType: TransitionType.fadeIn);
    router.define("contacts", handler: contactPageHandler, transitionType: TransitionType.fadeIn);
    router.define("add_contact", handler: addContactPageHandler, transitionType: TransitionType.fadeIn);
  }
}