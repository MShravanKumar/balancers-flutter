import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:balancers/custom/custom_card.dart';
import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import '../../custom/Custom_searchfield.dart';
import '../../custom/underline_text.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';
import '../subscription/Subscription_screen.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  bool showAllItems = false;
  bool selectedCarBrand = false;
  bool registeredScreen = false;
  String selectedItemId = '';

  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "My Vehicle",
              style: TextStylesUtil.H1TextStyle,
            ),
            Center(
              child: SizedBox(
                height: 287,
                width: 283,
                child: Image.asset(
                  "assets/addvehicle.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text:
                        'Stop wasting time driving to the car wash and join the future of car maintenance. Tap our ',
                    style: TextStylesUtil.H2TextStyle,
                    children: [
                      TextSpan(
                          text: "'Add Vehicle'",
                          style: TextStylesUtil.H2TextStyle.copyWith(
                              fontWeight: FontWeight.w600)),
                      const TextSpan(
                        text: ' button, and let us handle the rest.',
                        style: TextStylesUtil.H2TextStyle,
                      )
                    ]),
              ),
            ),
            CustomButton(
              color: ColorsUtil.primaryButnColor,
              title: 'Add Vehicle',
              leadingIcon: Icons.add,
              onTap: () {
                showModalBottomSheet(
                  //showDragHandle: true,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return buildBottomSheetContent(setState);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheetContent(StateSetter setState) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: defaultRadius,
        color: ColorsUtil.primaryBgColor,
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      height: MediaQuery.of(context).size.height / 1.4,
      width: double.infinity,
      child: registeredScreen
          ? buildRegisteredScreen(setState)
          : buildTopBrandsOrCarsScreen(setState),
    );
  }

  Widget buildRegisteredScreen(StateSetter setState) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 5,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xff4E4E4E),
              borderRadius: buttonRadius,
            ),
          ),
        ),
        heightSpaceBox(height: 20),
        SizedBox(
          height: 200,
          child: Image.asset('assets/regestration.png'),
        ),
        heightSpaceBox(height: 20),
        RichText(
          text: TextSpan(
              text:
                  'To assist us in locating your vehicle, kindly provide us with the unique ',
              style: TextStylesUtil.H2TextStyle,
              children: [
                TextSpan(
                    text: "car registration number",
                    style: TextStylesUtil.H2TextStyle.copyWith(
                        fontWeight: FontWeight.w600)),
              ]),
        ),
        heightSpaceBox(height: 20),
        RichText(
          text: TextSpan(
              text: 'Enteryour ',
              style: TextStylesUtil.H2TextStyle,
              children: [
                TextSpan(
                    text: "car registration number",
                    style: TextStylesUtil.H2TextStyle.copyWith(
                        fontWeight: FontWeight.w600)),
              ]),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: SizedBox(
            height: 60,
            child: TextFormField(
              textAlign: TextAlign.center,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                hintText: "TSXXXXXXXX",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                return null;
              },
            ),
          ),
        ),
        CustomButton(
          color: ColorsUtil.primaryButnColor,
          title: 'Add car',
          icon: Icons.add,
          onTap: () {
            setState(() {
              registeredScreen = !registeredScreen;
              showAllItems = !showAllItems;
              selectedCarBrand = !selectedCarBrand;
            });
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SubscriptionScreen()));
          },
        ),
      ],
    );
  }

  Widget buildTopBrandsOrCarsScreen(StateSetter setState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 5,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xff4E4E4E),
              borderRadius: buttonRadius,
            ),
          ),
        ),
        heightSpaceBox(height: 20),
        CustomSearchField(
          hintText: 'Search Brand / Car',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                showAllItems
                    ? "Car Brand's"
                    : selectedCarBrand
                        ? "Top Brand's/$selectedItemId"
                        : "Top Brand's",
                style: TextStylesUtil.H1TextStyle,
              ),
              if (!selectedCarBrand)
                UnderlinedText(
                  text: "View more",
                  fontsize: 15,
                  ontap: () {
                    setState(() {
                      showAllItems = !showAllItems;
                    });
                  },
                  fontstyles: TextStylesUtil.H2TextStyle.copyWith(
                      color: ColorsUtil.secondaryblack,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  underlineColor: ColorsUtil.secondaryblack,
                ),
            ],
          ),
        ),
        if (!selectedCarBrand)
          showAllItems
              ? Expanded(flex: 4, child: buildTopBrandsGridView())
              : buildTopBrandsGridView(),
        const SizedBox(height: 5),
        if (!selectedCarBrand && !showAllItems)
          const Text(
            "Top Car's",
            style: TextStylesUtil.H1TextStyle,
          ),
        if (!selectedCarBrand && !showAllItems) buildTopCarsListView(),
        if (selectedCarBrand && showAllItems) buildBrandCarsListView(),
        heightSpaceBox(),
        if (selectedCarBrand && showAllItems)
          if (selectedItemId.isNotEmpty)
            SelectedItemDetail(selectedItemId: selectedItemId),
        Expanded(child: heightSpaceBox()),
        showAllItems
            ? buildContinueButton(setState)
            : CustomButton(
                color: ColorsUtil.primaryButnColor,
                title: 'Add Vehicle',
                leadingIcon: Icons.add,
                onTap: () {
                  setState(() {
                    showAllItems = !showAllItems;
                  });
                },
              ),
      ],
    );
  }

  Widget buildTopBrandsGridView() {
    return SizedBox(
      height: 90,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 0.0,
        ),
        itemCount: showAllItems ? 11 : 4,
        itemBuilder: (BuildContext context, int index) {
          return CustomCard(
            borderRadius: buttonRadius,
            margin: const EdgeInsets.all(4.0),
            height: 82,
            width: 82,
            text: 'Brand $index',
            onTap: () {
              setState(() {});
              selectedItemId = 'Brand$index';
            },
          );
        },
      ),
    );
  }

  Widget buildTopCarsListView() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return CustomCard(
            borderRadius: buttonRadius,
            margin: const EdgeInsets.all(4.0),
            height: 200,
            width: 286,
            text: 'Car $index',
            onTap: () {
              setState(() {});
              selectedItemId = 'Car$index';
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/car.png',
                  height: MediaQuery.of(context).size.height / 7,
                  width: double.maxFinite,
                ),
                Text(
                  'Car $index',
                  style: TextStylesUtil.H1TextStyle,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildBrandCarsListView() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return CustomCard(
            padding: EdgeInsets.all(0),
            borderRadius: buttonRadius,
            margin: EdgeInsets.all(5.0),
            height: 70,
            width: 70,
            // text: 'Cars $index',
            onTap: () {
              setState(() {});
              selectedItemId = 'Cars$index';
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.directions_car_outlined,
                  size: 30,
                ),
                Text('Cars$index ')
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildContinueButton(StateSetter setState) {
    return CustomButton(
      color: ColorsUtil.primaryButnColor,
      title: 'Continue',
      icon: Icons.arrow_forward_rounded,
      onTap: () {
        setState(() {
          if (!selectedCarBrand) {
            toggleScreen();
          } else {
            registeredScreen = !registeredScreen;
          }
        });
      },
    );
  }

  void toggleScreen() {
    setState(() {
      selectedCarBrand = true;
    });
  }
}

class SelectedItemDetail extends StatelessWidget {
  final String selectedItemId;

  const SelectedItemDetail({required this.selectedItemId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 138,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: buttonRadius,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/car.png'),
            // if (selectedItemId.startsWith('Cars'))
            //   Text(
            //     'Selected Car Index: ${selectedItemId.replaceAll('Cars ', '')}',
            //     style: const TextStyle(fontSize: 16),
            //   ),
            widthSpaceBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedItemId,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
