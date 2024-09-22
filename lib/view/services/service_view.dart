// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import '../../theme.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  String serviceName = "جليسة أطفال";
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
                //this list is for diplaying the services created by the admin
                //after he clicks the add button
                itemCount: 15,
                itemBuilder: (context, index) {
                  return FadeInDown(
                    delay: Duration(milliseconds: 200),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  //display a dialog to remove the service or not
                                  showPlatformDialog(
                                    context: context,
                                    builder: (context) => BasicDialogAlert(
                                      title: Text("هل تريد حذف هذه الخدمة؟ "),
                                      actions: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            BasicDialogAction(
                                              title: Text("نعم"),
                                              onPressed: () {
                                                //to remove the service
                                                Navigator.pop(context);
                                              },
                                            ),
                                            BasicDialogAction(
                                              title: Text("لا"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.cancel_outlined,
                                  size: 30,
                                  color: ThemeColor.primary,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  //the name of the service created by the admin
                                  Text(serviceName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(width: 8),
                                  Icon(
                                    CupertinoIcons.news,
                                    color: ThemeColor.primary,
                                    size: 40,
                                  ),
                                ],
                              ),
                            ],
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
