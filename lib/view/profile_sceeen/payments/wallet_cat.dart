import 'package:balancers/custom/custom_card.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors_const.dart';
import '../../../utils/textstyles_const.dart';

import 'payment_screen.dart';

class WalletCategory extends StatefulWidget {
  final String title;
  final Map<String, List<String>> category;
  final List<String> categoryItems;

  const WalletCategory({
    Key? key,
    required this.title,
    required this.category,
    required this.categoryItems,
  }) : super(key: key);

  @override
  State<WalletCategory> createState() => _WalletCategoryState();
}

class _WalletCategoryState extends State<WalletCategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: TextStylesUtil.H2TextStyle.copyWith(
              color: ColorsUtil.textdisableClr,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CustomCard(
          isFixedHeight: false,
          child: Column(
            children: widget.categoryItems
                .map((item) => buildCardDetails(item, 'wallets'))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget buildCardDetails(String item, String category) {
    return PaymentComponents.buildItem(
      context: context,
      item: item,
      category: category,
      removeItemCallback: () {
        setState(() {
          //write for link logic
        });
      },
    );
  }
}
