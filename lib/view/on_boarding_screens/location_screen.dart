import 'package:balancers/main.dart';
import 'package:flutter/material.dart';
import '../../main_screen.dart';
import '../../utils/colors_const.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';
import '../../utils/textstyles_const.dart';
import '../../custom/custom_button.dart';
import '../../custom/login_steps_indicator.dart';
import 'add_car.dart';

class LocationEnableScreen extends StatefulWidget {
  const LocationEnableScreen({Key? key}) : super(key: key);

  @override
  State<LocationEnableScreen> createState() => _LocationEnableScreenState();
}

class _LocationEnableScreenState extends State<LocationEnableScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.onBoardingBgColor,
        body: Padding(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginStepsIndicator(totalSteps: 5, currentStep: 3),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Where are you?',
                  style: TextStylesUtil.onBrdngTitleStyle,
                ),
                subtitle: Text(
                  'You’ll need to enable your location in order to use this app.',
                  style: TextStylesUtil.H3TextStyle,
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/locationimg.png',
                height: 228,
                width: 226,
                fit: BoxFit.cover,
              ),
              Spacer(),
              CustomButton(
                color: ColorsUtil.primaryButnColor,
                title: 'Enable location',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
              ),
              heightSpaceBox(),
              CustomButton(
                textcolor: ColorsUtil.primaryButnColor,
                color: const Color(0xffD0E0FF),
                title: 'Not now',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AddCar()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
