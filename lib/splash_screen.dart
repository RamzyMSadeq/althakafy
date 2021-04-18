import 'dart:async';

import 'package:althaqafy/animate_do.dart';
import 'package:althaqafy/features/GetApp/app_get.dart';
import 'package:althaqafy/features/ui/screens/homeBage.dart';
import 'package:althaqafy/values/colors.dart';
import 'package:althaqafy/values/constant.dart';
import 'package:althaqafy/values/images_name.dart';
import 'package:althaqafy/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppGet controllerAppGet = Get.find();

  @override
  void initState() {
    super.initState();

    controllerAppGet.getAllBooks();
    controllerAppGet.getAllAboutMe();
    controllerAppGet.getAllLocations();

    Timer(Duration(seconds: 5), () async {
      Get.to(HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    var logoSplash;
    return SafeArea(
      child: Scaffold(
          backgroundColor: whiteColor,
          body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: getHeightMedia(300, context),
                  ),
                  SlideInUp(
                      animate: true,
                      from: 5,
                      duration: Duration(seconds: 1),
                      child: FadeInUp(
                          animate: true,
                          duration: Duration(seconds: 2),
                          child: Container(
                              height: getHeightMedia(150, context),
                              width: getWidthMedia(150, context),
                              child: SvgPicture.asset(logosplashSvgsName)))),
                  SizedBox(height: getHeightMedia(180, context)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FadeInUp(
                        animate: true,
                        duration: Duration(seconds: 2),
                        child: Column(
                          children: [
                            Text(
                              "جميع الحقوق محفوظة لدي وكالة شنان للدعاية والإعلان",
                              style: getStyle(10, true, grayBottomColor),
                            ),
                            SizedBox(
                              height: getHeightMedia(5, context),
                            ),
                            InkWell(
                              onTap: () async {
                                String url = "https://shannanadv.com";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {}
                              },
                              child: Container(
                                height: getHeightMedia(50, context),
                                width: getWidthMedia(150, context),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(shananImageName),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ))),
    );
  }
}
