import 'dart:ui';

import 'package:balancers/custom/custom_card.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';

import '../../custom/custom_button.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';
import '../profile_sceeen/payments/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

List<String> productBenefits = [
  'Dorem ipsum dolor sit amet',
  'Consectetur adipiscing elitadipiscing eli.',
  'Consectetur adipiscing elit.',
  'Dorem ipsum dolor ',
  'Consectetur adipiscing elitscing elit.',
  'Consectetur adipiscing elit.',
];

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            shape: RoundedRectangleBorder(borderRadius: defaultRadius),
            stretch: true,
            expandedHeight: height * 0.30,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: ColorsUtil.onBoardingBgColor,
                child: Center(child: Image.asset('assets/car.png')),
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(8),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD9D9D9),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(8),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD9D9D9),
                ),
                child: Icon(
                  Icons.favorite_border_outlined,
                  size: 20,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: defaultRadius,
                color: ColorsUtil.primaryBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    isThreeLine: true,
                    title: Text(
                      "Scratch Removal Buffing",
                      style: TextStylesUtil.H1TextStyle,
                    ),
                    subtitle: Text(
                      'A perfect shine and clean to your windshield',
                      style: TextStylesUtil.H2TextStyle,
                    ),
                    trailing: CustomCard(
                      height: 30,
                      width: 77,
                      borderRadius: buttonRadius,
                      borderClr: Color(0xffFFD789),
                      color: Color(0xffEBAE45),
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: Color(0xffFFC850),
                          ),
                          Text(
                            '4.5',
                            style: TextStylesUtil.H2TextStyle.copyWith(
                                color: ColorsUtil.primaryBgColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹ 1799",
                        style: TextStylesUtil.H3TextStyle.copyWith(
                            fontWeight: FontWeight.w700),
                      ),
                      CustomButton(
                        width: 100,
                        height: 40,
                        onTap: () {},
                        title: 'Add',
                        color: ColorsUtil.primaryButnColor,
                        border: Border.all(color: Color(0xffEAEAEA)),
                      ),
                    ],
                  ),
                  heightSpaceBox(height: 20),
                  Divider(),
                  Text(
                    "Benifits",
                    style: TextStylesUtil.H1TextStyle,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE9F0FD)),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: ListView.builder(
                      padding: padding,
                      shrinkWrap: true,
                      itemCount: productBenefits.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Icon(
                                Icons.circle,
                                size: 5,
                              ),
                            ),
                            Text(productBenefits[index],
                                style: TextStyle(fontSize: 16)),
                          ],
                        );
                      },
                    ),
                  ),
                  heightSpaceBox(height: 20),
                  Text(
                    'Customer Reviews (20)',
                    style: TextStylesUtil.H1TextStyle,
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, int index) =>
                          customersReviews(context, padding),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomCard(
        padding: EdgeInsets.all(8),
        height: 100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  "Subtotal",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff282828),
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "₹ 1799  ",
                  style: TextStylesUtil.H3TextStyle.copyWith(
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen('Payment'),
                  ),
                );
              },
              color: ColorsUtil.primaryButnColor,
              title: 'Product to cart',
              textStyle: TextStylesUtil.H1TextStyle.copyWith(
                  fontSize: 15, color: ColorsUtil.primaryBgColor),
              leadingIcon: Icons.shopping_bag_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

Widget customersReviews(BuildContext context, padding) {
  return CustomCard(
    margin: EdgeInsets.all(8),
    padding: padding,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/userprofile.png'),
                  ),
                  Expanded(
                    child: Text(
                      "Easy to buy",
                      style: TextStylesUtil.H1TextStyle,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  "data sahfhohsoi asif io ioaihioafh siiof hsohofashohfoi foiasioafahfaso oahfso fso hfsa ofshohi h oi hfif hf  fofohof ofa iofsfoofhfosofs o aof f ",
                  textAlign: TextAlign.center,
                  style: TextStylesUtil.H2TextStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('by ,mohan krishna'),
                  Text("2 days ago"),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
