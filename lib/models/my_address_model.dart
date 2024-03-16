import 'package:flutter/material.dart';

class MyAddressModel {
  final String workPlace;
  final String doorNum;
  final IconData icon;
  MyAddressModel({
    required this.doorNum,
    required this.icon,
    required this.workPlace,
  });
}
