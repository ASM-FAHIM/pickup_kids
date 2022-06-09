import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_kids/constants/constants.dart';
import 'package:pic_kids/views/home_screen.dart';
import 'package:pic_kids/views/login_screen.dart';
import 'package:pic_kids/views/notifications_screen.dart';
import 'package:pic_kids/views/pickup_screen.dart';
import 'package:pic_kids/views/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Pharma',
      theme: ThemeData().copyWith(
        // primaryColor: Color(0xFF28706F),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: mainColor,
          elevation: 0,
        ),
      ),
      initialRoute: '/login',
      getPages: [
        // GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/dashboard', page: () => HomeScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/pickup', page: () => PickupScreen()),
        GetPage(name: '/notification', page: () => NotificationScreen()),
      ],
    );
  }
}
