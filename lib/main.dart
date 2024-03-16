import 'package:balancers/view/on_boarding_screens/splash_screen.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

void main() {
  if (Platform.isIOS) {
    return runApp(const MyAppIOS());
  } else if (Platform.isAndroid) {
    return runApp(const MyAppAndirod());
  }
}

class MyAppIOS extends StatelessWidget {
  const MyAppIOS({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Balancers',

      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
      //     background: ColorsUtil.primaryBgColor,
      //   ),
      // ),
      home: MyHomePage(),
    );
  }
}

class MyAppAndirod extends StatelessWidget {
  const MyAppAndirod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balancers',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          background: ColorsUtil.primaryBgColor,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}
