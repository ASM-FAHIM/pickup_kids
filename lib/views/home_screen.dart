import 'package:flutter/material.dart';
import 'package:pic_kids/constants/constants.dart';

import '../widgets/cus_drawer.dart';
import '../widgets/date_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                ' Dashboard',
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
              SizedBox(
                height: 30,
              ),

              ///Container for date and time showing
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: DateContainer(),
              ),

              ///Container for first blue Row
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: dashboardContainerColor,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(180.0),
                          child: Image.asset(
                            'assets/images/profile3.png',
                            scale: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "My Children",
                          style: TextStyle(
                            color: dtContainerColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///List of children
              SizedBox(
                width: double.infinity,
                height: 150,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(180.0),
                                child: Image.asset(
                                  'assets/images/children.png',
                                  scale: 22,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Child Name",
                                style: TextStyle(
                                  color: mainBlackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Get.toNamed('/home');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: elButtonColor,
                                  ),
                                  child: Text(
                                    'Set Pickup',
                                    style: TextStyle(color: mainBlackColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              ///Container for Advertise
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  child: Image.asset(
                    'assets/images/united_group.png',
                    scale: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
