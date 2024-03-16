import 'package:flutter/material.dart';
import '../utils/colors_const.dart';
import '../utils/global_variables.dart';

class CustomCard extends StatefulWidget {
  final String? text;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? color;
  final bool isFixedHeight;
  final Color? borderClr;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;

  CustomCard({
    Key? key,
    this.margin,
    this.padding,
    this.text,
    this.color,
    this.onTap,
    this.height,
    this.width,
    this.child,
    this.isFixedHeight = true,
    this.borderClr,
    this.borderRadius,
    this.boxShadow,
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: widget.margin,
        padding: widget.padding ?? const EdgeInsets.all(0.8),
        height: widget.isFixedHeight ? widget.height ?? 50 : null,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
            color: widget.color ?? ColorsUtil.cardcolor,
            borderRadius: widget.borderRadius ?? defaultRadius,
            boxShadow: widget.boxShadow,
            border: Border.all(
                width: 1, color: widget.borderClr ?? Color(0xffCCCCCC))),
        child: widget.child ??
            Center(
              child: Text(
                widget.text ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsUtil.primaryblack,
                ),
              ),
            ),
      ),
    );
  }
}
