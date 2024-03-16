import 'dart:ui';
import 'package:balancers/custom/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/global_variables.dart';
import '../../subscription/Subscription_screen.dart';

class OrderConfrimedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Blur
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          // Order Confirmed Dialog
          Center(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF498019),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  heightSpaceBox(height: 20),
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 100,
                  ),
                  heightSpaceBox(height: 16),
                  Text(
                    'Order Confirmed!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  heightSpaceBox(),
                  Text(
                    'Thank you for your order. you will receive email confirmation shortly',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  heightSpaceBox(height: 16),
                  Text(
                    'Check the status of your order on the Order tracking page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  heightSpaceBox(height: 20),
                  CustomButton(
                      color: Color(0XFF346E01),
                      title: 'Return Home',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubscriptionScreen()));
                      }),
                  heightSpaceBox(height: 20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
