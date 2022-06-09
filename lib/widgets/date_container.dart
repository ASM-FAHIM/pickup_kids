import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';

class DateContainer extends StatelessWidget {
  DateTime now = DateTime.now();
  String date = DateFormat.yMMMEd().format(DateTime.now());

  DateContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          color: dtContainerColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            date,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
