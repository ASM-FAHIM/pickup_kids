import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/cus_drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ' Notifications',
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
    );
  }
}
