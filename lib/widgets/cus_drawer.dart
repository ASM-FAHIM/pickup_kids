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
            height: 200,
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
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(180.0),
                      child: Image.asset(
                        'assets/images/profile3.png',
                        scale: 10,
                      ),
                    ),
                    Text(
                      "Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: drawerTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          ///List of screens
          Expanded(
            child: Container(
              width: double.infinity,
              height: 400,
              color: mainColor,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        Get.toNamed('/profile');
                      },
                      leading: Icon(
                        Icons.account_box,
                        color: mainBlackColor,
                        size: 20,
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(color: drawerTextColor, fontSize: 20),
                      ),
                    ),

                    //Is used for customizing the app for faster execution.
                    CusDivider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/dashboard');
                      },
                      leading: Icon(
                        Icons.dashboard,
                        color: mainBlackColor,
                        size: 20,
                      ),
                      title: Text(
                        "Dashboard",
                        style: TextStyle(color: drawerTextColor, fontSize: 20),
                      ),
                    ),
                    CusDivider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/pickup');
                      },
                      leading: Icon(
                        Icons.schedule,
                        color: mainBlackColor,
                        size: 20,
                      ),
                      title: Text(
                        "Pickup Schedule",
                        style: TextStyle(color: drawerTextColor, fontSize: 20),
                      ),
                    ),
                    CusDivider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/notification');
                      },
                      leading: Icon(
                        Icons.notifications_active,
                        color: mainBlackColor,
                        size: 20,
                      ),
                      title: Text(
                        "Notifications",
                        style: TextStyle(color: drawerTextColor, fontSize: 20),
                      ),
                    ),
                    CusDivider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/history');
                      },
                      leading: Icon(
                        Icons.history,
                        color: mainBlackColor,
                        size: 20,
                      ),
                      title: Text(
                        "History",
                        style: TextStyle(color: drawerTextColor, fontSize: 20),
                      ),
                    ),
                    CusDivider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/contact');
                      },
                      leading: Icon(
                        Icons.contacts,
                        color: mainBlackColor,
                        size: 20,
                      ),
                      title: Text(
                        "Contact",
                        style: TextStyle(color: drawerTextColor, fontSize: 20),
                      ),
                    ),
                    CusDivider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/map');
                      },
                      leading: Icon(
                        Icons.map,
                        color: mainBlackColor,
                        size: 20,
                      ),
                      title: Text(
                        "Map",
                        style: TextStyle(color: drawerTextColor, fontSize: 20),
                      ),
                    ),
                    CusDivider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed('/login');
                      },
                      leading: Icon(
                        Icons.logout,
                        color: mainBlackColor,
                        size: 20,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(color: drawerTextColor, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Is used for customizing the app for faster execution.
class CusDivider extends StatelessWidget {
  const CusDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 2,
      color: defWhite,
    );
  }
}
