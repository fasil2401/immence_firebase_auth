import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:immence_try/view/home_page.dart';
import 'package:immence_try/view/login.dart';
import 'package:immence_try/view/main_screen.dart';
import 'package:immence_try/view/register.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
     return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/main',

      getPages: [
         GetPage(name: '/main', page: () => MainPage(),
            transition: Transition.cupertino
            ),
        GetPage(name: '/', page: () => LoginScreen(),
            transition: Transition.cupertino
            ),
             GetPage(name: '/register', page: () => RegisterScreen(),
            transition: Transition.cupertino
            ),
            GetPage(name: '/home', page: () => HomePage(),
            transition: Transition.cupertino
            ),
      ],
    );
    }
    );
  }
}

