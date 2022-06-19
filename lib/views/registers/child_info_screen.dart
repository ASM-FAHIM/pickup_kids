import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pic_kids/models/uid_model.dart';

import '../../constants/constants.dart';

class ChildInfoScreen extends StatefulWidget {
  final String textEditingController;
  final String userNameController;
  // final String vehicleController;
  const ChildInfoScreen({
    Key? key,
    required this.textEditingController,
    required this.userNameController,
    // required this.vehicleController,
  }) : super(key: key);

  @override
  State<ChildInfoScreen> createState() => _ChildInfoScreenState();
}

class _ChildInfoScreenState extends State<ChildInfoScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController rollController = TextEditingController();

  //getting Uid for inserting row
  late UidModel data;
  gettingUidMethod() async {
    var response = await http.post(
        Uri.parse('http://172.20.20.69/pick_kids/create_account/returnUid.php'),
        body: jsonEncode(<String, String>{
          "user_name": widget.userNameController,
        }));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    data = uidModelFromJson(response.body);
    debugPrint(widget.userNameController.toString());
  }

  //create children method
  createChildrenAccount() async {
    var response = await http.post(
        Uri.parse('http://172.20.20.69/pick_kids/create_account/child.php'),
        body: jsonEncode(<String, String>{
          "uid": data.uid,
          // "row" : widget.textEditingController-(widget.textEditingController-),
          "child_name": nameController.text,
          "child_class": classController.text,
          "child_roll": rollController.text,
          "image": "child's_image",
        }));
    debugPrint(response.statusCode.toString());
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _fromKey,
                child: Column(
                  children: [
                    Container(
                      height: 580,
                      child: ListView.builder(
                          itemCount: widget.textEditingController.isEmpty
                              ? 1
                              : int.parse(widget.textEditingController),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Child ${index + 1} ' ' Information',
                                    style: TextStyle(
                                      color: mainBlackColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: 'Name',
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
                                    controller: classController,
                                    decoration: InputDecoration(
                                      hintText: 'class Name',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                      prefixIcon: Icon(
                                        Icons.flight_class_rounded,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: TextFormField(
                                    controller: rollController,
                                    decoration: InputDecoration(
                                      hintText: 'Id Number',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 44,
                                  width: 194,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: mainColor),
                                    child: Text(
                                      'Upload image',
                                      style: TextStyle(color: mainBlackColor),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/children.png'),
                                  radius: 100,
                                ),
                              ],
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200, top: 20),
                      child: SizedBox(
                        height: 44,
                        width: 194,
                        child: ElevatedButton(
                          onPressed: () {
                            createChildrenAccount();
                            Get.toNamed('/vehicleInfoScreen');
                          },
                          style: ElevatedButton.styleFrom(primary: mainColor),
                          child: Text(
                            'Next',
                            style: TextStyle(color: mainBlackColor),
                          ),
                        ),
                      ),
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
