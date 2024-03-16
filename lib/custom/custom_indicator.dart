import 'package:balancers/utils/colors_const.dart';
import 'package:flutter/material.dart';

class CursoulIndicator extends StatelessWidget {
  final Object currentPage;

  const CursoulIndicator(
      {super.key,
      required this.length,
      required this.ontap,
      required this.currentPage});
  final int length;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    const double containersize = 10;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => GestureDetector(
          onTap: ontap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            width: containersize,
            height: containersize,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsUtil.primaryTxtColor),
              shape: BoxShape.circle,
              color: (index == currentPage)
                  ? ColorsUtil.primaryTxtColor
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
