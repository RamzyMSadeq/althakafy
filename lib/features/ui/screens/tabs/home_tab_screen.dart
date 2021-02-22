import 'package:althaqafy/features/GetApp/app_get.dart';
import 'package:althaqafy/features/ui/screens/view_book_screen.dart';
import 'package:althaqafy/values/borders.dart';
import 'package:althaqafy/values/colors.dart';
import 'package:althaqafy/values/constant.dart';
import 'package:althaqafy/values/images_name.dart';
import 'package:althaqafy/values/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppGet controllerUserGet = Get.find();

    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(
        left: getHeightMedia(10, context),
        right: getHeightMedia(10, context),
        top: getHeightMedia(10, context),
      ),
      child: Column(
        children: [
          Container(
            height: getHeightMedia(200, context),
            width: double.infinity,
            decoration: BoxDecoration(
                color: orangeOpacityColor,
                image: DecorationImage(
                    image: AssetImage(slaiderImageName), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              child: Text(
                "جميع الكتب",
                style: getStyle(18, true, greenColor),
              )),
          SizedBox(
            height: getHeightMedia(10, context),
          ),
          Obx(() {
            return controllerUserGet.allBookData.value == null
                ? Container(
                    child: Expanded(
                        child: Center(
                    child: CircularProgressIndicator(),
                  )))
                : controllerUserGet.allBookData.value.isEmpty
                    ? Container(
                        child: Expanded(
                            child: Center(
                        child: Text("لا يوجد كتب"),
                      )))
                    : Container(
                        child: Expanded(
                            child: GridView.builder(
                          itemCount: controllerUserGet.allBookData.value.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .75,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              height: getWidthMedia(200, context),
                              width: getWidthMedia(160, context),
                              decoration: BoxDecoration(
                                borderRadius: borderRadius8,
                                border: Border.all(color: orangeOpacityColor),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: getWidthMedia(180, context),
                                    width: getWidthMedia(160, context),
                                    decoration: BoxDecoration(
                                        borderRadius: borderRadius8,
                                        border: Border.all(
                                            color: orangeOpacityColor),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                controllerUserGet.allBookData
                                                        .value[index]
                                                    ['_book_image_url']),
                                            fit: BoxFit.fill)),
                                  ),
                                  SizedBox(
                                    height: getHeightMedia(10, context),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(ViewBooksScreen(
                                            bookUrl: controllerUserGet
                                                .allBookData
                                                .value[index]['_book_url']
                                                .toString(),
                                            name: controllerUserGet.allBookData
                                                .value[index]['_book_name']
                                                .toString(),
                                          ));
                                        },
                                        child: Container(
                                          width: getWidthMedia(78, context),
                                          height: getHeightMedia(30, context),
                                          decoration: BoxDecoration(
                                              borderRadius: borderRadius8,
                                              border: Border.all(
                                                  color: orangeOpacityColor),
                                              color: orangeOpacityColor),
                                          child: Center(
                                            child: Text(
                                              "مشاهدة",
                                              style: getStyle(
                                                  12, false, whiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          String url = controllerUserGet
                                              .allBookData
                                              .value[index]['_book_url']
                                              .toString();
                                          if (await canLaunch(url)) {
                                            await launch(url);
                                          } else {}
                                        },
                                        child: Container(
                                          width: getWidthMedia(78, context),
                                          height: getHeightMedia(30, context),
                                          decoration: BoxDecoration(
                                              borderRadius: borderRadius8,
                                              border: Border.all(
                                                  color: orangeOpacityColor),
                                              color: greenColor),
                                          child: Center(
                                            child: Text(
                                              "تحميل",
                                              style: getStyle(
                                                  12, false, whiteColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                      );
          })
        ],
      ),
    );
  }
}
