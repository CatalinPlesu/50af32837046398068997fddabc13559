import 'package:ebs_application/presentation/resources/app_colors.dart';
import 'package:ebs_application/presentation/resources/font_names.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle textStyleInter({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) => TextStyle(
    fontSize: fontSize ?? 12,
    color: color ?? Colors.black,
    fontFamily: FontNames.inter,
    fontWeight: fontWeight,
    height: height,
  );
}
