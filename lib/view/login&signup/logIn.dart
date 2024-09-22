// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/textField.dart';
import '../../common_widgets/upper_logo.dart';
import '../../theme.dart';
import '../main_bottom_bar.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FadeInDown(
            delay: Duration(milliseconds: 300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInDown(
                    delay: Duration(milliseconds: 300),
                    child: UpperLogo(width: width, height: height)),
                SizedBox(height: height * 0.04),
                FadeInDown(
                  delay: Duration(milliseconds: 320),
                  child: Text(
                    "تسجيل دخول",
                    style: TextStyle(
                        color: ThemeColor.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: 50),
                FadeInDown(
                  delay: Duration(milliseconds: 330),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: Column(
                      children: [
                        CustomTextField(
                          icon: Icon(Icons.mail_outline),
                          onIconPressed: () {},
                          title: " البريد الإلكتروني",
                          controller: TextEditingController(),
                          keyboardType: TextInputType.name,
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          icon: Icon(Icons.lock_outline),
                          onIconPressed: () {},
                          title: "كلمة المرور",
                          controller: TextEditingController(),
                          keyboardType: TextInputType.name,
                          obscureText: false,
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: Text(
                                "انقر هنا",
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 25, 70, 107)
                                            .withOpacity(0.5),
                                    fontSize: 14),
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              "نسيت كلمة المرور ؟",
                              style: TextStyle(
                                  color: ThemeColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        PrimaryButton(
                          height: 60,
                          width: 180,
                          text: 'تسجيل الدخول',
                          onTap: () {
                            Get.to(MainNavBar());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
