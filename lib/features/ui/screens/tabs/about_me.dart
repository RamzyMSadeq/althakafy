import 'package:althaqafy/features/GetApp/app_get.dart';
import 'package:althaqafy/values/colors.dart';
import 'package:althaqafy/values/constant.dart';
import 'package:althaqafy/values/images_name.dart';
import 'package:althaqafy/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutMeScreen extends StatelessWidget {
  AppGet controllerUserGet = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Obx(() {
          return controllerUserGet.cVContact.value == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  padding: EdgeInsets.only(
                    left: getWidthMedia(10, context),
                    right: getWidthMedia(10, context),
                    top: getHeightMedia(10, context),
                  ),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 100),
                      height: getHeightMedia(230, context),
                      width: getWidthMedia(100, context),
                      //color: greenColor,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(salemImageName),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: getHeightMedia(10, context),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "السيرة الشخصية للاستاذ.الدكتور / سالم الثقفي",
                        textAlign: TextAlign.center,
                        style: getStyle(13, true, greenColor),
                      ),
                    ),
                    SizedBox(
                      height: getHeightMedia(20, context),
                    ),
                    Container(
                      child:
                          Text("${controllerUserGet.cVContact.value['_cv']}"),
                    )
                  ],
                );
        }));
  }
}
