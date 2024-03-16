import 'dart:ui';
import 'package:balancers/custom/custom_card.dart';
import 'package:balancers/custom/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/custom_divider.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import '../../custom/custom_bottomsheet_handel.dart';
import '../../utils/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeMenuBottomSheet extends StatefulWidget {
  @override
  _HomeMenuBottomSheetState createState() => _HomeMenuBottomSheetState();
}

class _HomeMenuBottomSheetState extends State<HomeMenuBottomSheet> {
  final PageController _pageController = PageController();
  List<String> slider = [
    'assets/banner.png',
    'assets/banner.png',
    'assets/banner.png',
    'assets/banner.png',
  ];
  int _currentPage = 0;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double radius = 18;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.80,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: width * 0.05),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomBottomSheetHandel(
            handlecolor: Color(0xffBBBBBB),
          ),

          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/userprofile.png'),
            ),
            title: Text(
              'Hey, Mohan',
              style: TextStylesUtil.H1TextStyle.copyWith(
                  color: ColorsUtil.primaryBgColor),
            ),
            trailing: CustomButton(
              border: Border.all(color: Color(0xff444444)),
              width: 138,
              height: 38,
              color: Color(0xff353535),
              onTap: () {},
              title: 'Kia Seltos ',
              icon: Icons.keyboard_arrow_down_sharp,
              textStyle: TextStylesUtil.H2TextStyle.copyWith(
                  fontWeight: FontWeight.w600, color: Color(0xffD8D8D8)),
            ),
          ),
          heightSpaceBox(),
          MyCustomDivider(dividerColor: Color(0xff474747)),
          heightSpaceBox(),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            isThreeLine: true,
            title: Text(
              "Your personal guide\nfor maintenance",
              style: TextStyle(
                  color: Color(0xffD4D4D4),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
            subtitle: Text(
                'The data to discover which\nis the right way and how?',
                style: TextStylesUtil.H2TextStyle.copyWith(
                    color: Color(0xffBBBBBB))),
          ),
          heightSpaceBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Guide',
                  style: TextStylesUtil.H1TextStyle.copyWith(
                      color: Color(
                        0xffD4D4D4,
                      ),
                      fontWeight: FontWeight.w700)),
              Text('${1 / 8}', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 20),
          // Container(
          //   margin: EdgeInsets.all(16.0),
          //   height: height * 0.20,
          //   child: PageView.builder(
          //     controller: _pageController,
          //     itemCount: slider.length,
          //     onPageChanged: (index) {
          //       setState(() {
          //         _currentPage = index;
          //       });
          //     },
          //     itemBuilder: (context, index) {
          //       return CircleAvatar(radius: 30, backgroundColor: Colors.red);
          //     },
          //   ),
          // ),

          CarouselSlider.builder(
            itemCount: 10,
            options: CarouselOptions(
              viewportFraction: 0.35,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return BlurWidget(
                // isSelected: index == _currentIndex,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 160.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              'Item $index',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            height: 31,
                            width: 53,
                            decoration: BoxDecoration(
                                color: Color(0xffF7F7F8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Image.asset(
                                'assets/explore car.png',
                                height: 19,
                                width: 24,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //heightSpaceBox(),
                    Expanded(
                      child: Text(
                        'Hardwater Spots',
                        style: TextStylesUtil.H1TextStyle.copyWith(
                            color: Color(0xffFFFFFF)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          CursoulIndicator(length: 5, ontap: () {}, currentPage: 2),
          heightSpaceBox(),

          CustomButton(
            width: width * 0.35,
            color: Colors.black26,
            onTap: () {
              showBottomSheet2(context);
            },
            title: 'Explore',
            icon: Icons.arrow_forward,
          ),
        ],
      ),
    );
  }
}

class BlurWidget extends StatelessWidget {
  final Widget child;

  BlurWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: child,
          ),
        ),
      ),
    );
  }
}

void showBottomSheet2(BuildContext context) {
  Navigator.pop(context);
  showModalBottomSheet(
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return ExploreSheet(context);
    },
  );
}

Widget ExploreSheet(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    height: height * 0.90,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorsUtil.secondaryblack,
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(25.0),
        topRight: const Radius.circular(25.0),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomBottomSheetHandel(
          handlecolor: Color(0xffBBBBBB),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        showModalBottomSheet(
                          enableDrag: true,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return HomeMenuBottomSheet();
                          },
                        );
                      },
                      child: Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Color(0xffF7F7F8),
                        size: 30,
                      )),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.ios_share_outlined,
                        color: Color(0xffF7F7F8),
                        size: 30,
                      )),
                ],
              ),
              MyCustomDivider(dividerColor: Color(0xff474747)),
              Text(
                "Water fall model",
                style: TextStylesUtil.H3TextStyle.copyWith(
                    color: ColorsUtil.primaryBgColor,
                    fontWeight: FontWeight.w700),
              ),
              CustomCard(
                margin: EdgeInsets.symmetric(vertical: 8),
                height: height * 0.2,
                width: MediaQuery.of(context).size.width,
                color: ColorsUtil.borderColor,
                onTap: () {},
              ),
              heightSpaceBox(),
              Text(
                "Waterspots  can damage the paint and glass of your vehicle",
                style: TextStylesUtil.H1TextStyle.copyWith(
                    color: ColorsUtil.primaryBgColor),
              ),
              heightSpaceBox(),
              MyCustomDivider(
                dividerColor: ColorsUtil.borderColor,
              ),
              heightSpaceBox(),
              Text(
                "These deposits can be hard to remove and can also cause :",
                style: TextStylesUtil.H1TextStyle.copyWith(
                    color: ColorsUtil.primaryBgColor.withAlpha(70)),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomCard(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    color: Colors.blue, // Replace with your desired color
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  ),
                  Text(
                    'Corrosion',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStylesUtil.H1TextStyle.copyWith(
                        color: ColorsUtil.primaryBgColor),
                  )
                ],
              );
            },
          ),
        ),
        heightSpaceBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height * 0.060,
                  color: ColorsUtil.borderColor,
                  child: Center(
                    child: Text(
                      'OverView',
                      textAlign: TextAlign.center,
                      style: TextStylesUtil.H1TextStyle.copyWith(
                          color: ColorsUtil.primaryBgColor),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height * 0.060,
                  color: Colors.black26,
                  child: Center(
                    child: Text(
                      'Depth',
                      textAlign: TextAlign.center,
                      style: TextStylesUtil.H1TextStyle.copyWith(
                          color: ColorsUtil.primaryBgColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        heightSpaceBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height * 0.09,
                  color: ColorsUtil.borderColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_outlined,
                          color: ColorsUtil.primaryBgColor),
                      Text(
                        'Back',
                        style: TextStylesUtil.H1TextStyle.copyWith(
                            color: ColorsUtil.primaryBgColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height * 0.09,
                  color: Colors.black26,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: TextStylesUtil.H1TextStyle.copyWith(
                            color: ColorsUtil.primaryBgColor),
                      ),
                      Icon(Icons.arrow_forward,
                          color: ColorsUtil.primaryBgColor),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


// class WheelListView extends StatefulWidget {
//   const WheelListView({super.key});

//   @override
//   State<WheelListView> createState() => _WheelListViewState();
// }

// class _WheelListViewState extends State<WheelListView> {
//   // double itemHeight = 150.0;
//   // int itemCount = 100;
//   // int selected = 50;
//   // FixedExtentScrollController _scrollController =
//   //     FixedExtentScrollController(initialItem: 50);
//   final int _totalCount = 100;
//   final int _initValue = 50;
//   int _currentValue = 50;

//   final int _nTotalCount = 50;
//   final int _nInitValue = 10;
//   int _nCurrentValue = 10;

//   final int _cInitValue = 7;
//   int _cCurrentValue = 7;

//   final List<Map<String, String>> _countryList = [
//     {'flag': 'assets/car.png', 'name': 'Argentina'},
//     {'flag': 'assets/car.png', 'name': 'Australia'},
//     {'flag': 'assets/car.png', 'name': 'Brazil'},
//     {'flag': 'assets/car.png', 'name': 'Canada'},
//     {'flag': 'assets/car.png', 'name': 'Cuba'},
//     {'flag': 'assets/car.png', 'name': 'Hungary'},
//     {'flag': 'assets/car.png', 'name': 'Iceland'},
//     {'flag': 'assets/car.png', 'name': 'India'},
//     {'flag': 'assets/car.png', 'name': 'Monaco'},
//     {'flag': 'assets/car.png', 'name': 'South Africa'},
//     {'flag': 'assets/car.png', 'name': 'Ukraine'},
//     {'flag': 'assets/car.png', 'name': 'USA'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         WheelSlider.customWidget(
//           totalCount: _countryList.length,
//           initValue: _cInitValue,
//           isInfinite: false,
//           scrollPhysics: const BouncingScrollPhysics(),
//           children: List.generate(
//               _countryList.length,
//               (index) => CircleAvatar(
//                     radius: 100,
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           _countryList[index]['flag']!,
//                           fit: BoxFit.fill,
//                           scale: _cCurrentValue == index ? null : 1.3,
//                           color: _cCurrentValue == index
//                               ? Colors.transparent
//                               : Colors.white,
//                           colorBlendMode: BlendMode.color,
//                         ),
//                       ],
//                     ),
//                   )),
//           onValueChanged: (val) {
//             setState(() {
//               _cCurrentValue = val;
//             });
//           },
//           //hapticFeedbackType: HapticFeedbackType.vibrate,
//           showPointer: false,
//           itemSize: 200,
//         ),
//         Text(
//           _countryList[_cCurrentValue]['name'].toString(),
//           style: const TextStyle(
//             fontSize: 18.0,
//             height: 2.0,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
// }
