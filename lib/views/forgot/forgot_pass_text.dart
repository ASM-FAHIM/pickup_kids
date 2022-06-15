import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class ForgotPassTxtfld extends StatefulWidget {
  const ForgotPassTxtfld({Key? key}) : super(key: key);

  @override
  State<ForgotPassTxtfld> createState() => _ForgotPassTxtfldState();
}

class _ForgotPassTxtfldState extends State<ForgotPassTxtfld> {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: defWhite,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Enter email or Phone number',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 44,
                        width: 194,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/forgotOTPScreen');
                          },
                          style: ElevatedButton.styleFrom(primary: mainColor),
                          child: Text(
                            'Submit',
                            style: TextStyle(color: mainBlackColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
