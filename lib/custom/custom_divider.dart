import 'package:flutter/material.dart';

class MyCustomDivider extends StatelessWidget {
  final double? indent;
  final double? endIndent;
  final Color? dividerColor;
  final double? height;

  const MyCustomDivider(
      {super.key, this.indent, this.endIndent, this.dividerColor, this.height});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: height ?? 1,
      indent: indent ?? 0,
      endIndent: endIndent ?? 0,
      color: dividerColor ?? Color(0xffC6C6C6),
    );
  }
}
