import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_kids/widgets/cus_otp_textfield.dart';

import '../../constants/constants.dart';

class RegiOTPScreen extends StatefulWidget {
  const RegiOTPScreen({Key? key}) : super(key: key);

  @override
  State<RegiOTPScreen> createState() => _RegiOTPScreenState();
}

class _RegiOTPScreenState extends State<RegiOTPScreen> {
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
            ' Registration',
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

          SizedBox(
            height: 44,
            width: 194,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/regiSuccessScreen');
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
