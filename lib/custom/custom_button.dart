import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';

import '../utils/global_variables.dart';

class CustomButton extends StatefulWidget {
  final IconData? icon;
  final IconData? leadingIcon;
  final double? iconSize;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Color? iconColor;
  const CustomButton({
    Key? key,
    required this.color,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
    this.icon,
    this.textcolor,
    this.leadingIcon,
    this.iconSize,
    this.textStyle,
    this.border,
    this.padding,
    this.iconColor,
  }) : super(key: key);
  final Color color;
  final Color? textcolor;
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Border? border;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height ?? 52,
        padding: widget.padding ?? EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: buttonRadius,
            border: widget.border),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.leadingIcon != null)
              Icon(
                widget.leadingIcon,
                size: widget.iconSize ?? defaultIconSize,
                color: widget.iconColor ?? ColorsUtil.primaryBgColor,
              ),
            widthSpaceBox(),
            Center(
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: widget.textStyle ??
                    TextStylesUtil.H1TextStyle.copyWith(
                        color: widget.textcolor ?? ColorsUtil.primaryBgColor),
              ),
            ),
            widthSpaceBox(),
            if (widget.icon != null)
              Icon(
                widget.icon,
                size: widget.iconSize ?? defaultIconSize,
                color: widget.iconColor ?? ColorsUtil.primaryBgColor,
              )
          ],
        ),
      ),
    );
  }
}
