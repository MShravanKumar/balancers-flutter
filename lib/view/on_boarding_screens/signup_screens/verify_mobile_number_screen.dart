import 'package:balancers/auth_repository/auth_repository.dart';
import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/custom_otpfield.dart';
import 'package:balancers/custom/login_steps_indicator.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/platform_padding.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:balancers/view/on_boarding_screens/signup_screens/enter_user_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../custom/underline_text.dart';
import '../../../utils/global_variables.dart';

class VerifyMobileNumber extends StatefulWidget {
  final String referenceId;
  final String otp;
  final String mobileNumber;
  const VerifyMobileNumber({
    Key? key,
    required this.otp,
    required this.referenceId,
    required this.mobileNumber,
  }) : super(key: key);

  @override
  State<VerifyMobileNumber> createState() => _VerifyMobileNumberState();
}

class _VerifyMobileNumberState extends State<VerifyMobileNumber> {
  String otpView = "";
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
              const LoginStepsIndicator(totalSteps: 5, currentStep: 1),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "Verify your number",
                  style: TextStylesUtil.onBrdngTitleStyle,
                ),
                subtitle: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    "Enter the code we’ve sent by text to 1234567890",
                    style: TextStylesUtil.H3TextStyle,
                  ),
                  trailing: UnderlinedText(
                    fontsize: 25,
                    text: "Change",
                    ontap: () {},
                    fontstyles: TextStylesUtil.H2TextStyle.copyWith(
                        color: ColorsUtil.primaryButnColor,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                    underlineColor: ColorsUtil.primaryButnColor,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Enter OTP",
                  style: TextStylesUtil.H1TextStyle,
                ),
              ),
              CustomOtpField(
                length: 4,
                onSubmitted: (p0) {
                  otpView = p0;
                  setState(() {});
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Didn't receive code?",
                    style: TextStylesUtil.H2TextStyle,
                  ),
                  widthSpaceBox(),
                  UnderlinedText(
                    fontsize: 15,
                    text: "Request again",
                    ontap: () {},
                    fontstyles: TextStylesUtil.H2TextStyle.copyWith(
                        color: ColorsUtil.primaryButnColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    underlineColor: ColorsUtil.primaryButnColor,
                  ),
                ],
              ),
              Expanded(child: heightSpaceBox()),
              CustomButton(
                title: 'VERIFY NUMBER',
                color: ColorsUtil.primaryButnColor,
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  Map<String, dynamic> data = {
                    "reference_id": widget.referenceId,
                    "otp": "12345",
                    "mobile_number": widget.mobileNumber
                  };
                  Map result = await AuthRepository().verifyMobileNumber(data);
                  prefs.setString('mobileNumber', widget.mobileNumber);
                  // if (result["user_exists"] == false) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => EnterUserName()),
                  );
                  // } else if (result["user_exists"] == true) {
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => MainScreen()),
                  //   );
                  // }
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
