import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  MyTextWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.fontWeight,
    required this.fontSize,
    this.overFlow,
    this.textAlign,
  }) : super(key: key);
  TextOverflow? overFlow;
  String text;
  Color textColor;
  FontWeight fontWeight;
  double fontSize;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      overflow: overFlow,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
