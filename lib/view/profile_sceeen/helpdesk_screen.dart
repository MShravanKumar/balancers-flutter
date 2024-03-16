import 'package:balancers/custom/navigation_appbar.dart';
import 'package:balancers/custom/Custom_searchfield.dart';
import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/custom_divider.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';

import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';

class SupportHelpDeskScreen extends StatefulWidget {
  final String title;
  const SupportHelpDeskScreen(this.title, {super.key});

  @override
  State<SupportHelpDeskScreen> createState() => _SupportHelpDeskScreenState();
}

class _SupportHelpDeskScreenState extends State<SupportHelpDeskScreen> {
  final List<String> helpTitles = [
    'Morem ipsum dolor sit amet,',
    'Morem ipsum dolor sit',
    'Morem ipsum dolor sit amet, consectetur.',
    'Morem ipsum dolor.',
  ];
  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    return Scaffold(
      appBar: NavigationAppBar(title: widget.title),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: padding,
              child: Text(
                'We’re here to help you with anything and everything on Balancers',
                style: TextStylesUtil.onBrdngTitleStyle.copyWith(fontSize: 24),
              ),
            ),
            heightSpaceBox(),
            Padding(
              padding: padding,
              child: Text(
                'Borem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                style: TextStylesUtil.H1TextStyle.copyWith(
                    fontWeight: FontWeight.w400),
              ),
            ),
            heightSpaceBox(),
            const MyCustomDivider(
              endIndent: 10,
              indent: 10,
              dividerColor: Colors.grey,
            ),
            heightSpaceBox(),
            CustomSearchField(searchmargin: padding, hintText: 'Search Help'),
            heightSpaceBox(),
            Padding(
              padding: padding,
              child: Text(
                'FAQ',
                style: TextStylesUtil.H1TextStyle.copyWith(
                    fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            heightSpaceBox(),
            const MyCustomDivider(
              dividerColor: Colors.grey,
            ),
            _buildHelpTopic(helpTitles),
            const MyCustomDivider(
              dividerColor: Colors.grey,
            ),
            heightSpaceBox(),
            const Text(
              'Still stuck? Help us a mail away',
              style: TextStylesUtil.H1TextStyle,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: padding,
              child: CustomButton(
                  color: ColorsUtil.primaryButnColor,
                  title: 'Send a message',
                  onTap: () {}),
            ),
            heightSpaceBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpTopic(helpTitles) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: helpTitles.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(helpTitles[index]),
                trailing: const Icon(Icons.add),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
