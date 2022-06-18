import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class ChildInfoScreen extends StatefulWidget {
  final String textEditingController;
  // final String vehicleController;
  const ChildInfoScreen({
    Key? key,
    required this.textEditingController,
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
                                        Icons.person,
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
                                  height: 10,
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
                                      'assets/images/children.png',
                                      scale: 2,
                                    ),
                                  ),
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
