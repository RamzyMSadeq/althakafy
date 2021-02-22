import 'package:althaqafy/features/repo/server.dart';
import 'package:althaqafy/values/colors.dart';
import 'package:althaqafy/values/custom_progress.dart';
import 'package:althaqafy/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppGet extends GetxController {
  var pr = ProgressDialogUtils.createProgressDialog(Get.context);

  int currentScreen1 = 1;
  int selectedIndex = 1;
  var allBookData = [].obs;
  var messageContact = {}.obs;
  var cVContact = {}.obs;



  setSelectedIndex(int value) {
    this.selectedIndex = value;
    update(['selectedIndex']);
  }

  getAllBooks() async {
    try {
      //  if (allHome.value.status == null) {
      List map = await Server.server.getAllBooks();
      allBookData.value = map;
      //update(['cart']);

      // } else {
      //   allHome.value = allHome.value;
      //   loadData(false);
      // }
    } catch (e) {
      print("ddddddddddddddd $e");
    }
  }

  //////////////////////////////////////////////////////////

  onSavedContactUs(GlobalKey<FormState> contactUsFormkey, String name,
      String email, String message) async {
    if (contactUsFormkey.currentState.validate()) {
      contactUsFormkey.currentState.save();
      // pr.show();
      pr.show();
      Map map = await Server.server.sendContactUs(name, email, message);
      
      pr.hide();
      print("+++++++++++++++++----------- ${map.runtimeType} , $map");
       if(map == null){
         Get.snackbar(
          '',
          '',
          messageText: Center(
            child: Text(
              'خطأ',
              style: getStyle(16, false, whiteColor),
            ),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          padding: EdgeInsets.only(top: 0, bottom: 5),
        );
       }else{
          messageContact.value = map;
           Get.snackbar(
          '',
          '',
          messageText: Center(
            child: Text(
              '${map['msg']}',
              style: getStyle(16, false, whiteColor),
            ),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          padding: EdgeInsets.only(top: 0, bottom: 5),
        );
       }
      
    } else {
      pr.hide();
    }
  }

   getAllAboutMe() async {
    try {
      //  if (allHome.value.status == null) {
      Map map = await Server.server.getAllAboutMe();
      cVContact.value = map;
      //update(['cart']);

      // } else {
      //   allHome.value = allHome.value;
      //   loadData(false);
      // }
    } catch (e) {
      print("ddddddddddddddd $e");
    }
  }
}
