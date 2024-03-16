import 'dart:async';
import 'package:flutter/material.dart';
import '../../models/onboarding_model.dart';
import '../../utils/colors_const.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';
import '../../utils/textstyles_const.dart';
import '../../custom/custom_button.dart';
import '../../custom/custom_indicator.dart';
import '../../custom/login_steps_indicator.dart';
import 'signup_screens/signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
  });
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < onboardingData.length - 1) {
        _currentPage++;
      } else {
        timer.cancel();
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.onBoardingBgColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: padding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginStepsIndicator(totalSteps: 5, currentStep: 0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/onboardingimgs/welcome.png',
                      fit: BoxFit.cover,
                      height: 56,
                      width: 39,
                    ),
                  ),
                  Text(
                    "Welcome to Balancers",
                    style: TextStylesUtil.H1TextStyle.copyWith(
                        color: Color(0xff000000)),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(onboardingData[index].text,
                              style: TextStylesUtil.onBrdngTitleStyle),
                          subtitle: Text(
                            onboardingData[index].subtitle,
                            style: TextStylesUtil.H3TextStyle,
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            onboardingData[index].image,
                          ),
                        ),
                        heightSpaceBox(),
                      ],
                    );
                  },
                ),
              ),
              CursoulIndicator(
                length: onboardingData.length,
                ontap: () {
                  setState(() {
                    // _currentPage = index;

                    _pageController.animateToPage(
                      _currentPage,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                currentPage: _currentPage,
              ),
              heightSpaceBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        _pageController.dispose();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      color: ColorsUtil.primaryButnColor,
                      title: "LOGIN",
                    ),
                  ),
                  widthSpaceBox(),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        _pageController.dispose();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ccontext) => const SignUpScreen()));
                      },
                      color: ColorsUtil.primaryTxtColor,
                      title: "SIGN UP",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
