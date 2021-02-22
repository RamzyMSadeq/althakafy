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

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppGet controllerAppGet = Get.find();

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () async {
    //   await ApiTraderClient.apiTraderClient.addProducts();
    // });
    controllerAppGet.getAllBooks();
    controllerAppGet.getAllAboutMe();

    Timer(Duration(seconds: 5), () async {
      //  String language = await SPHelper.spHelper.getLanguage();
      //  bool isSeenOnBoarding = await SPHelper.spHelper.isSeenOnBoardingGet();

      // if (isSeenOnBoarding == false || isSeenOnBoarding == null) {
      //   Get.to(OnBoardingScreen());
      // } else {
      //     Get.to(ChooseUser());

      // }
      //   Get.to(SignInScreen());
      // } else {
      //   Get.to(HomeScreen());
      // }

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
                SizedBox(height: getHeightMedia(300, context),),
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
               Container(
              height: getHeightMedia(250, context),
              child: Align(
                   alignment: Alignment.bottomCenter,
                child: FadeInUp(
                      animate: true,
                      duration: Duration(seconds: 2),
                                  child: Text("جميع الحقوق محفوظة لدي وكالة شنان للدعاية والإعلان" ,
                   style: getStyle(10, true, grayBottomColor),),
                ),
              ),
            )

              
              ],
            )
          )),
    );
  }
}
