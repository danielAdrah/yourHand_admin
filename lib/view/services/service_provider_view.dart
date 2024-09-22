// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:your_hand_admin/view/services/service_provider_page.dart';

import '../../theme.dart';

class ServiceProviderView extends StatefulWidget {
  const ServiceProviderView({super.key});

  @override
  State<ServiceProviderView> createState() => _ServiceProviderViewState();
}

class _ServiceProviderViewState extends State<ServiceProviderView> {
  String serviceProviderName = "داليا";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          SizedBox(
            height: height,
            child: ListView.builder(
                //this list is for diplaying the service providers those has an account

                itemCount: 15,
                itemBuilder: (context, index) {
                  return FadeInDown(
                    delay: Duration(milliseconds: 200),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              //take me to the service provider page
                              Get.to(ServiceProviderPage());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 25,
                                  color: ThemeColor.primary,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    //the name of the service provider
                                    Text("مقدم الخدمة ${serviceProviderName}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.accessibility_new_outlined,
                                      color: ThemeColor.primary,
                                      size: 40,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                              color: ThemeColor.black.withOpacity(0.2),
                              indent: 50,
                              endIndent: 50),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
