import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/navigation_appbar.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';

class PaymentSucess extends StatelessWidget {
  const PaymentSucess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationAppBar(title: 'Payment  sucessful'),
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Thank you',
              style: TextStylesUtil.onBrdngTitleStyle.copyWith(fontSize: 40),
            ),
            Image.asset(
              'assets/payment_sucess.png',
              fit: BoxFit.fill,
            ),
            CustomButton(
                color: ColorsUtil.primaryButnColor,
                title: 'Continue',
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
