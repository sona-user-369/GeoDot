import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:geodot/data/services/auth_service.dart';
import 'package:geodot/screens/dashboard.dart';
import 'package:geodot/screens/login.dart';
import 'package:geodot/screens/register.dart';
import 'package:geodot/utils/colors.dart';
import 'package:geodot/utils/constants.dart';
import 'package:geodot/utils/images.dart';
import 'package:geodot/utils/routes.dart';
import 'package:geodot/utils/socketClient.dart';
import 'package:geodot/utils/storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;

  await AppStorage.init();

  Routes.defineRoutes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPicker.primary),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoMonoTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.robotoMono(textStyle: textTheme.bodyMedium),
        ),
      ),

      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.router.generator,
      home: FlutterSplashScreen(
        backgroundColor: ColorPicker.white,
        splashScreenBody: Center(
            child: SizedBox(
              width: 100,
                height: 100,
                child: Image.asset(AppImages.logo)
            )
        ),
        onInit: ()  {
          if(AuthService.userLogin == 1){
            SocketClient socketClient = SocketClient() ;
            socketClient.connect();
          }
        },

        onEnd: () {

        },

        setNextScreenAsyncCallback: () async {

          return AuthService.userNovice == 1  ? const RegisterPage():
          AuthService.userLogin == 0 ? const LoginPage(): const DashBoardPage();
          // const MyHomePage();
        },
        defaultNextScreen: AuthService.userNovice == 1  ? const RegisterPage():
        AuthService.userLogin == 0 ? const LoginPage(): const DashBoardPage(),

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return const DashBoardPage() ;
  }
}
