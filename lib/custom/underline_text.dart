import 'package:balancers/utils/colors_const.dart';
import 'package:flutter/material.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final TextStyle fontstyles;
  final double underlineHeight;
  final TextStyle textStyle;
  final Color? underlineColor;
  final VoidCallback ontap;
  final double fontsize;

  const UnderlinedText({
    required this.text,
    this.underlineHeight = 2.0,
    this.textStyle = const TextStyle(fontSize: 16.0, color: Colors.black),
    this.underlineColor,
    required this.ontap,
    required this.fontstyles,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: ontap,
          child: RichText(
            text: TextSpan(text: text, style: fontstyles),
          ),
        ),
        //SizedBox(height: underlineHeight),
        DecoratedBox(
          decoration: BoxDecoration(
            color: underlineColor ?? ColorsUtil.primaryButnColor,
          ),
          child: SizedBox(
            height: underlineHeight,
            width: text.length * fontsize * 0.5,
          ),
        ),
      ],
    );
  }
}
