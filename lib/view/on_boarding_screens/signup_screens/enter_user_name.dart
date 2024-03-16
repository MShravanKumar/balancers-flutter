import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/login_steps_indicator.dart';
import 'package:balancers/custom/profile_instur.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/platform_padding.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:balancers/view/on_boarding_screens/signup_screens/add_your_profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/global_variables.dart';

class EnterUserName extends StatefulWidget {
  const EnterUserName({Key? key}) : super(key: key);

  @override
  State<EnterUserName> createState() => _EnterUserNameState();
}

class _EnterUserNameState extends State<EnterUserName> {
  TextEditingController enterUserName = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final padding = getPlatformPadding(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsUtil.onBoardingBgColor,
        body: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginStepsIndicator(totalSteps: 5, currentStep: 2),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "What’s your first name?",
                  style: TextStylesUtil.onBrdngTitleStyle,
                ),
                subtitle: Text(
                  "You can change your name in settings later",
                  style: TextStylesUtil.H3TextStyle,
                ),
              ),
              const Text(
                "Enter Your Name",
                style: TextStylesUtil.H1TextStyle,
              ),
              heightSpaceBox(),
              Expanded(
                  child: TextFormField(
                      focusNode: focusNode,
                      controller: enterUserName,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        hintText: 'John Smith',
                        border: OutlineInputBorder(),
                        helperText: "(Note: Not someone like ShaRukh Khan)",
                      ),
                      validator: (value) {
                        return null;
                      })),
              Spacer(),
              profileInsturtion('This will be shown on your profile'),
              heightSpaceBox(height: 5),
              CustomButton(
                title: 'VERIFY NUMBER',
                color: ColorsUtil.primaryButnColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddYourProfilePhoto(userName: enterUserName.text),
                    ),
                  );
                },
                icon: Icons.arrow_forward_rounded,
              ),
              SizedBox(
                height: height * screenHeightPercentage,
              )
            ],
          ),
        ),
      ),
    );
  }
}
