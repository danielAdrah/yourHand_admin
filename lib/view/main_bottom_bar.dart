// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../theme.dart';
import '../controller/service_apllier.dart';
import 'services/services&serviceProvider.dart';
import 'settings_view.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  final TextEditingController serviceName = TextEditingController();
  List<Widget> screens = <Widget>[
    SettingsView(),
    Container(
        color: Colors
            .yellow), //this for the add button so the number of widgets the same as the labels
    ServiceAndServiceProvider(),
  ];
  int selectedTab = 0;
  void goToTab(index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.background,
        bottomNavigationBar: SizedBox(
          height: 95,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            iconSize: 40,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: ThemeColor.black.withOpacity(0.4),
            currentIndex: selectedTab,
            onTap: (index) {
              goToTab(index);
            },
            selectedItemColor: ThemeColor.primary,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'حسابي',
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    _showEditProfileDialog(context);
                  },
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ThemeColor.background,
                    child: Icon(
                      Icons.add,
                      color: Colors.pink,
                      size: 30,
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'الخدمات',
              ),
            ],
          ),
        ),
        body: screens[selectedTab]);
  }

//=======================================
  void _showEditProfileDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text(''),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "اختر نوع الخدمة التي تريد أضافتها ",
                      style: TextStyle(
                          color: ThemeColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        width: 240,
                        child: TextField(
                          textAlign: TextAlign.end,
                          controller: serviceName,
                          decoration: InputDecoration(
                            hintText: "نوع الخدمة",
                            hintStyle: TextStyle(color: ThemeColor.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ThemeColor.black,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ThemeColor.primary),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 18,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: TextField()),
                          SizedBox(width: 20),
                          Text(
                            ":السعر لكل ساعة",
                            style: TextStyle(
                                color: ThemeColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 18,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: TextField()),
                          SizedBox(width: 20),
                          Text(
                            ":السعر لكل يوم",
                            style: TextStyle(
                                color: ThemeColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('ألغاء'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('حفظ'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
