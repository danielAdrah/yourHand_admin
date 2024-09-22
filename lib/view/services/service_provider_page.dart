// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:your_hand_admin/view/services/order_info_tile.dart';
import '../../theme.dart';

class ServiceProviderPage extends StatefulWidget {
  const ServiceProviderPage({super.key});

  @override
  State<ServiceProviderPage> createState() => _ServiceProviderPageState();
}

class _ServiceProviderPageState extends State<ServiceProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: FadeInDown(
              delay: Duration(milliseconds: 250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  ZoomIn(
                    delay: Duration(milliseconds: 350),
                    child: Image(
                      image: AssetImage("assets/img/logo.png"),
                      width: 160,
                      height: 160,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    // height: media.width * 1,
                    padding: const EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 20),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 15, right: 15, bottom: 15, left: 2.5),
                        decoration: BoxDecoration(
                          color: ThemeColor.primary.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            //here we will bring from the api the service that the mother ordered
                            //(the same service name that is displayed on the mother order tile)
                            ServiceProviderInfoTile(
                              title: " : الخدمة المقدمة",
                              value: "جليسة أطفال",
                            ),
                            SizedBox(height: 5),
                            // here will display the start date of the service
                            ServiceProviderInfoTile(
                              title: ": اسم مقدم الخدمة",
                              value: "داليا",
                            ),
                            SizedBox(height: 5),
                            ServiceProviderInfoTile(
                              title: ": الإيميل",
                              value: "www.dalia@gmail.com",
                            ),

                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    //this to cancel the order
                                    _cancelOrder(
                                      context,
                                      () {
                                        //here we will put the method that will cancel the
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 15),
                                    decoration: BoxDecoration(
                                        color:
                                            ThemeColor.primary.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: ThemeColor.primary
                                                .withOpacity(0.15))),
                                    child: Text(
                                      " رفض الطلب",
                                      style: TextStyle(
                                          color: ThemeColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () {
                                    //accept the service provider request
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 15),
                                    decoration: BoxDecoration(
                                        color:
                                            ThemeColor.primary.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: ThemeColor.primary
                                                .withOpacity(0.15))),
                                    child: Text(
                                      "قبول الطلب",
                                      style: TextStyle(
                                          color: ThemeColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _cancelOrder(BuildContext context, void Function() onPressed) async {
    await showPlatformDialog(
      context: context,
      builder: (context) => BasicDialogAlert(
        title: Center(child: Text("هل تريد رفض الطلب؟")),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicDialogAction(
                  title: Text(
                    "نعم",
                    style: TextStyle(color: ThemeColor.primary),
                  ),
                  onPressed: onPressed),
              BasicDialogAction(
                title: Text(
                  "لا",
                  style: TextStyle(color: ThemeColor.primary),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
