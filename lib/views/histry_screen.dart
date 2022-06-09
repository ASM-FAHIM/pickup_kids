import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';
import '../widgets/cus_drawer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String _fromDate = '';
  String _toDate = '';
  var initialDate;
  var firstDate;
  var lastDate;

  void _showFromDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(20225),
      builder: (context, child) => Theme(
        data: ThemeData(
            backgroundColor: Colors.blueAccent,
            colorScheme: ColorScheme.dark(
              primary: Colors.blueAccent,
              surface: Color(0xff064A76),
            )),
        child: child as Widget,
      ),
    );

    if (picked != null)
      setState(() => _fromDate =
          DateFormat("yyyy-MM-dd").format(DateTime.parse(picked.toString())));
    ;
  }

  void _showToDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      builder: (context, child) => Theme(
        data: ThemeData(
            backgroundColor: Colors.blueAccent,
            colorScheme: ColorScheme.dark(
              primary: Colors.blueAccent,
              surface: Color(0xff064A76),
            )),
        child: child as Widget,
      ),
    );

    if (picked != null)
      setState(() => _toDate =
          DateFormat("yyyy-MM-dd").format(DateTime.parse(picked.toString())));
  }

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      _showFromDatePicker();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff074974), width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today_sharp,
                            color: mainBlackColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _fromDate,
                            style: TextStyle(
                              color: mainBlackColor,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      color: dtContainerColor,
                      child: Text(
                        'To Date',
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      _showToDatePicker();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff074974), width: 1),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today_sharp,
                            color: mainBlackColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '',
                            // _toDate,
                            style: TextStyle(
                              color: mainBlackColor,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 10, right: 10),
                      color: dtContainerColor,
                      child: Text(
                        'To Date',
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 325,
                height: 445,
                margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: elButtonColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateContainer extends StatelessWidget {
  const DateContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () {
            // _showFromDatePicker();
          },
          child: Container(
            width: double.infinity,
            height: 100,
            child: Center(
                child: Row(
              children: [
                Icon(
                  Icons.calendar_today_sharp,
                  color: mainBlackColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '',
                  // _fromDate,
                  style: TextStyle(
                    color: mainBlackColor,
                  ),
                ),
              ],
            )),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff074974), width: 1),
              borderRadius: BorderRadius.circular(5),
              shape: BoxShape.rectangle,
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 12,
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            color: dtContainerColor,
            child: Text(
              'From Date',
            ),
          ),
        ),
      ],
    );
  }
}
