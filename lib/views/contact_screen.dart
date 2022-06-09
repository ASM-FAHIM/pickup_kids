import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/cus_drawer.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: CusDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: mainBlackColor,
                    size: 35,
                  )),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                ' History',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mainBlackColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              height: 80,
              width: 300,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: elButtonColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  debugPrint('Mail pressed');
                },
                child: Center(
                  child: Text(
                    "Call to: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: mainBlackColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 80,
              width: 300,
              margin: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                color: elButtonColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton(
                onPressed: () {
                  debugPrint('Mail pressed');
                },
                child: Center(
                  child: Text(
                    "Mail to: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: mainBlackColor,
                    ),
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
