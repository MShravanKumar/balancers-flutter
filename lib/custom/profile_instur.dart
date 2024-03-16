import 'package:flutter/material.dart';

import '../utils/textstyles_const.dart';

Widget profileInsturtion(String title) {
  return Row(
    children: [
      Image.asset(
        "assets/eyeicon.png",
        height: 10,
        width: 13,
      ),
      Text(
        title,
        style: TextStylesUtil.H2TextStyle,
        overflow: TextOverflow.fade,
      ),
    ],
  );
}
