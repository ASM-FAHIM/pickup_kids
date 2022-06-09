import 'package:flutter/material.dart';
import 'package:pic_kids/widgets/cus_drawer.dart';

import '../constants/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String dropdownValue = 'Father Profile';

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
                ' Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mainBlackColor,
                  // fontFamily: 'Roboto',
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
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: dtContainerColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Profile Status: ",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Center(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                            // underline: Container(
                            //   height: 20,
                            //   color: Colors.white,
                            // ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              "Father Profile",
                              "Mother Profile",
                              "Child  Profile",
                              "Driver Profile",
                              "Car",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Visibility(
                  visible: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightBlueAccent.withOpacity(0.5),
                            spreadRadius: 1,
                            //blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(180.0),
                            child: Image.asset(
                              'assets/images/profile3.png',
                              scale: 5,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Name: Md. ABCD ABCD",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            //textAlign: TextAlign.center,
                          ),
                          Text(
                            "Mobile Number: 01700000000",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Adress: Jatrabari, Dhaka",
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            "Students Details: ",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
