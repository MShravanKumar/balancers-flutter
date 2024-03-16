import 'dart:typed_data';

import 'package:balancers/auth_repository/auth_repository.dart';
import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/login_steps_indicator.dart';
import 'package:balancers/custom/profile_instur.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/platform_padding.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:balancers/view/on_boarding_screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/global_variables.dart';
import 'signup_screen.dart';

class SelectGender extends StatefulWidget {
  final String userName;
  final Uint8List? imageBytes;
  const SelectGender({
    Key? key,
    required this.userName,
    this.imageBytes,
  }) : super(key: key);

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final padding = getPlatformPadding(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.onBoardingBgColor,
        body: Padding(
          padding: padding,
          child: Column(
            children: [
              const LoginStepsIndicator(totalSteps: 5, currentStep: 2),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'What’s your gender?',
                  style: TextStylesUtil.onBrdngTitleStyle,
                ),
                subtitle: Text(
                  'Pick which best describes you.',
                  style: TextStylesUtil.H3TextStyle,
                ),
              ),
              heightSpaceBox(height: height * screenHeightPercentage),
              RadioButtonWidget(
                title: 'Male',
                value: 'male',
                selectedGender: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              RadioButtonWidget(
                title: 'Female',
                value: 'female',
                selectedGender: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              RadioButtonWidget(
                title: 'Nonbinary',
                value: 'nonbinary',
                selectedGender: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              Spacer(),
              profileInsturtion('This will be shown on your profile'),
              const SizedBox(
                height: 5,
              ),
              CustomButton(
                  icon: Icons.arrow_forward_rounded,
                  color: ColorsUtil.primaryButnColor,
                  title: 'CONTINUE',
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String? mobileNumber = prefs.getString("mobileNumber");
                    ByteData? byteData = widget.imageBytes?.buffer.asByteData();
                    // if (selectedGender != null) {
                    //   Map<String, dynamic> params = {
                    //     "first_name": widget.userName,
                    //     "last_name": "sh",
                    //     "date_of_birth": "1998-05-09",
                    //     "mobile_number": mobileNumber,
                    //     "gender": selectedGender,
                    //     "profile_photo": byteData,
                    //   };
                    //   Map result = await AuthRepository().createrUser(params);
                    //   if (result["user_exists"] == false) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                    //   }
                    // }
                  }),
              SizedBox(
                height: height * screenHeightPercentage,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton(String title, String value) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xfff6f6f6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStylesUtil.H1TextStyle,
          ),
          Radio(
            value: value,
            groupValue: selectedGender,
            onChanged: (String? newValue) {
              setState(() {
                selectedGender = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
