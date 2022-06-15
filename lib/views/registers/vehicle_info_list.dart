import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/constants.dart';

class VehicleInfoScreen extends StatefulWidget {
  const VehicleInfoScreen({Key? key}) : super(key: key);

  @override
  State<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  final TextEditingController dnameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController licensController = TextEditingController();
  final TextEditingController car1Controller = TextEditingController();
  final TextEditingController car2Controller = TextEditingController();
  final TextEditingController car3Controller = TextEditingController();

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Vehicle Information',
                style: TextStyle(
                  color: mainBlackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: defWhite,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: dnameController,
                            decoration: InputDecoration(
                              hintText: 'Driver name',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: mobileController,
                            decoration: InputDecoration(
                              hintText: 'Mobile number',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: licensController,
                            decoration: InputDecoration(
                              hintText: 'License Number',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.phone,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: car1Controller,
                            decoration: InputDecoration(
                              hintText: 'Car 1 Number',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: car2Controller,
                            decoration: InputDecoration(
                              hintText: 'Car 2 Number (if any)',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: car3Controller,
                            decoration: InputDecoration(
                              hintText: 'Car 3 Number (if any)',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.phone,
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
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            color: elButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(180.0),
                            child: Image.asset(
                              'assets/images/carImage.png',
                              scale: 2,
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
                              'Upload driver image',
                              style: TextStyle(color: mainBlackColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            color: elButtonColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(180.0),
                            child: Image.asset(
                              'assets/images/driverImage.png',
                              scale: 2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200, top: 30),
                          child: SizedBox(
                            height: 44,
                            width: 194,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.toNamed('/regiOTPScreen');
                              },
                              style:
                                  ElevatedButton.styleFrom(primary: mainColor),
                              child: Text(
                                'Confirm',
                                style: TextStyle(color: mainBlackColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
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
