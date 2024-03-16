import 'package:balancers/utils/colors_const.dart';
import 'package:flutter/material.dart';
import '../utils/global_variables.dart';

class CustomSearchField extends StatelessWidget {
  final IconData? searchIcon;
  final IconData? micIcon;
  final String hintText;
  final InputBorder? outlinedBorder;
  final EdgeInsetsGeometry? searchmargin;

  CustomSearchField({
    Key? key,
    this.searchIcon,
    this.searchmargin,
    this.micIcon,
    required this.hintText,
    this.outlinedBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: searchmargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        // border: Border.all(width: 0.5),
        color: ColorsUtil.primaryBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                border: outlinedBorder ?? InputBorder.none,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search,
                color: Color.fromARGB(174, 144, 144, 151),
                size: defaultIconSize),
          ),
          Container(
            height: 30.0,
            width: 1.0,
            color: const Color(0xffAFAFAF),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.mic,
                size: defaultIconSize,
                color: Color.fromARGB(174, 154, 154, 158)),
          ),
        ],
      ),
    );
  }
}
