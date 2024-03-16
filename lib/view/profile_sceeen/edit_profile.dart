import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';

import '../../custom/navigation_appbar.dart';
import '../../custom/custom_button.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  String _selectedGender = 'Male'; // Default value

  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const NavigationAppBar(
        title: 'Your Profile',
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Image.asset(
                    'assets/userprofile.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsUtil.primaryButnColor,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 15,
                      color: ColorsUtil.primaryBgColor,
                    ),
                  ),
                ),
              ],
            ),
            _buildTextField('Name', _nameController),
            const SizedBox(height: 16),
            _buildPhoneNumberField('Phone Number', _phoneNumberController),
            const SizedBox(height: 16),
            _buildEmailField('Email ID', _emailController),
            const SizedBox(height: 16),
            _buildDatePicker('Birthday'),
            const SizedBox(height: 16),
            _buildGenderDropdown(),
            Expanded(child: SizedBox()),
            CustomButton(
              title: 'Update',
              color: ColorsUtil.primaryButnColor,
              onTap: () {
                if (_validateInputs()) {
                  // Perform the update logic
                }
              },
            ),
            heightSpaceBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _changePhoneNumber() {
    return TextButton(
      child: const Text("Change",
          style: TextStyle(color: ColorsUtil.primaryButnColor)),
      onPressed: () {
        //write code
      },
    );
  }

  Widget _addNewEmail() {
    return TextButton(
      child: const Text(
        'Add',
        style: TextStyle(color: ColorsUtil.primaryButnColor),
      ),
      onPressed: () {},
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      style: TextStylesUtil.H2TextStyle,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        alignLabelWithHint: true,
        labelText: label,
        labelStyle:
            TextStylesUtil.H2TextStyle.copyWith(color: Color(0xff999999)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsUtil.primaryButnColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffCCCCCC)),
        ),
      ),
      onChanged: (_) {
        _validateInputs();
      },
    );
  }

  Widget _buildPhoneNumberField(
      String label, TextEditingController controller) {
    return TextFormField(
      style: TextStylesUtil.H2TextStyle,
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        suffixIcon: _changePhoneNumber(),
        labelText: label,
        labelStyle:
            TextStylesUtil.H2TextStyle.copyWith(color: Color(0xff999999)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsUtil.primaryButnColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffCCCCCC)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        } else {
          return 'Please enter a valid 10-digit phone number';
        }
      },
      onChanged: (_) {
        _validateInputs();
      },
    );
  }

  Widget _buildEmailField(String label, TextEditingController controller) {
    return TextFormField(
      style: TextStylesUtil.H2TextStyle,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        suffixIcon: _addNewEmail(),
        labelText: label,
        labelStyle:
            TextStylesUtil.H2TextStyle.copyWith(color: Color(0xff999999)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsUtil.primaryButnColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffCCCCCC)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        } else {
          return 'Please enter a valid Gmail address';
        }
      },
      onChanged: (_) {
        _validateInputs();
      },
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedGender,
      iconDisabledColor: Colors.transparent,
      iconEnabledColor: Colors.transparent,
      items: ['Male', 'Female', 'Other']
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedGender = newValue;
          });
        }
      },
      style: TextStyle(
          fontSize: 18,
          color: Color(0xff4D4D4D),
          fontFamily: 'Figtree',
          height: 18 / 18,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        label: Text('Gender'),
        labelStyle:
            TextStylesUtil.H2TextStyle.copyWith(color: Color(0xff999999)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffCCCCCC)),
        ),
      ),
    );
  }

  Widget _buildDatePicker(String label) {
    return TextField(
      controller: _birthdayController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        labelText: label,
        labelStyle:
            TextStylesUtil.H2TextStyle.copyWith(color: Color(0xff999999)),
        hintText: 'DD/MM/YYYY',
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsUtil.primaryButnColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffCCCCCC)),
        ),
      ),
      keyboardType: TextInputType.number,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter your date';
      //   }

      //   return null;
      // },
      onChanged: (value) {
        if (value.length == 2 || value.length == 5) {
          _birthdayController.text = '$value/';
          _birthdayController.selection = TextSelection.fromPosition(
              TextPosition(offset: value.length + 1));
        }
        _validateInputs();
      },
    );
  }

  bool _validateInputs() {
    if (_nameController.text.isEmpty) {
      // Show error or handle accordingly
      return false;
    }

    return true;
  }
}
