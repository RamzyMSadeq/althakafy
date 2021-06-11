import 'package:althaqafy/features/GetApp/app_get.dart';
import 'package:althaqafy/values/borders.dart';
import 'package:althaqafy/values/colors.dart';
import 'package:althaqafy/values/constant.dart';
import 'package:althaqafy/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Donations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      AppGet controllerAppGet = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        centerTitle: true,
        title: Text("تبرع لجمعيات خيرية"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: getHeightMedia(30, context),
            ),
            Container(
              height: getHeightMedia(100, context),
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: orangeOpacityColor)),
              child: Center(
                child: Text(
                  "يمكنكم ايضا التبرع لجمعيات خيريه",
                  style: getStyle(16, true, grayBottomColor),
                ),
              ),
            ),
            SizedBox(
              height: getHeightMedia(30, context),
            ),
            Container(
                //height: getHeightMedia(450, context),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: borderRadius8,
                    color: orangeOpacityColor.withOpacity(.1)),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: controllerAppGet.allLocations.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: getHeightMedia(20, context),
                        ),
                        Text(
                          "${controllerAppGet.allLocations[index]['_name']}",
                          textAlign: TextAlign.center,
                          style: getStyle(13, false, blackColor),
                        ),
                        InkWell(
                          onTap: () async {
                            String url = "${controllerAppGet.allLocations[index]['_url']}";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {}
                          },
                          child: Text(
                            "الذهاب الي الجمعيه",
                            textAlign: TextAlign.center,
                            style: getStyle(13, false, greenColor),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  },
                )),
            Container(
              height: getHeightMedia(70, context),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "جميع الحقوق محفوظة لدي وكالة شنان للدعاية والإعلان",
                  style: getStyle(10, true, grayBottomColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
