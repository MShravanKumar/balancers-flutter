import 'package:flutter/material.dart';
import 'package:balancers/custom/custom_card.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';

import '../../../custom/custom_divider.dart';
import '../../../utils/global_variables.dart';
import 'payment_screen.dart';

class UPICategory extends StatefulWidget {
  final String labelTitle;

  final List<String> categoryItems;
  final Map<String, TextEditingController> controllers;
  final String title;

  final Map<String, List<String>> categories;

  const UPICategory({
    super.key,
    required this.labelTitle,
    required this.categoryItems,
    required this.controllers,
    required this.categories,
    required this.title,
  });

  @override
  State<UPICategory> createState() => _UPICategoryState();
}

class _UPICategoryState extends State<UPICategory> {
  bool isAddUpi = false;

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
                      'assets/upi.png',
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
                    setState(() {});
                    isAddUpi = true;
                  },
                ),
              ),
              const MyCustomDivider(
                  endIndent: 20, indent: 20, dividerColor: Color(0xffCCCCCC)),
              if (isAddUpi)
                _buildAddField(
                  'upi',
                  widget.controllers,
                ),
              heightSpaceBox(),
              Column(
                children: widget.categoryItems
                    .map((item) => buildCardDetails(item, 'upi'))
                    .toList(),
              ),
              heightSpaceBox(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddField(
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
              hintText: 'Enter details',
            ),
          ),
          heightSpaceBox(),
          ElevatedButton(
            onPressed: () {
              widget.categories[category]!.add(controllers[category]!.text);
              controllers[category]!.clear();
              isAddUpi = false;
              setState(() {});
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget buildCardDetails(String item, String category) {
    return PaymentComponents.buildItem(
      context: context,
      item: item,
      category: category,
      removeItemCallback: () {
        setState(() {
          widget.categories[category]!.remove(item);
        });
      },
    );
  }
}
