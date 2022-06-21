import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pic_kids/controllers/register_controller.dart';

import '../../constants/constants.dart';

class VehicleInfoScreen extends StatefulWidget {
  final String uid;
  const VehicleInfoScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController licenceController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController car1Controller = TextEditingController();
  final TextEditingController car3Controller = TextEditingController();

  RegisterController registerController = Get.put(RegisterController());

  //Using Tabbar
  int _tabIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        length: registerController.saveNumber.value == 0
            ? 1
            : registerController.saveNumber.value);
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  //create children method
  createVehicleAccount(int row) async {
    var response = await http.post(
        Uri.parse('http://172.20.20.69/pick_kids/create_account/vehicle.php'),
        body: jsonEncode(<String, String>{
          "uid": widget.uid,
          "row": row.toString(),
          "driver_name": nameController.text,
          "mobile_number": mobileController.text,
          "lisense": licenceController.text,
          "nid": nidController.text,
          "car_numplate": car1Controller.text,
          "car_image": "car_image_png",
          "driver_image": "driver_image_png",
        }));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              ' Register',
              style: TextStyle(
                color: mainBlackColor,

                //changed size instead of 40
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: Form(
          key: _fromKey,
          child: TabBarView(controller: _tabController, children: [
            for (var i = 1; i <= registerController.saveNumber.value; i++)
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      color: mainColor,
                      child: TabBar(
                        labelColor: mainBlackColor,
                        controller: _tabController,
                        tabs: [
                          for (var i = 1;
                              i <= registerController.saveNumber.value;
                              i++)
                            Text("Vehicle $i")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Driver $i name',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: mobileController,
                        decoration: InputDecoration(
                          hintText: 'Mobile number',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: licenceController,
                        decoration: InputDecoration(
                          hintText: 'License Number',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          prefixIcon: Icon(
                            Icons.credit_card_sharp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: nidController,
                        decoration: InputDecoration(
                          hintText: 'NID Number',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          prefixIcon: Icon(
                            Icons.card_membership_sharp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: car1Controller,
                        decoration: InputDecoration(
                          hintText: 'Car $i Number plate',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          prefixIcon: Icon(
                            Icons.car_crash_sharp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 44,
                      width: 194,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: mainColor),
                        child: Text(
                          'Upload car image',
                          style: TextStyle(color: mainBlackColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/carImage.png'),
                      radius: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 44,
                      width: 194,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: mainColor),
                        child: Text(
                          'Upload driver image',
                          style: TextStyle(color: mainBlackColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/driverImage.png'),
                      radius: 100,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Divider(
                      thickness: 4,
                      color: mainColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200, top: 30),
                      child: SizedBox(
                        height: 44,
                        width: 194,
                        child: ElevatedButton(
                          onPressed: () {
                            if (i == registerController.saveNumber.value) {
                              createVehicleAccount(i); //for testing purpose
                              //manage back button strictly.
                              Get.offNamed('/regiOTPScreen');
                            } else {
                              createVehicleAccount(i); //for testing purpose
                              _toggleTab();
                            }
                          },
                          style: ElevatedButton.styleFrom(primary: mainColor),
                          child: Text(
                            i == registerController.saveNumber.value
                                ? "Confirm"
                                : "Next",
                            style: TextStyle(color: mainBlackColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
          ]),
        ),
      ),
    );
  }
}
