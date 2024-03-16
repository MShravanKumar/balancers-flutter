import 'package:balancers/utils/colors_const.dart';
import 'package:flutter/material.dart';
import '../utils/global_variables.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final Function(String)? onSubmitted;

  CustomOtpField({
    required this.length,
    this.onSubmitted,
  });

  @override
  _CustomOtpFieldState createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers =
        List.generate(widget.length, (index) => TextEditingController());
    focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double otpboxSize = 60;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.length,
        (index) => Container(
          margin: EdgeInsets.all(10),
          width: otpboxSize,
          height: otpboxSize,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            autofocus: index == 0,
            onChanged: (value) {
              if (value.isNotEmpty && index < widget.length - 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            onEditingComplete: () {
              String otp =
                  controllers.map((controller) => controller.text).join();
              widget.onSubmitted?.call(otp);
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: ColorsUtil.cardcolor,
              counterText: "",
              contentPadding: EdgeInsets.zero,
              focusedBorder: OutlineInputBorder(
                borderRadius: buttonRadius,
                borderSide: BorderSide(
                    color: ColorsUtil.primaryButnColor, width: borderWidth),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: feildbordercolor,
              ),
            ),
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
