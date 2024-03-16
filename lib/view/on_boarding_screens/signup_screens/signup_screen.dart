import 'package:balancers/auth_repository/auth_repository.dart';
import 'package:balancers/view/on_boarding_screens/signup_screens/verify_mobile_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/colors_const.dart';
import '../../../utils/global_variables.dart';
import '../../../utils/platform_padding.dart';
import '../../../utils/textstyles_const.dart';
import '../../../custom/custom_button.dart';
import '../../../custom/login_steps_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController mNCtrl = TextEditingController();
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginStepsIndicator(totalSteps: 5, currentStep: 1),
                const ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      "What's your name",
                      style: TextStylesUtil.onBrdngTitleStyle,
                    ),
                    subtitle: Text(
                      "We protect our community by high-security systems from google",
                      style: TextStylesUtil.H3TextStyle,
                    )),
                Text(
                  "Enter Phone Number",
                  style: TextStylesUtil.H1TextStyle,
                ),
                heightSpaceBox(),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsUtil.primaryBgColor,
                    border: Border.all(color: ColorsUtil.txtfieldIconsClr),
                    borderRadius: buttonRadius,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          '+91',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: ColorsUtil.txtfieldIconsClr,
                          ),
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: ColorsUtil.txtfieldIconsClr,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: mNCtrl,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: 'Enter mobile number',
                          border: InputBorder.none,
                        ),
                        validator: (String? value) {
                          if (value?.length != 10) {
                            return 'Mobile Number must be of 10 digit';
                          } else {
                            return null;
                          }
                        },
                      )),
                    ],
                  ),
                ),
                Spacer(),
                CustomButton(
                  title: 'SEND OTP',
                  color: ColorsUtil.primaryButnColor,
                  onTap: () async {
                    // bool? isValid = _formKey.currentState?.validate();
                    // if (!isValid!) {
                    Map<String, dynamic> data = {"mobile_number": mNCtrl.text};
                    Map result = await AuthRepository().login(data);
                    if (result["success"] == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyMobileNumber(
                            mobileNumber: mNCtrl.text,
                            otp: result["otp"],
                            referenceId: result["reference_id"],
                          ),
                        ),
                      );
                    }
                    //   _formKey.currentState?.save();
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
      ),
    );
  }
}

class RadioButtonWidget extends StatefulWidget {
  final String title;
  final String value;
  final String selectedGender;
  final ValueChanged<String> onChanged;

  const RadioButtonWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.selectedGender,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: ColorsUtil.cardcolor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStylesUtil.H1TextStyle,
          ),
          Radio(
            value: widget.value,
            groupValue: widget.selectedGender,
            onChanged: (String? newValue) {
              setState(() {
                widget.onChanged(newValue!);
              });
            },
          ),
        ],
      ),
    );
  }
}
