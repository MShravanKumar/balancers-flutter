import 'dart:io' show Platform;
import 'package:flutter/material.dart';

EdgeInsets getPlatformPadding(BuildContext context) {
  return EdgeInsets.symmetric(
    horizontal: Platform.isIOS ? 16.0 : 8.0,
    vertical: Platform.isIOS ? 20.0 : 16.0,
  );
}
