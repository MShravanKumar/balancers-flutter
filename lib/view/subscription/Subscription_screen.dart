import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/custom_card.dart';
import 'package:balancers/custom/underline_text.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';

import '../../custom/custom_bottomsheet_handel.dart';
import '../../utils/global_variables.dart';
import 'Quickwash.dart';
import 'car_serviecs_cart.dart';

//Color(0xff545454);
/////////replaced color for small text/////////replaced color for small text/////////replaced color for small text/////////replaced color for small text
class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "My vehicle",
              style: TextStylesUtil.H1TextStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return myVehicleCard(context);
                },
              ),
            ),
            TabBar(
              //  isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,

              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 5.0,
                  color: Color(0xff212121),
                ),
              ),

              unselectedLabelStyle: TextStylesUtil.H1TextStyle.copyWith(
                  color: ColorsUtil.borderColor),
              labelStyle:
                  TextStylesUtil.H1TextStyle.copyWith(color: Color(0xff212121)),
              tabs: [
                Tab(text: 'Subscription'),
                Tab(text: 'Quick Wash'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SubscriptionTab(),
                  QuickWashTab(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget myVehicleCard(context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      // height: MediaQuery.of(context).size.height * 2.65,
      width: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: ColorsUtil.primaryBgColor,
        boxShadow: [
          BoxShadow(
              color: Color(0xff00000017).withAlpha(9),
              blurRadius: 15,
              spreadRadius: 0,
              offset: Offset(2, 4))
        ],
        borderRadius: defaultRadius,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(child: Image.asset('assets/car.png', fit: BoxFit.fill)),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 20,
                    width: 49,
                    decoration: BoxDecoration(
                      color: Color(0xff212121),
                      borderRadius: defaultRadius,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.update,
                            size: 10, color: ColorsUtil.primaryBgColor),
                        Text(
                          '3d',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: ColorsUtil.primaryBgColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "Kia Seltos",
              style: TextStylesUtil.H1TextStyle,
            ),
            subtitle: Text(
              "TS 01 SE 1234",
              style: TextStylesUtil.H2TextStyle,
            ),
            trailing: Image.asset(
              'assets/qrcode.png',
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    ),
  );
}

class SubscriptionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'With our monthly plan, enjoy the luxury of',
              style: TextStylesUtil.H2TextStyle,
              children: [
                TextSpan(
                  text: ' 5 cleans per month.',
                  style: TextStylesUtil.H2TextStyle.copyWith(
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                    text:
                        'Say goodbye to dirty cars and hello to a consistently clean ride. Sign up now and experience the difference.',
                    style: TextStylesUtil.H2TextStyle),
              ],
            ),
          ),
          heightSpaceBox(height: 20),
          CustomButton(
              color: ColorsUtil.primaryButnColor,
              title: 'Choose Plan',
              onTap: () {
                _openBottomSheet(context);
              },
              leadingIcon: Icons.add_outlined),
          heightSpaceBox(),
          CustomButton(
              color: ColorsUtil.primaryBgColor,
              title: 'Start Trial',
              textcolor: ColorsUtil.primaryButnColor,
              onTap: () {},
              border: Border.all(
                color: ColorsUtil.primaryButnColor,
              ))
        ],
      ),
    );
  }
}

void _openBottomSheet(BuildContext context) {
  showModalBottomSheet(
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: ColorsUtil.primaryBgColor,
          borderRadius: BorderRadius.only(
            topLeft: defaultRadius.topLeft,
            topRight: defaultRadius.topRight,
          ),
        ),
        child: ChoosePlanSheet(),
      );
    },
  );
}

class ChoosePlanSheet extends StatefulWidget {
  const ChoosePlanSheet({super.key});

  @override
  State<ChoosePlanSheet> createState() => _ChoosePlanSheetState();
}

class _ChoosePlanSheetState extends State<ChoosePlanSheet> {
  List<String> planBenefits = [
    'Maecenas eget condimentum velit',
    'Lorem ipsum dolor sit amet',
    'Suspendisse ac rhoncus nisl, euft',
    'Suspendisse ac rhoncus nisl, euft',
    'Donec ut rhoncus ex. convallios',
    'diam sit amet lacinia aliqer tuiys',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomBottomSheetHandel(),
          Text(
            'Choose a Plan',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
          heightSpaceBox(height: 20),
          Text(
            'Select a plan based on your car',
            style: TextStylesUtil.H1TextStyle.copyWith(
                fontWeight: FontWeight.w700),
          ),
          heightSpaceBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: planBenefits.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Icon(
                          Icons.check_circle,
                          size: 20,
                          color: Colors.green,
                        ),
                      ),
                      Text(planBenefits[index],
                          textAlign: TextAlign.center,
                          style: TextStylesUtil.H2TextStyle),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectCartSeater(
                selectedItemId: '5 seater',
              ),
              SelectCartSeater(
                selectedItemId: '7 seater',
              ),
            ],
          ),
          heightSpaceBox(),
          CustomButton(
              color: ColorsUtil.primaryButnColor,
              title: 'Select Plan',
              onTap: () {
                Navigator.pop(context);
                _startFreeTrailSheet(context);
              }),
          heightSpaceBox(),
          UnderlinedText(
            text: 'Start Trial',
            ontap: () {},
            fontsize: 15,
            fontstyles: TextStylesUtil.H1TextStyle.copyWith(
                color: ColorsUtil.primaryButnColor),
          ),
          heightSpaceBox(),
        ],
      ),
    );
  }
}

class SelectCartSeater extends StatelessWidget {
  final String selectedItemId;

  const SelectCartSeater({required this.selectedItemId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 105,
          width: 153,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: ColorsUtil.primaryBgColor,
              border: Border.all(color: Colors.blue),
              borderRadius: buttonRadius,
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 0,
                    offset: Offset(2, 4),
                    color: Color(0xff00000017).withAlpha(9))
              ]),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/car.png',
              fit: BoxFit.fill,
              height: 105,
              width: 153,
            ),
            // if (selectedItemId.startsWith('Cars'))
            //   Text(
            //     'Selected Car Index: ${selectedItemId.replaceAll('Cars ', '')}',
            //     style: const TextStyle(fontSize: 16),
            //   ),
            widthSpaceBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedItemId,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

////start free trail;ll

void _startFreeTrailSheet(BuildContext context) {
  showModalBottomSheet(
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: ColorsUtil.primaryBgColor,
          borderRadius: BorderRadius.only(
            topLeft: defaultRadius.topLeft,
            topRight: defaultRadius.topRight,
          ),
        ),
        child: StartFreeTrail(),
      );
    },
  );
}

class StartFreeTrail extends StatefulWidget {
  const StartFreeTrail({super.key});

  @override
  State<StartFreeTrail> createState() => _StartFreeTrailState();
}

class _StartFreeTrailState extends State<StartFreeTrail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBottomSheetHandel(),
        Text(
          'StartFreeTrail',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
        Text(
          'Give your car the glow it deserves! Get the first wash for just ₹99. Unmatched quality, unbeatable price.',
          style: TextStylesUtil.H2TextStyle,
        ),
        Center(
          child: Image.asset(
            'assets/balance.png',
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
                color: ColorsUtil.primaryButnColor,
                title: 'Select Plan',
                onTap: () {
                  Navigator.pop(context);
                  _selectDateSheet(context);
                }),
            heightSpaceBox(),
            UnderlinedText(
              text: 'Start Trial',
              ontap: () {},
              fontsize: 15,
              fontstyles: TextStylesUtil.H1TextStyle.copyWith(
                  color: ColorsUtil.primaryButnColor),
            ),
          ],
        ),
        heightSpaceBox(),
      ],
    );
  }
}

//select date

void _selectDateSheet(BuildContext context) {
  showModalBottomSheet(
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: ColorsUtil.primaryBgColor,
          borderRadius: BorderRadius.only(
            topLeft: defaultRadius.topLeft,
            topRight: defaultRadius.topRight,
          ),
        ),
        child: SelectDate(),
      );
    },
  );
}

class SelectDate extends StatefulWidget {
  const SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime selectedDate = DateTime.now(); // Initial date

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
              color: ColorsUtil.primaryButnColor,
              title: 'Confirm Date',
              onTap: () {
                Navigator.pop(context);
                _carServiceCart(context);
              })
        ],
      ),
    );
  }
}

void _carServiceCart(BuildContext context) {
  showModalBottomSheet(
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: ColorsUtil.primaryBgColor,
          borderRadius: BorderRadius.only(
            topLeft: defaultRadius.topLeft,
            topRight: defaultRadius.topRight,
          ),
        ),
        child: CarServiceAddonsCart(),
      );
    },
  );
}
