import 'package:balancers/custom/navigation_appbar.dart';
import 'package:balancers/custom/Custom_searchfield.dart';
import 'package:balancers/custom/custom_card.dart';
import 'package:balancers/custom/custom_divider.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';

import '../../custom/custom_button.dart';
import '../../utils/platform_padding.dart';

class BookingsScreen extends StatefulWidget {
  final String title;
  const BookingsScreen(
    this.title, {
    super.key,
  });

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    return Scaffold(
      appBar: NavigationAppBar(title: widget.title),
      body: Padding(
        padding: padding,
        child: Column(
          children: [
            CustomSearchField(hintText: 'Search service or a product....'),
            bookingsList()
          ],
        ),
      ),
    );
  }
}

Widget bookingsList() {
  const value = Radius.circular(18);

  return Expanded(
    child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          padding: const EdgeInsets.all(0),
          color: ColorsUtil.primaryBgColor,
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 300,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: ColorsUtil.cardcolor,
                  borderRadius:
                      BorderRadius.only(topLeft: value, topRight: value),
                ),
                height: 100,
                child: ListTile(
                  isThreeLine: true,
                  leading: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(value)),
                    color: ColorsUtil.primaryBgColor,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(value),
                      child: Image.asset(
                        'assets/locationimg.png',
                        height: 70,
                        width: 70,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Basic service',
                        style: TextStylesUtil.H1TextStyle,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 25,
                        color: const Color(0xff206C1A),
                        child: const Text(
                          'Completed',
                          style: TextStyle(color: ColorsUtil.primaryBgColor),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Kia sonet"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Madhapur, Hyderabad"),
                          InkWell(
                            onTap: () {}, // Add your onTap logic
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Invoice',
                                  style: TextStyle(
                                      color: ColorsUtil.primaryButnColor),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: ColorsUtil.primaryButnColor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '3 X',
                            style: TextStylesUtil.H2TextStyle,
                          ),
                          Text(
                            ' Addons',
                            style: TextStylesUtil.H2TextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: DotWidget(
                        dashHeight: 2,
                        dashWidth: 10,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('20 Aug 2023 at 10:23AM'),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Text(
                            '₹ 199.00',
                            style: TextStylesUtil.H2TextStyle.copyWith(
                                color: ColorsUtil.primaryblack),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: MyCustomDivider(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(
                  textStyle:
                      TextStylesUtil.H2TextStyle.copyWith(color: Colors.white),
                  color: ColorsUtil.primaryButnColor,
                  title: 'Book again',
                  leadingIcon: Icons.replay_outlined,
                  iconSize: 20,
                  onTap: () {},
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

//dotted widget
class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = 400,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = ColorsUtil.cardcolor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
        (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(
            left: emptyWidth / 2,
          ),
        ),
      ),
    );
  }
}
