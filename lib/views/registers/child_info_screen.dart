import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pic_kids/controllers/child_image_controller.dart';
import 'package:pic_kids/views/registers/vehicle_info_list.dart';

import '../../constants/constants.dart';
import '../../models/uid_model.dart';

class ChildInfoScreen extends StatefulWidget {
  // const Tab_view({Key? key}) : super(key: key);

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

class _ChildInfoScreenState extends State<ChildInfoScreen>
    with SingleTickerProviderStateMixin {
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  //Using Tabbar
  int _tabIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    gettingUidMethod();
    _tabController = TabController(
        vsync: this,
        length: widget.textEditingController.isEmpty
            ? 1
            : int.parse(widget.textEditingController));
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  final GlobalKey<FormState> _fromKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController rollController = TextEditingController();

  //for image picker
  ChildPicController childPicController = Get.put(ChildPicController());

  //getting Uid for inserting row
  late UidModel data;

  gettingUidMethod() async {
    var response = await http.post(
        Uri.parse('http://172.20.20.69/pick_kids/create_account/returnUid.php'),
        body: jsonEncode(<String, String>{
          "xuser_name": widget.userNameController,
        }));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    data = uidModelFromJson(response.body);
    debugPrint(widget.userNameController.toString());
  }

  //create children method
  createChildrenAccount(int row) async {
    var response = await http.post(
        Uri.parse('http://172.20.20.69/pick_kids/create_account/child.php'),
        body: jsonEncode(<String, String>{
          "uid": data.uid,
          "row": row.toString(),
          "child_name": nameController.text,
          "child_class": classController.text,
          "child_roll": rollController.text,
          "child_image": "childs_image",
        }));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          backgroundColor: mainColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Text(
                ' Register',
                style: TextStyle(
                  color: mainBlackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _fromKey,
        child: TabBarView(
          controller: _tabController,
          children: [
            for (var i = 1; i <= int.parse(widget.textEditingController); i++)
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
                              i <= int.parse(widget.textEditingController);
                              i++)
                            Text("Child $i")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Child ${i} ' ' Information',
                        style: TextStyle(
                          color: mainBlackColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Name',
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
                          controller: classController,
                          decoration: const InputDecoration(
                            hintText: 'Class Name',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                            prefixIcon: Icon(
                              Icons.flight_class_rounded,
                            ),
                          ),
                          keyboardType: TextInputType.numberWithOptions()),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: rollController,
                        decoration: const InputDecoration(
                          hintText: 'Id Number',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
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
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return bottomSheet(context);
                              });
                        },
                        style: ElevatedButton.styleFrom(primary: mainColor),
                        child: Text(
                          'Upload image',
                          style: TextStyle(color: mainBlackColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Obx(
                      () => CircleAvatar(
                        backgroundImage:
                            childPicController.isProfilePicPathSet.value == true
                                ? FileImage(File(childPicController
                                    .profilePicPath.value)) as ImageProvider
                                : AssetImage('assets/images/children.png'),
                        radius: 100,
                      ),
                    ),
                    Divider(
                      thickness: 4,
                      color: mainColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200, top: 20),
                      child: SizedBox(
                        height: 44,
                        width: 194,
                        child: ElevatedButton(
                          onPressed: () {
                            if (i == int.parse(widget.textEditingController)) {
                              createChildrenAccount(i); //for testing purpose
                              Get.to(() => VehicleInfoScreen(
                                    uid: data.uid,
                                  ));
                              print(data.uid);
                              //manage back button strictly.
                            } else {
                              createChildrenAccount(i); //for testing purpose
                              _toggleTab();
                            }
                          },
                          style: ElevatedButton.styleFrom(primary: mainColor),
                          child: Text(
                            i == int.parse(widget.textEditingController)
                                ? "Next"
                                : "ok",
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
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.maxFinite,
      height: size.height * .2,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Choose profile photo",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint('Image clicked');
                  takePhoto(ImageSource.gallery);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 40,
                    ),
                    Text(
                      'Gallery',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('Image clicked');
                  takePhoto(ImageSource.camera);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.camera,
                      size: 40,
                    ),
                    Text(
                      'Camera',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    childPicController.setProfileImagePath(pickedFile!.path);
    print(pickedFile);
  }
}
