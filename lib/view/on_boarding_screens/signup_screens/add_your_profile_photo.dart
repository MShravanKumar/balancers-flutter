import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/login_steps_indicator.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/platform_padding.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:balancers/view/on_boarding_screens/signup_screens/select_gender.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../custom/profile_instur.dart';
import '../../../utils/global_variables.dart';

class AddYourProfilePhoto extends StatefulWidget {
  final String userName;
  const AddYourProfilePhoto({Key? key, required this.userName})
      : super(key: key);

  @override
  State<AddYourProfilePhoto> createState() => _AddYourProfilePhotoState();
}

class _AddYourProfilePhotoState extends State<AddYourProfilePhoto> {
  Uint8List? _imageBytes;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.onBoardingBgColor,
        body: Container(
          height: height,
          width: width,
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const LoginStepsIndicator(totalSteps: 5, currentStep: 2),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "Add your Profile photo",
                  style: TextStylesUtil.onBrdngTitleStyle,
                ),
              ),
              Center(
                child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Color(0xffD9D9D9), borderRadius: defaultRadius),
                    child: _imageBytes == null
                        ? const Icon(
                            Icons.add_rounded,
                            color: ColorsUtil.primaryTxtColor,
                            size: 150,
                          )
                        : Image.memory(_imageBytes!)),
              ),
              SizedBox(
                height: height * screenHeightPercentage,
              ),
              Text(
                "Photo guidelines",
                style: TextStylesUtil.H1TextStyle,
              ),
              const SizedBox(
                height: 40,
                width: double.infinity,
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.check_circle_rounded,
                    color: ColorsUtil.primaryButnColor,
                    size: 15,
                  ),
                  title: Text(
                    "Make sure it's just you",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    "Note: Not someone like Shah Rukh Khan",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              SizedBox(
                height: height * screenHeightPercentage,
              ),
              SizedBox(
                height: height * 0.040,
                width: double.infinity,
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    Icons.check_circle_rounded,
                    color: ColorsUtil.primaryButnColor,
                    size: 15,
                  ),
                  title: Text(
                    "Blurry is bad",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const Spacer(),
              profileInsturtion('This will be shown on your profile'),
              const SizedBox(height: 5),
              CustomButton(
                title: _imageBytes == null ? 'ADD PHOTO' : "Continue",
                color: ColorsUtil.primaryButnColor,
                onTap: () {
                  if (_imageBytes == null) {
                    _getImageFromGallery();
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectGender(
                          userName: widget.userName,
                          imageBytes: _imageBytes,
                        ),
                      ),
                    );
                  }
                },
                icon: Icons.arrow_forward_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectGender(
                        userName: widget.userName,
                        imageBytes: _imageBytes,
                      ),
                    ),
                  );
                },
                child: CustomButton(
                    color: Color(0xffEDEDED),
                    height: height * 0.060,
                    width: double.infinity,
                    padding: const EdgeInsets.all(0.8),
                    title: "SKIP",
                    textStyle: TextStylesUtil.H1TextStyle.copyWith(
                        color: ColorsUtil.primaryTxtColor),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectGender(
                            userName: widget.userName,
                            imageBytes: _imageBytes,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
    } else {
      print('No image selected.');
    }
  }
}
