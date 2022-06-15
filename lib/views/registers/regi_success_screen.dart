import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class RegiSucessScreen extends StatefulWidget {
  const RegiSucessScreen({Key? key}) : super(key: key);

  @override
  State<RegiSucessScreen> createState() => _RegiSucessScreenState();
}

class _RegiSucessScreenState extends State<RegiSucessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            ' Verification',
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
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: mainColor,
              ),
              child: Image.asset(
                'assets/images/Successdesign.gif',
                scale: 2,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Verification Successful.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: mainBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
