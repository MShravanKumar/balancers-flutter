import 'package:flutter/material.dart';
import 'package:balancers/custom/custom_card.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';

import '../../../custom/custom_divider.dart';

import '../../../utils/global_variables.dart';
import 'payment_screen.dart';

class CardsCategory extends StatefulWidget {
  final String labelTitle;
  final String title;
  final List<String> categoryItems;
  final Map<String, TextEditingController> controllers;

  final Map<String, List<String>> categories;

  const CardsCategory({
    super.key,
    required this.labelTitle,
    required this.categoryItems,
    required this.controllers,
    required this.categories,
    required this.title,
  });

  @override
  State<CardsCategory> createState() => _CardsCategoryState();
}

class _CardsCategoryState extends State<CardsCategory> {
  bool isAddDetails = false;

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
                color: ColorsUtil.textdisableClr, fontWeight: FontWeight.w500),
          ),
        ),
        CustomCard(
          isFixedHeight: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text(
                  widget.labelTitle,
                  style: TextStylesUtil.H2TextStyle.copyWith(
                    color: ColorsUtil.primaryblack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: CustomCard(
                  borderClr: Color(0xffC7C7C7),
                  height: 32,
                  width: 32,
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Center(
                    child: Image.asset(
                      'assets/Creditcard.png',
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
                trailing: TextButton(
                  child: Text(
                    'Add',
                    style: TextStylesUtil.H2TextStyle.copyWith(
                        color: ColorsUtil.primaryButnColor),
                  ),
                  onPressed: () {
                    setState(() {
                      isAddDetails = true;
                    });
                  },
                ),
              ),
              const MyCustomDivider(
                indent: 20,
                endIndent: 20,
                dividerColor: Color(0xffCCCCCC),
              ),
              if (isAddDetails)
                _buildCreditAddField(
                  'creditCard',
                  widget.controllers,
                ),
              heightSpaceBox(),
              Column(
                children: widget.categoryItems
                    .map((item) => _buildCardDetails(item, 'creditCard'))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCreditAddField(
    String category,
    Map<String, TextEditingController> controllers,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          TextField(
            controller: controllers[category]!,
            decoration: const InputDecoration(
              hintText: 'Enter card number',
              labelText: 'Card Number',
            ),
          ),
          heightSpaceBox(),
          TextField(
            controller: controllers['cardHolderName']!,
            decoration: const InputDecoration(
              hintText: 'Enter cardholder name',
              labelText: 'Cardholder Name',
            ),
          ),
          heightSpaceBox(),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controllers['expiryDate']!,
                  decoration: const InputDecoration(
                    hintText: 'MM/YY',
                    labelText: 'Expiry Date',
                  ),
                ),
              ),
              widthSpaceBox(),
              Expanded(
                child: TextField(
                  controller: controllers['cvv']!,
                  decoration: const InputDecoration(
                    hintText: 'CVV',
                    labelText: 'CVV',
                  ),
                ),
              ),
            ],
          ),
          heightSpaceBox(),
          ElevatedButton(
            onPressed: () {
              isAddDetails = false;

              setState(() {
                final cardDetails = {
                  'Number': controllers['creditCard']!.text,
                  'CardholderName': controllers['cardHolderName']!.text,
                  'ExpiryDate': controllers['expiryDate']!.text,
                  'CVV': controllers['cvv']!.text,
                };
                widget.categories['creditCard']!.add(cardDetails.toString());
                controllers['creditCard']!.clear();
              });
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildCardDetails(String item, String category) {
    return PaymentComponents.buildItem(
      context: context,
      item: item,
      category: category,
      removeItemCallback: () {
        setState(() {
          //write logic for drop down
        });
      },
    );
  }
}
