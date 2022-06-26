import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pic_kids/constants/constants.dart';

import '../models/get_child_model.dart';
import '../widgets/cus_drawer.dart';
import '../widgets/date_container.dart';

class HomeScreen extends StatefulWidget {
  final String uid;
  const HomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<List<GetChildModel>> future;

  //getting childInformation by uid.
  Future<List<GetChildModel>> getChildInfo() async {
    var response = await http.post(
        Uri.parse('http://172.20.20.69/pick_kids/home_screen/home.php'),
        body: jsonEncode(<String, String>{"uid": widget.uid}));

    debugPrint(response.body.toString());
    debugPrint(response.statusCode.toString());

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<GetChildModel>((json) => GetChildModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch Data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('--------');
    getChildInfo();
    future = getChildInfo();
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
              ' Dashboard',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: mainBlackColor,
                fontSize: 30,
                fontWeight: FontWeight.w700,
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

              //Container for date and time showing
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: DateContainer(),
              ),

              //Container for first blue Row
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: dashboardContainerColor,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(180.0),
                          child: Image.asset(
                            'assets/images/profile3.png',
                            scale: 10,
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
                            fontSize: 25,
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
                child: FutureBuilder<List<GetChildModel>>(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(180.0),
                                      child: Image.asset(
                                        'assets/images/children.png',
                                        scale: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        snapshot.data![index].childName,
                                        style: TextStyle(
                                          color: mainBlackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        var response = await http.post(
                                            Uri.parse(
                                                'http://172.20.20.69/pick_kids/home_screen/pickup_request.php'),
                                            body: jsonEncode(<String, String>{
                                              "child_name": snapshot
                                                  .data![index].childName,
                                              "child_class": snapshot
                                                  .data![index].childClass,
                                              "child_roll": snapshot
                                                  .data![index].childRoll,
                                              "father_name": snapshot
                                                  .data![index].fatherName,
                                              "picker_name": snapshot
                                                  .data![index].pickerName,
                                              "car_num_plate": snapshot
                                                  .data![index].carNumplate,
                                              "child_image": snapshot
                                                  .data![index].childImage,
                                              "father_image": "File",
                                              "picker_image": "File",
                                              "car_image": snapshot
                                                  .data![index].carImage,
                                              "xstatus": "requested",
                                            }));
                                        debugPrint(
                                            response.statusCode.toString());
                                        debugPrint(response.body.toString());
                                        Get.snackbar(
                                            "Successful", "Pickup request sent",
                                            backgroundColor: mainColor,
                                            colorText: mainBlackColor,
                                            snackPosition:
                                                SnackPosition.BOTTOM);

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
                                ],
                              ),
                            );
                          });
                    } else {
                      return Center(
                        //will add a gif here
                        child: Text("Loading image"),
                      );
                    }
                  },
                ),
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
