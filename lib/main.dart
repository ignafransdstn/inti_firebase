import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inti_firebase/controller/auth_controller.dart';
// import 'package:inti_firebase/controller/routes_name.dart';
import 'package:inti_firebase/controller/screen_route.dart';
import 'package:inti_firebase/firebase_options.dart';
import 'package:get/get.dart';
import 'package:inti_firebase/utils/loading.dart';
import 'package:inti_firebase/view/login.dart';
import 'package:inti_firebase/view/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authCont = Get.put(AuthController(), permanent: true);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authCont.streamAuthStatus,
        builder: (context, snapshot) {
          if (kDebugMode) {
            print (snapshot.data);
          }
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              title: 'Warehouse INTI',
              debugShowCheckedModeBanner: false,
              // initialRoute: snapshot.data != null ? Routes.home_screen : Routes.login_screen, 
              getPages: AppPage.pages,
              home:  snapshot.data != null ? HomeScreen() : const LoginScreen(),
              // initialRoute: snapshot.data != null ? '/login' : '',
              // getPages: [
              //   GetPage(name: '/login', page: () => const LoginScreen(),)
              // ],
            );
          }
          return const LoadingScreen();
        });
  }
}
