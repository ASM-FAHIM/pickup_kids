import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import 'custom_back.dart';

class CusDrawer extends StatelessWidget {
  const CusDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: mainColor,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ///backButton
                    CustomDrawerCloseButton(),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(180.0),
                            child: Image.asset(
                              'assets/images/profile3.png',
                              scale: 9,
                            ),
                          ),
                        ),
                        Text(
                          "Account",
                          style: TextStyle(
                            color: drawerTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          ///List of screens
          Container(
            width: double.infinity,
            height: 472,
            color: mainColor,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.toNamed('/profile');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.account_box,
                        color: mainBlackColor,
                        size: 30,
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(color: drawerTextColor, fontSize: 25),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/dashboard');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        color: mainBlackColor,
                        size: 30,
                      ),
                      title: Text(
                        "Dashboard",
                        style: TextStyle(color: drawerTextColor, fontSize: 25),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/pickup');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.schedule,
                        color: mainBlackColor,
                        size: 30,
                      ),
                      title: Text(
                        "Pickup Schedule",
                        style: TextStyle(color: drawerTextColor, fontSize: 25),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/notification');
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.notifications_active,
                        color: mainBlackColor,
                        size: 30,
                      ),
                      title: Text(
                        "Notifications",
                        style: TextStyle(color: drawerTextColor, fontSize: 25),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      color: mainBlackColor,
                      size: 30,
                    ),
                    title: Text(
                      "History",
                      style: TextStyle(color: drawerTextColor, fontSize: 25),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.contacts,
                      color: mainBlackColor,
                      size: 30,
                    ),
                    title: Text(
                      "Contact",
                      style: TextStyle(color: drawerTextColor, fontSize: 25),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
