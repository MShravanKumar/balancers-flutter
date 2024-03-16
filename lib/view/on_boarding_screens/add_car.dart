import 'dart:convert';

import 'package:balancers/custom/profile_instur.dart';
import 'package:balancers/main_screen.dart';
import 'package:balancers/utils/global_variables.dart';
import 'package:balancers/view/on_boarding_screens/signup_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../custom/custom_button.dart';
import '../../custom/login_steps_indicator.dart';
import '../../utils/colors_const.dart';
import '../../utils/platform_padding.dart';
import '../../utils/textstyles_const.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsUtil.onBoardingBgColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: getPlatformPadding(context),
          child: Column(
            children: [
              LoginStepsIndicator(totalSteps: 5, currentStep: 4),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Add your Car?',
                  style: TextStylesUtil.onBrdngTitleStyle,
                ),
                subtitle: Text(
                  'Pick which best describes you.',
                  style: TextStylesUtil.H3TextStyle,
                ),
              ),
              RadioButtonWidget(
                title: 'Male',
                value: 'male',
                selectedGender: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              RadioButtonWidget(
                title: 'Female',
                value: 'female',
                selectedGender: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              RadioButtonWidget(
                title: 'Nonbinary',
                value: 'nonbinary',
                selectedGender: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              Spacer(),
              profileInsturtion('Vehicle will be added in your profile'),
              heightSpaceBox(),
              CustomButton(
                icon: Icons.arrow_forward_rounded,
                color: ColorsUtil.primaryButnColor,
                title: 'CONTINUE',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddServiceCar(),
                    ),
                  );
                },
              ),
              heightSpaceBox(height: 5),
              CustomButton(
                  color: Color(0xffEDEDED),
                  title: 'SKIP',
                  textStyle: TextStylesUtil.H1TextStyle.copyWith(
                      color: ColorsUtil.primaryTxtColor),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddServiceCar(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class AddServiceCar extends StatefulWidget {
  const AddServiceCar({super.key});

  @override
  State<AddServiceCar> createState() => _AddServiceCarState();
}

class _AddServiceCarState extends State<AddServiceCar> {
  String colorName = '';
  List<CarBrand> brands = [];
  String selectedBrand = '';
  String selectedModel = '';

  @override
  void initState() {
    super.initState();
    loadCarData();
  }

  Future<String> loadJsonData() async {
    return await rootBundle.loadString('assets/car.json');
  }

  Future<void> loadCarData() async {
    final jsonString = await loadJsonData();
    final jsonData = jsonDecode(jsonString);
    final carData = CarData.fromJson(jsonData);

    setState(() {
      brands = carData.brands;
      selectedBrand = brands.isNotEmpty ? brands[0].name : '';
      selectedModel = brands.isNotEmpty && brands[0].models.isNotEmpty
          ? brands[0].models[0]
          : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsUtil.onBoardingBgColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: getPlatformPadding(context),
          child: Column(
            children: [
              LoginStepsIndicator(totalSteps: 5, currentStep: 4),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Add your Car?',
                  style: TextStylesUtil.onBrdngTitleStyle,
                ),
                subtitle: Text(
                  'Your car will be added for service',
                  style: TextStylesUtil.H3TextStyle,
                ),
              ),
              _buildDropdownButton(),
              SizedBox(height: 20),
              _buildDropdownButtonModel(),
              Container(
                height: 60,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xfff6f6f6),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 139,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          colorName = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Color',
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              profileInsturtion('Vehicle will be added in your profile'),
              heightSpaceBox(),
              CustomButton(
                icon: Icons.arrow_forward_rounded,
                color: ColorsUtil.primaryButnColor,
                title: 'CONTINUE',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );
                },
              ),
              heightSpaceBox(height: 5),
              CustomButton(
                color: Color(0xffEDEDED),
                title: 'SKIP',
                textStyle: TextStylesUtil.H1TextStyle.copyWith(
                  color: ColorsUtil.primaryTxtColor,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButton() {
    return CustomDropdownButton(
      label: 'Select Brand',
      items: brands.map((brand) => brand.name).toList(),
      selectedItem: selectedBrand,
      onChanged: (value) {
        setState(() {
          selectedBrand = value;
          selectedModel =
              brands.firstWhere((brand) => brand.name == value).models.first;
        });
      },
    );
  }

  Widget _buildDropdownButtonModel() {
    final selectedBrandModels = brands
        .firstWhere(
          (brand) => brand.name == selectedBrand,
          orElse: () => CarBrand(name: '', models: []),
        )
        .models;

    return CustomDropdownButton(
      label: 'Select Model',
      items: selectedBrandModels,
      selectedItem: selectedModel,
      onChanged: (value) {
        setState(() {
          selectedModel = value;
        });
      },
    );
  }
}

class CarBrand {
  final String name;
  final List<String> models;

  CarBrand({
    required this.name,
    required this.models,
  });

  factory CarBrand.fromJson(Map<String, dynamic> json) {
    return CarBrand(
      name: json['name'],
      models: List<String>.from(json['models']),
    );
  }
}

class CarData {
  final List<CarBrand> brands;

  CarData({
    required this.brands,
  });

  factory CarData.fromJson(Map<String, dynamic> json) {
    List<CarBrand> brands = [];
    for (var brandJson in json['brands']) {
      brands.add(CarBrand.fromJson(brandJson));
    }

    return CarData(
      brands: brands,
    );
  }
}

class CustomDropdownButton extends StatefulWidget {
  final String label;
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String> onChanged;

  CustomDropdownButton({
    required this.label,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDropdownOpen = !isDropdownOpen;
        });
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xfff6f6f6),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            value: widget.selectedItem,
            items: widget.items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(item),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                isDropdownOpen = false;
                widget.onChanged(value!);
              });
            },
          ),
        ),
      ),
    );
  }
}
