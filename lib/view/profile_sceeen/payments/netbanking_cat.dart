import 'package:balancers/custom/custom_card.dart';
import 'package:flutter/material.dart';

import '../../../custom/custom_divider.dart';
import '../../../utils/colors_const.dart';
import '../../../utils/global_variables.dart';
import '../../../utils/textstyles_const.dart';

import 'payment_screen.dart';

class NetBankingPaymentScreen extends StatefulWidget {
  final String title;

  final Map<String, List<String>> categories;
  final List<String> categoryItems;
  final Map<String, TextEditingController> controllers;
  const NetBankingPaymentScreen(
      {super.key,
      required this.title,
      required this.categoryItems,
      required this.controllers,
      required this.categories});

  @override
  _NetBankingPaymentScreenState createState() =>
      _NetBankingPaymentScreenState();
}

class _NetBankingPaymentScreenState extends State<NetBankingPaymentScreen> {
  String? selectedBank;

  bool isAddNetBank = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text(
                  widget.title,
                  style: TextStylesUtil.H2TextStyle.copyWith(
                    color: ColorsUtil.primaryblack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Image.asset(
                  'assets/Onlinebanking.png',
                  height: 16,
                  width: 16,
                ),
                trailing: TextButton(
                  child: Text(
                    'Add',
                    style: TextStylesUtil.H2TextStyle.copyWith(
                        color: ColorsUtil.primaryButnColor),
                  ),
                  onPressed: () {
                    setState(() {});
                    isAddNetBank = true;
                  },
                ),
              ),
              // const MyCustomDivider(
              //     endIndent: 20, indent: 20, dividerColor: Color(0xffCCCCCC)),
              if (isAddNetBank == true)
                _buildAddField(
                  'netBanking',
                  widget.controllers,
                ),
              heightSpaceBox(),
              Column(
                children: widget.categoryItems
                    .map((item) => buildCardDetails(item, 'netBanking'))
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
              isAddNetBank = false;
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
          //write for link logic
        });
      },
    );
  }

  // Widget buildBankRadioButtons() {
  //   List<String> bankList = ['Bank A', 'Bank B', 'Bank C', 'Bank D'];

  //   return Column(
  //     children: bankList.map<Widget>((String value) {
  //       return RadioListTile<String>(
  //         title: Text(value),
  //         value: value,
  //         groupValue: selectedBank,
  //         onChanged: (String? newValue) {
  //           setState(() {
  //             selectedBank = newValue;
  //           });
  //         },
  //       );
  //     }).toList(),
  //   );
  // }
}
