// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widgets/primary_button.dart';
import '../../common_widgets/textField.dart';
import '../../common_widgets/upper_logo.dart';
import '../../theme.dart';
import 'logIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  "إنشاء حساب",
                  style: TextStyle(
                      color: ThemeColor.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 15),
              FadeInDown(
                delay: Duration(milliseconds: 330),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: Column(
                    children: [
                      CustomTextField(
                        icon: Icon(Icons.person_3_outlined),
                        onIconPressed: () {},
                        title: "الاسم الاول",
                        controller: nameCont,
                        keyboardType: TextInputType.name,
                        obscureText: false,
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        icon: Icon(Icons.person_3_outlined),
                        onIconPressed: () {},
                        title: "الاسم الاخير",
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        obscureText: false,
                      ),
                      SizedBox(height: 10),
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
                      SizedBox(height: 10),
                      CustomTextField(
                        icon: Icon(Icons.lock_outline),
                        onIconPressed: () {},
                        title: "تأكيد كلمة المرور",
                        controller: TextEditingController(),
                        keyboardType: TextInputType.name,
                        obscureText: false,
                      ),
                      SizedBox(height: 30),
                      PrimaryButton(
                        height: 50,
                        width: 170,
                        text: 'إنشاء حساب',
                        onTap: () {
                          Get.to(LogIn());
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
    );
  }
}
