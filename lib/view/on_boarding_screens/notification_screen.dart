import 'dart:ui';
import 'package:flutter/material.dart';
import '../../utils/colors_const.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';
import '../../utils/textstyles_const.dart';
import '../../custom/custom_button.dart';
import '../../custom/login_steps_indicator.dart';
import 'location_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.onBoardingBgColor,
        body: Padding(
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginStepsIndicator(totalSteps: 5, currentStep: 3),
              const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    "Don’t miss any update",
                    style: TextStylesUtil.onBrdngTitleStyle,
                  ),
                  subtitle: Text(
                    'Get notified about your property maintenance updates, your vehicle maintenance updates, discounts, deals and many more.',
                    style: TextStylesUtil.H3TextStyle,
                  )),
              Spacer(),
              Image.asset(
                'assets/notificationsimg.png',
                width: 243,
                height: 228,
                fit: BoxFit.cover,
              ),
              Spacer(),
              CustomButton(
                color: ColorsUtil.primaryButnColor,
                title: 'Enable push notifications',
                onTap: () {
                  showNotificationDialog(context);
                },
              ),
              heightSpaceBox(),
              CustomButton(
                textcolor: ColorsUtil.primaryButnColor,
                color: const Color(0xffD0E0FF),
                title: 'Not now',
                onTap: () {
                  showNotificationDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> showNotificationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: const CustomDialog(),
      );
    },
  );
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(14);
    return Dialog(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(radius),
          color: Color(0xffFFFFFF),
        ),
        width: 270,
        height: 183,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            heightSpaceBox(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '"Balancers" Would Like to Send You Notifications',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            heightSpaceBox(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 44,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsUtil.borderColor),
                          color: ColorsUtil.cardcolor,
                          borderRadius:
                              const BorderRadius.only(bottomLeft: radius),
                        ),
                        child: Text(
                          "Don't Allow",
                          style: TextStylesUtil.H1TextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: const Color(
                                0xff666666,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LocationEnableScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 44,
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsUtil.primaryTxtColor),
                          color: ColorsUtil.primaryButnColor,
                          borderRadius:
                              const BorderRadius.only(bottomRight: radius),
                        ),
                        child: Text(
                          'Allow',
                          style: TextStylesUtil.H1TextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: const Color(
                                0xffffffff,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
