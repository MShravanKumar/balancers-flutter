import 'dart:async';
import 'package:flutter/material.dart';
import '../../custom/custom_button.dart';
import '../../custom/custom_indicator.dart';
import '../../utils/colors_const.dart';
import '../../utils/global_variables.dart';
import '../../utils/textstyles_const.dart';

class QuickWashTab extends StatefulWidget {
  @override
  State<QuickWashTab> createState() => _QuickWashTabState();
}

class _QuickWashTabState extends State<QuickWashTab> {
  List<String> slider = [
    'assets/banner.png',
    'assets/banner.png',
    'assets/banner.png',
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Timer? _timer;

  double radius = 18;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < slider.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Unleash the power of a daily wash for just ',
              style: TextStylesUtil.H2TextStyle,
              children: [
                TextSpan(
                  text: '₹199 ',
                  style: TextStylesUtil.H2TextStyle.copyWith(
                      fontWeight: FontWeight.w700),
                ),
                TextSpan(
                    text: 'and drive with pride',
                    style: TextStylesUtil.H2TextStyle),
              ],
            ),
          ),
          heightSpaceBox(height: 20),
          CustomButton(
              color: ColorsUtil.primaryButnColor,
              title: 'Choose Plan',
              onTap: () {
                _showMonthlyPlanDialog(context);
              },
              leadingIcon: Icons.add_outlined),
        ],
      ),
    );
  }

  void _showMonthlyPlanDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              color: ColorsUtil.primaryBgColor,
              borderRadius: defaultRadius,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Choose Monthly Plan',
                  style: TextStylesUtil.H1TextStyle,
                ),
                SizedBox(
                  height: 100,
                  width: 150,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: CircleAvatar(
                          backgroundColor: Color(0XFFDBDBDB),
                          radius: 30,
                        ),
                      ),
                      Positioned(
                        left: 30,
                        child: CircleAvatar(
                          backgroundColor: Color(0XFFDBDBDB),
                          radius: 30,
                        ),
                      ),
                      Positioned(
                        left: 60,
                        child: CircleAvatar(
                          backgroundColor: Color(0XFFDBDBDB),
                          radius: 30,
                        ),
                      ),
                      Positioned(
                        left: 90,
                        child: CircleAvatar(
                          backgroundColor: Color(0XFFDBDBDB),
                          radius: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Morem ipsum dolor sit amet',
                  style: TextStylesUtil.H1TextStyle,
                ),
                Text(
                  'Vorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                  style: TextStylesUtil.H2TextStyle,
                ),
                CursoulIndicator(
                  length: slider.length,
                  ontap: () {
                    setState(() {
                      _pageController.animateToPage(
                        _currentPage,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                  currentPage: _currentPage,
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: slider.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: defaultRadius,
                        child: Image.asset(
                          slider[index],
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
                CustomButton(
                    color: ColorsUtil.primaryButnColor,
                    title: 'CONTINUE',
                    onTap: () {}),
                CustomButton(
                  color: ColorsUtil.primaryBgColor,
                  title: 'NO THANKS',
                  onTap: () {},
                  textcolor: ColorsUtil.primaryTxtColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
