import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pic_kids/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                ' Welcome',
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
          child: Container(
              child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'pick kiDs',
                    style: TextStyle(
                      color: mainBlackColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 10, right: 10),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'User name',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Roboto',
                                  fontSize: 20),
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          child: TextFormField(
                            controller: passController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Roboto',
                                  fontSize: 20),
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
                        Row(
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                value: true,
                                activeColor: textColor,
                                checkColor: Colors.black,
                                onChanged: (bool? value) {},
                              ),
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                  color: mainBlackColor, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 44,
                          width: 194,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/dashboard');
                            },
                            style: ElevatedButton.styleFrom(primary: mainColor),
                            child: Text(
                              'Login',
                              style: TextStyle(color: mainBlackColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 231),
                child: Text(
                  "Forgot password",
                  style: TextStyle(color: forgotColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t Have and account?'),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/persnInfoScreen');
                      },
                      child: Text(
                        'Create account',
                        style: TextStyle(
                            color: cCaColor,
                            fontFamily: 'Roboto',
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
