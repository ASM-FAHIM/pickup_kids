import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_kids/controllers/register_controller.dart';

import '../../constants/constants.dart';

class VehicleInfoScreen extends StatefulWidget {
  // final String textEditingController;
  const VehicleInfoScreen({
    Key? key,
    // required this.textEditingController,
  }) : super(key: key);

  @override
  State<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController licenceController = TextEditingController();
  final TextEditingController car1Controller = TextEditingController();
  final TextEditingController car2Controller = TextEditingController();
  final TextEditingController car3Controller = TextEditingController();

  RegisterController registerController = Get.put(RegisterController());

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
              Form(
                key: _fromKey,
                child: Column(
                  children: [
                    Obx(() {
                      return SizedBox(
                          height: 580,
                          child: ListView.builder(
                              itemCount: registerController.isSavedValue.value
                                  ? registerController.saveNumber.value
                                  : 1,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Text(
                                      'Vehicle ${index + 1} Information',
                                      style: TextStyle(
                                        color: mainBlackColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      child: TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          hintText: 'Driver ${index + 1} name',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15),
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
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15),
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
                                        controller: licenceController,
                                        decoration: InputDecoration(
                                          hintText: 'License Number',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15),
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
                                          hintText: 'Car ${index + 1} Number',
                                          hintStyle: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                          prefixIcon: Icon(
                                            Icons.person,
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
                                        style: ElevatedButton.styleFrom(
                                            primary: mainColor),
                                        child: Text(
                                          'Upload car image',
                                          style:
                                              TextStyle(color: mainBlackColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/carImage.png'),
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
                                        style: ElevatedButton.styleFrom(
                                            primary: mainColor),
                                        child: Text(
                                          'Upload driver image',
                                          style:
                                              TextStyle(color: mainBlackColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/driverImage.png'),
                                      radius: 100,
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                );
                              }));
                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 200, top: 30),
                      child: SizedBox(
                        height: 44,
                        width: 194,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/regiOTPScreen');
                          },
                          style: ElevatedButton.styleFrom(primary: mainColor),
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
            ],
          ),
        ),
      ),
    );
  }
}
