import 'dart:async';
import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/custom_card.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  List<String> slider = [
    'assets/banner.png',
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
    final padding = getPlatformPadding(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16.0),
                  height: 200,
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
                CustomStepperIndicator(
                  activeStep: _currentPage,
                  length: slider.length,
                  onTap: (index) {
                    setState(() {
                      _pageController.animateToPage(
                        _currentPage + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                ),
                heightSpaceBox(height: 20),
                ServiceStatus(),
                heightSpaceBox(),
                const AddCard(),
                heightSpaceBox(),
                Padding(
                  padding: padding,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buy products',
                        style: TextStylesUtil.H1TextStyle,
                      ),
                      Text('see all')
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return QuickCategoryItem(
                        prices: '₹80${index + 1}',
                        title: 'Category ${index + 1}',
                        onTap: () {
                          setState(() {
                            _currentPage = index;
                            _pageController.animateToPage(
                              _currentPage,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: padding,
      child: Image.asset(
        height: height * 0.120,
        width: double.infinity,
        'assets/shopBanner.png',
        fit: BoxFit.fill,
      ),
    );
  }
}

class QuickCategoryItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final String prices;

  const QuickCategoryItem(
      {required this.title, required this.onTap, required this.prices});

  @override
  State<QuickCategoryItem> createState() => _QuickCategoryItemState();
}

class _QuickCategoryItemState extends State<QuickCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: 150,
      color: ColorsUtil.primaryBgColor,
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1, color: ColorsUtil.cardcolor),
      //   color: Colors.white,
      //   borderRadius: defaultRadius,
      // ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/shopping.png',
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.title,
                style: TextStylesUtil.H2TextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.prices,
                    style: TextStylesUtil.H1TextStyle,
                  ),
                  InkWell(
                      onTap: () {},
                      child: const Icon(Icons.arrow_forward_rounded)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomStepperIndicator extends StatefulWidget {
  final int length;
  int activeStep;
  final Function(int) onTap;

  CustomStepperIndicator({
    super.key,
    required this.activeStep,
    required this.length,
    required this.onTap,
  });

  @override
  State<CustomStepperIndicator> createState() => _CustomStepperIndicatorState();
}

class _CustomStepperIndicatorState extends State<CustomStepperIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) => GestureDetector(
          onTap: () {
            widget.onTap(index);
          },
          child: Container(
            width: widget.activeStep == index ? 40 : 7,
            height: widget.activeStep == index ? 20 : 7,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: widget.activeStep == index
                  ? const Color(0xff3C3939)
                  : ColorsUtil.cardcolor,
            ),
            child: widget.activeStep == index
                ? Center(
                    child: Text(
                      '${index + 1}/${widget.length}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

class ServiceStatus extends StatefulWidget {
  const ServiceStatus({Key? key}) : super(key: key);

  @override
  _ServiceStatusState createState() => _ServiceStatusState();
}

class _ServiceStatusState extends State<ServiceStatus> {
  bool isInService = false;
  int activeStep = 0;

  bool isEnable = false;

  void increaseProgress() {
    if (activeStep < 5) {
      setState(() => activeStep++);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffE0F0FF),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff00000017).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.info_outline,
                    size: 12,
                  ),
                ),
                Text(
                  'Next service in 3 days. Turn toggle to .',
                  style: TextStylesUtil.H1TextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w800),
                ),
                Text(
                  'online',
                  style: TextStylesUtil.H1TextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.green),
                )
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: defaultRadius,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          surfaceTintColor: ColorsUtil.primaryBgColor,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: defaultRadius,
                    child: Image.asset(
                      'assets/banner.png',
                    ),
                  ),
                  title: Text(
                    'Car Model Name',
                    style: TextStylesUtil.H1TextStyle.copyWith(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    'Plate Number: XYZ 123',
                    style: TextStyle(
                      color: Color(0xff888888),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontFamily: 'Figtree',
                    ),
                  ),
                  trailing: CustomToggleButton(),
                  isThreeLine: true,
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  visualDensity: VisualDensity.comfortable,
                  horizontalTitleGap: 8,
                  minVerticalPadding: 8,
                  minLeadingWidth: 32,
                ),
                heightSpaceBox(height: 30),
                Theme(
                  data: ThemeData(
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      primary: ColorsUtil.primaryBgColor,
                    ),
                  ),
                  child: EasyStepper(
                    disableScroll: true,
                    fitWidth: true,
                    unreachedStepBorderColor: ColorsUtil.cardcolor,
                    activeStep: activeStep,
                    lineStyle: const LineStyle(
                      lineLength: 80,
                      lineSpace: 0,
                      lineType: LineType.normal,
                      defaultLineColor: Color(0xffD9D9D9),
                      finishedLineColor: Color(0xff276DEF),
                      lineThickness: 1.5,
                      unreachedLineType: LineType.normal,
                    ),
                    activeStepTextColor: Colors.black87,
                    finishedStepTextColor: Colors.black87,
                    internalPadding: 0,
                    showLoadingAnimation: false,
                    stepRadius: 20,
                    showStepBorder: false,
                    steps: List.generate(
                      5,
                      (index) => EasyStep(
                        customStep: Container(
                          width: activeStep == index ? 50 : 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: activeStep >= index
                                ? activeStep == index
                                    ? Color(0xff276DEF)
                                    : Colors.blue
                                : Colors.white,
                            border: Border.all(
                              width: activeStep == index ? borderWidth : 0,
                              color: activeStep == index
                                  ? Colors.blue
                                  : Color(0xffD9D9D9),
                            ),
                          ),
                          child: activeStep == index
                              ? CircleAvatar(
                                  backgroundColor: ColorsUtil.primaryBgColor,
                                  radius: 25,
                                  child: Text(
                                    '${index + 1}/5',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    onStepReached: (index) =>
                        setState(() => activeStep = index),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Next Service',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff888888))),
                  subtitle: Text(
                    '24/12/2024',
                    style: TextStylesUtil.H1TextStyle.copyWith(
                        color: Color(0xff464646)),
                  ),
                  trailing: CustomButton(
                    padding: EdgeInsets.all(0),
                    width: 160,
                    height: 52,
                    color: ColorsUtil.primaryButnColor,
                    title: 'Reschedule',
                    onTap: () {},
                    leadingIcon: Icons.calendar_month_outlined,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomToggleButton extends StatefulWidget {
  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    final double width = 108;
    final double height = 50;
    return GestureDetector(
      onTap: () {
        setState(() {
          isToggled = !isToggled;
        });
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.5),
          color: isToggled ? Colors.green : Color(0xffEEEEEE),
          border: Border.all(
              width: 2,
              style: BorderStyle.solid,
              color: Color(0xffFFAEAEC0).withOpacity(0.2),
              strokeAlign: BorderSide.strokeAlignInside),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFAEAEC0).withOpacity(0.2),
              offset: Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              offset: Offset(-1, -1),
              blurRadius: 1,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: isToggled ? width / 1.6 : 5,
              child: Container(
                width: 33,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF0F0F3),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFAEAEC0).withOpacity(0.2),
                      offset: Offset(2, 2),
                      blurRadius: 3,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Color(0xffAEAEC0).withOpacity(0.7),
                      offset: Offset(0, 1),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(Icons.power_settings_new_outlined,
                    color: isToggled ? Colors.green : Colors.red),
              ),
            ),
            Text(
              isToggled ? 'In' : 'Out',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontFamily: 'Figtree',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFFDEDEDE)),
            )
          ],
        ),
      ),
    );
  }
}
