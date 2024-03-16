import 'package:balancers/models/my_automobiles_model.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';

import '../../custom/navigation_appbar.dart';
import '../../custom/custom_card.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';

class MyAutomobilesScreen extends StatefulWidget {
  final String title;

  const MyAutomobilesScreen(this.title, {Key? key}) : super(key: key);

  @override
  State<MyAutomobilesScreen> createState() => _MyAutomobilesScreenState();
}

class _MyAutomobilesScreenState extends State<MyAutomobilesScreen> {
  List<MyAutoMobiles> myAutoMobilesList = [];

  int? isCardSelected;
  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);

    return Scaffold(
      appBar: NavigationAppBar(title: widget.title),
      body: Padding(
        padding: padding.copyWith(left: 5, right: 5),
        child: Column(
          children: [
            CustomCard(
              onTap: () {
                // Add a new MyAutoMobiles instance to the list when "Add Car" is tapped
                setState(() {});
                myAutoMobilesList.add(const MyAutoMobiles(
                    carName: 'Kia Sonat',
                    carNum: 'TS 01 TQ 1234',
                    imagePath: 'assets/carimage.png'));
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widthSpaceBox(width: 20),
                    const Icon(
                      Icons.add_rounded,
                      size: 24,
                    ),
                    const SizedBox(width: 40),
                    Text(
                      'Add Car',
                      style: TextStylesUtil.H1TextStyle.copyWith(
                          color: const Color(0xff1A1A1A)),
                    )
                  ],
                ),
              ),
            ),
            myAutoMobilesList.isNotEmpty
                ? _buildCarList()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("Not found any vehicle"),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildCarList() {
    return Expanded(
      child: ListView.builder(
        itemCount: myAutoMobilesList.length,
        itemBuilder: (context, index) {
          MyAutoMobiles currentCar = myAutoMobilesList[index];

          return CustomCard(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 100,
            child: Center(
              child: ListTile(
                onTap: () {
                  setState(() {
                    isCardSelected = index;
                  });
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Image.asset(
                  currentCar.imagePath,
                  height: 96,
                ),
                title: Text(
                  currentCar.carName,
                  style: TextStylesUtil.H1TextStyle,
                ),
                subtitle: Text(
                  currentCar.carNum,
                  style: TextStylesUtil.H2TextStyle,
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: isCardSelected == index
                              ? Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                    color: ColorsUtil.primaryButnColor,
                                    borderRadius: defaultRadius,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: ColorsUtil.primaryBgColor,
                                    size: defaultIconSize,
                                  ))
                              : const CircleAvatar(
                                  backgroundColor: Color(0xffF6F6F6),
                                  radius: defaultIconSize,
                                  child: Icon(Icons.edit),
                                )),
                      Visibility(
                          visible: isCardSelected == index,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                myAutoMobilesList.removeAt(index);
                              });
                            },
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: defaultRadius),
                                child: const Icon(
                                  Icons.delete,
                                  size: defaultIconSize,
                                  color: Colors.red,
                                )),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
