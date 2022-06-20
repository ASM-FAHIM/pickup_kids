import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pic_kids/controllers/personal_info_controller.dart';
import 'package:pic_kids/controllers/register_controller.dart';
import 'package:pic_kids/views/registers/child_info_screen.dart';

import '../../constants/constants.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController spouseNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController spouseMobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController childNumController = TextEditingController();
  final TextEditingController vehicleController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  bool isLoading = true;

  //from controller class
  RegisterController registerController = Get.put(RegisterController());
  PersonalInfoController personalInfoController =
      Get.put(PersonalInfoController());

  //for taking image from mobile
  File? pickedFile;
  int count = 0;
  ImagePicker imagePicker = ImagePicker();

  //create profile method
  createAccount() async {
    var response = await http.post(
        Uri.parse('http://172.20.20.69/pick_kids/create_account/profile.php'),
        body: jsonEncode(<String, String>{
          "xuser_name": userNameController.text,
          "uname": nameController.text,
          "mobile_number": mobileController.text,
          "spouse_name": spouseNameController.text,
          "spouse_mobile_number": spouseMobileController.text,
          "uaddress": addressController.text,
          "no_of_child": childNumController.text,
          "no_of_vehicles": vehicleController.text,
          "email": mailController.text,
          "xpassword": passController.text,
          "ximage": "file",
          "spouse_image": "file"
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Personal Information',
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
                            controller: userNameController,
                            decoration: InputDecoration(
                              hintText: 'User name',
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
                            controller: nameController,
                            decoration: InputDecoration(
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
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: mobileController,
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
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
                            controller: spouseNameController,
                            decoration: InputDecoration(
                              hintText: 'Spouse Name',
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
                            controller: spouseMobileController,
                            decoration: InputDecoration(
                              hintText: 'Spouse mobile Number',
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
                            controller: addressController,
                            decoration: InputDecoration(
                              hintText: 'Address',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.home,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: childNumController,
                            decoration: InputDecoration(
                              hintText: 'Number of child in school',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.numbers,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: vehicleController,
                            decoration: InputDecoration(
                              hintText: 'Number of vehicles',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.numbers,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: mailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Roboto',
                                  fontSize: 15),
                              prefixIcon: Icon(
                                Icons.mail_outline,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: passController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.vpn_key_outlined,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                            controller: confirmPassController,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                              prefixIcon: Icon(
                                Icons.vpn_key_outlined,
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //upload image field
                        SizedBox(
                          height: 44,
                          width: 194,
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('Image clicked');
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return bottomSheet(context);
                                  });
                            },
                            style: ElevatedButton.styleFrom(primary: mainColor),
                            child: Text(
                              'Upload your image',
                              style: TextStyle(color: mainBlackColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => CircleAvatar(
                            backgroundImage:
                                registerController.isProfilePicPathSet.value ==
                                        true
                                    ? FileImage(File(registerController
                                        .profilePicPath.value)) as ImageProvider
                                    : AssetImage('assets/images/profile3.png'),
                            radius: 100,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //upload image field
                        SizedBox(
                          height: 44,
                          width: 194,
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint('Image clicked');
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return bottomSheet(context);
                                  });
                            },
                            style: ElevatedButton.styleFrom(primary: mainColor),
                            child: Text(
                              'Upload spouse image',
                              style: TextStyle(color: mainBlackColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //need to manage functions
                        Obx(
                          () => CircleAvatar(
                            backgroundImage:
                                registerController.isProfilePicPathSet.value ==
                                        true
                                    ? FileImage(File(registerController
                                        .profilePicPath.value)) as ImageProvider
                                    : AssetImage('assets/images/profile3.png'),
                            radius: 100,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        //button for next page
                        Padding(
                          padding: const EdgeInsets.only(left: 200, top: 30),
                          child: SizedBox(
                            height: 44,
                            width: 194,
                            child: ElevatedButton(
                              onPressed: () {
                                //for transferring vehicleController value to the vehicle screen.
                                if (vehicleController.text.isEmpty) {
                                  count = 0;
                                } else {
                                  count = int.parse(vehicleController.text);
                                  registerController.saveValue(count);
                                }

                                //for transferring childController value to the child screen.
                                if (childNumController.text.isEmpty) {
                                  childNumController.text = 1.toString();

                                  //for using personalInfoController
                                  createAccount(); //for testing purpose
                                  personalInfoController.isLoadingControl();
                                  Get.to(() => ChildInfoScreen(
                                        textEditingController:
                                            childNumController.text,
                                        userNameController:
                                            userNameController.text,
                                      ));
                                } else {
                                  createAccount(); //for testing purpose
                                  personalInfoController.isLoadingControl();
                                  Get.to(() => ChildInfoScreen(
                                        textEditingController:
                                            childNumController.text,
                                        userNameController:
                                            userNameController.text,
                                        // vehicleController: vehicleController.text,
                                      ));
                                  //   createAccount(); //off for testing screen generator.
                                  //   Future.delayed(Duration(seconds: 2), () {
                                  //     setState(() {
                                  //       isLoading = false;
                                  //     });
                                  //     Get.to(() => ChildInfoScreen(
                                  //           textEditingController:
                                  //               childNumController.text,
                                  //           userNameController:
                                  //               userNameController.text,
                                  //           // vehicleController: vehicleController.text,
                                  //         ));
                                  //   });
                                  // } else {
                                  //   createAccount(); //off for testing screen generator.
                                  //   Future.delayed(Duration(seconds: 2), () {
                                  //     setState(() {
                                  //       isLoading = false;
                                  //     });
                                  //     Get.to(() => ChildInfoScreen(
                                  //           textEditingController:
                                  //               childNumController.text,
                                  //           userNameController:
                                  //               userNameController.text,
                                  //           // vehicleController: vehicleController.text,
                                  //         ));
                                  //   });
                                }
                              },
                              style:
                                  ElevatedButton.styleFrom(primary: mainColor),
                              child: Text(
                                'Next',
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
              InkWell(
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
              InkWell(
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
    registerController.setProfileImagePath(pickedFile!.path);
    print(pickedFile);
  }
}

// for using personalInfoController
// createAccount(); //for testing purpose
// personalInfoController.isLoadingControl();
// Get.to(() => ChildInfoScreen(
// textEditingController:
// childNumController.text,
// userNameController:
// userNameController.text,
// ));
// } else {
// // createAccount(); //for testing purpose
// personalInfoController.isLoadingControl();
// Get.to(() => ChildInfoScreen(
// textEditingController:
// childNumController.text,
// userNameController:
// userNameController.text,
// // vehicleController: vehicleController.text,
// ));
