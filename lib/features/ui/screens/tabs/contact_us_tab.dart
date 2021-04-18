import 'package:althaqafy/features/GetApp/app_get.dart';
import 'package:althaqafy/features/ui/widget/custom_text_field.dart';
import 'package:althaqafy/values/borders.dart';
import 'package:althaqafy/values/colors.dart';
import 'package:althaqafy/values/constant.dart';
import 'package:althaqafy/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class ContactUsTab extends StatefulWidget {
  @override
  _ContactUsTabState createState() => _ContactUsTabState();
}

class _ContactUsTabState extends State<ContactUsTab> {
  GlobalKey<FormState> contactUsFormkey =
      GlobalKey<FormState>(debugLabel: '_contactUsFormkey');

  String name;
  String email;
  String message;

  setName(String value) {
    this.name = value;
    setState(() {});
  }

  setEmail(String value) {
    this.email = value;
    setState(() {});
  }

  setMessage(String value) {
    this.message = value;
    setState(() {});
  }

  validateEmail(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'The field is required.';
    } else if (!GetUtils.isEmail(value)) {
      return 'الرجاء ادخال بريد الكتروني صحيح';
    }
  }

  validationName(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'The field is required.';
    }
  }

  validationMessage(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return 'The field is required.';
    }
  }

  @override
  Widget build(BuildContext context) {
    AppGet controllerUserGet = Get.find();

    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: getHeightMedia(240, context),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: borderRadius8,
                color: orangeOpacityColor,
                border: Border.all(color: greenColor, width: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "تواصل معنا",
                  style: getStyle(20, true, whiteColor),
                ),
                Text(
                  "أنشيء هذا المتجر لهدف نشر العلم الشرعي واستفادة طلبة العلم وغيرهم من الكتب والمراجع فيه كصدقة جارية عن د/ سالم بن علي الثقفي رحمه الله ، بشكل مجاني تماما لتحقيق الهدف من المتجر ودوام تواجده في عالم الانترنت ..",
                  textAlign: TextAlign.center,
                  style: getStyle(12, false, whiteColor),
                )
              ],
            ),
          ),
          SizedBox(
            height: getHeightMedia(10, context),
          ),
         Form(
           key: contactUsFormkey,
                    child: Column(
             children: [
                Text(
              "كن على تواصل معنا",
              style: getStyle(18, true, blackColor),
            ),
            SizedBox(
              height: getHeightMedia(10, context),
            ),
            Container(
              height: getHeightMedia(80, context),
              child: CustomTextFiled(
                title: "الإسم بالكامل",
                onSaved: setName,
                onValidate: validationName,
              ),
            ),
            // SizedBox(
            //   height: getHeightMedia(10, context),
            // ),
            Container(
              height: getHeightMedia(80, context),
              child: CustomTextFiled(
                title: "البريد الإلكتروني",
                onSaved: setEmail,
                onValidate: validateEmail,
              ),
            ),
            // SizedBox(
            //   height: getHeightMedia(10, context),
            // ),
            Container(
              height: getHeightMedia(100, context),
              child: CustomTextFiled(
                title: "رسالتك",
                isDes: true,
                onSaved: setMessage,
                onValidate: validationMessage,
              ),
            ),
            SizedBox(
              height: getHeightMedia(30, context),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                print("rrrrrrrrrrrrrrrrrrrrrr $name , $email  , $message");
                controllerUserGet.onSavedContactUs(
                    contactUsFormkey, name, email, message);
              },
              child: Container(
                height: getHeightMedia(50, context),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: borderRadius8, color: grayBottomColor),
                child: Center(
                  child: Text(
                    "ارسال",
                    style: getStyle(15, true, whiteColor),
                  ),
                ),
              ),
            )
             ],
           ),
         )
        ],
      ),
    );
  }
}
