import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_kids/constants/constants.dart';
import 'package:pic_kids/views/contact_screen.dart';
import 'package:pic_kids/views/forgot/forgot_otp_screen.dart';
import 'package:pic_kids/views/forgot/forgot_pass_text.dart';
import 'package:pic_kids/views/histry_screen.dart';
import 'package:pic_kids/views/login_screen.dart';
import 'package:pic_kids/views/map_screen.dart';
import 'package:pic_kids/views/notifications/notifications_screen.dart';
import 'package:pic_kids/views/pickup_screen.dart';
import 'package:pic_kids/views/profile_screen.dart';
import 'package:pic_kids/views/registers/personal_info_screen.dart';
import 'package:pic_kids/views/registers/regi_otp_screen.dart';
import 'package:pic_kids/views/registers/regi_success_screen.dart';
import 'package:pic_kids/views/registers/spouse_info_screen.dart';

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
      title: 'Pick-Kids',
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
        //GetPage(name: '/dashboard', page: () => HomeScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/pickup', page: () => PickupScreen()),
        GetPage(name: '/notification', page: () => NotificationScreen()),
        GetPage(name: '/history', page: () => HistoryScreen()),
        GetPage(name: '/contact', page: () => ContactScreen()),
        GetPage(name: '/map', page: () => MapScreen()),
        GetPage(name: '/persnInfoScreen', page: () => PersonalInfoScreen()),
        GetPage(name: '/spouseInfoScreen', page: () => SpouseInfoScreen()),
        // GetPage(name: '/childInfoScreen', page: () => ChildInfoScreen(textEditingController: null,)),
        // GetPage(name: '/vehicleInfoScreen', page: () => VehicleInfoScreen()),
        GetPage(name: '/regiOTPScreen', page: () => RegiOTPScreen()),
        GetPage(name: '/regiSuccessScreen', page: () => RegiSucessScreen()),
        GetPage(name: '/forgotTxtfldScreen', page: () => ForgotPassTxtfld()),
        GetPage(name: '/forgotOTPScreen', page: () => ForgotOTPScreen()),
      ],
    );
  }
}
