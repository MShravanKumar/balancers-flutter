import 'package:balancers/utils/colors_const.dart';
import 'package:flutter/material.dart';
import '../utils/global_variables.dart';

class LoginStepsIndicator extends StatelessWidget {
  const LoginStepsIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
  }) : super(key: key);

  final int totalSteps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSteps, (index) {
          return Expanded(
            child: Container(
              height: 10.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: (index == currentStep)
                    ? ColorsUtil.primaryTxtColor
                    : const Color(0xffD9D9D9),
                borderRadius: defaultRadius,
              ),
            ),
          );
        }),
      ),
    );
  }
}
