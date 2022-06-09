import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppbarContainer extends StatelessWidget {
  String title;
  Color color;

  AppbarContainer({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: mainBlackColor,
            fontFamily: 'Roboto',
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
