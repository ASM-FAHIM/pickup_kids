import 'package:flutter/material.dart';
import 'package:pic_kids/widgets/cus_drawer.dart';

import '../constants/constants.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({Key? key}) : super(key: key);

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
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
            leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: mainBlackColor,
                  size: 35,
                )),
            title: Text(
              ' Pickup Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mainBlackColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: Text('Will be implemented soon'),
          ),
        ),
      ),
    );
  }
}
