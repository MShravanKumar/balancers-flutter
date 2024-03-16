import 'package:flutter/material.dart';
import '../utils/global_variables.dart';

class CustomBottomSheetHandel extends StatelessWidget {
  const CustomBottomSheetHandel({super.key, this.handlecolor});
  final Color? handlecolor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 5,
        width: 80,
        decoration: BoxDecoration(
          color: handlecolor ?? Color(0xff4E4E4E),
          borderRadius: defaultRadius,
        ),
      ),
    );
  }
}
