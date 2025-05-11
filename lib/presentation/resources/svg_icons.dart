import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssets {
  static SvgPicture star = SvgPicture.asset(
    "assets/icons/star.svg",
    fit: BoxFit.contain,
  );

  static SvgPicture starFilled = SvgPicture.asset(
    "assets/icons/star-filled.svg",
    fit: BoxFit.contain,
  );
}
