import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../widgets/cus_otp_textfield.dart';

class ForgotOTPScreen extends StatefulWidget {
  const ForgotOTPScreen({Key? key}) : super(key: key);

  @override
  State<ForgotOTPScreen> createState() => _ForgotOTPScreenState();
}

class _ForgotOTPScreenState extends State<ForgotOTPScreen> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            ' Forgot Password',
            style: TextStyle(
              color: mainBlackColor,
              //changed size instead of 40
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Text("OTP for Account verification"),
          SizedBox(
            height: 30,
          ),

          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CusOTPTxtfld(textEditingController: _fieldOne, autofocus: true),
              CusOTPTxtfld(textEditingController: _fieldTwo, autofocus: true),
              CusOTPTxtfld(textEditingController: _fieldThree, autofocus: true),
              CusOTPTxtfld(textEditingController: _fieldFour, autofocus: true),
            ],
          ),
          SizedBox(
            height: 30,
          ),

          //elevated button
          SizedBox(
            height: 44,
            width: 194,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
                Get.snackbar("Success", "Successfully verified");
              },
              style: ElevatedButton.styleFrom(primary: mainColor),
              child: Text(
                'Confirm',
                style: TextStyle(color: mainBlackColor),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          // Display the entered OTP code
          Text(
            _otp ?? 'Please enter OTP',
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
