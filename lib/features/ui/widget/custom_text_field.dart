import 'package:althaqafy/values/colors.dart';
import 'package:althaqafy/values/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CustomTextFiled extends StatefulWidget {
  final String title;
  final Function onSaved;
  final Function onValidate;
  bool isPassword = false;
  bool isLocation = false;
  bool isPrice = false;
  bool isDes;

  int maxLength;
  TextInputType keyboardType;
  String initialValue;
  FocusNode focaseNode;

  CustomTextFiled({
    this.title,
    this.onSaved,
    this.onValidate,
    this.isPassword = false,
    this.isLocation = false,
    this.isPrice = false,
    this.maxLength,
    this.keyboardType,
    this.initialValue,
    this.focaseNode,
    this.isDes = false
  });

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool isSecret = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeightMedia(50, context),
      // color: Colors.red,
      //alignment: Alignment.bottomRight,
      child: TextFormField(
        focusNode: widget.focaseNode,
        initialValue: widget.initialValue,
        keyboardType: widget.keyboardType,
        maxLines: widget.isDes  ==true ? 20: 1,
        
        onChanged: (value) {
          widget.onSaved(value);
        },
        obscureText: isSecret,
        decoration: InputDecoration(
          filled: true,
          fillColor: grayTextFielsColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          labelText: (widget.title).tr,
          border: new OutlineInputBorder(
              borderSide:
                  new BorderSide(color: const Color(0xFFE0E0E0), width: 0.1)),
          labelStyle: GoogleFonts.cairo(
            textStyle: TextStyle(
              fontSize: 16,
              color: blackColor,
            ),
          ),
        ),
        onSaved: (value) {
          // FocusScope.of(context).unfocus();
          widget.onSaved(value);
        },
        validator: (value) {
          // FocusScope.of(context).unfocus();
          return widget.onValidate(value);
        },
      ),
    );
  }
}
