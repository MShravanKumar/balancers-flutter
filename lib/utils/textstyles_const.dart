import 'package:balancers/utils/colors_const.dart';
import 'package:flutter/material.dart';

class TextStylesUtil {
  static const TextStyle onBrdngTitleStyle = TextStyle(
    height: 43.94 / 36.62,
    color: Color(0xff000000),
    fontSize: 36.62,
    fontFamily: 'Figtree',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle H3TextStyle = TextStyle(
    color: ColorsUtil.primaryTxtColor,
    fontFamily: 'Figtree',
    fontSize: 23.44,
    height: 28.13 / 23.44,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle H1TextStyle = TextStyle(
    color: Color(0xff101115),
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    fontSize: 18.75,
    height: 22.5 / 18.75,
    fontFamily: 'Figtree',
  );

  static const TextStyle H2TextStyle = TextStyle(
    color: ColorsUtil.primaryTxtColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    fontFamily: 'Figtree',
  );
}
