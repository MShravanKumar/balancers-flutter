import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/custom_divider.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';
import '../../custom/navigation_appbar.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';
import 'bookings_screen.dart';
import 'edit_profile.dart';
import 'helpdesk_screen.dart';
import 'my_address.dart';
import 'my_automobil_scrn.dart';
import 'payments/payment_screen.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context);
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: NavigationAppBar(
        title: 'Your Account',
        actions: [
          InkWell(
            child: SizedBox(
              height: 28,
              width: 28,
              child: Image.asset(
                'assets/notification2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          widthSpaceBox(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                borderRadius: defaultRadius,
                elevation: 7.5,
                child: Container(
                  height: height * 0.400,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.qr_code_scanner_rounded,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.ios_share_rounded),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 50,
                        child: Image.asset(
                          'assets/userprofile.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text("C .Mohan Krishna",
                          style: TextStylesUtil.H1TextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000))),
                      const Text(
                        "12345678901",
                        style: TextStylesUtil.H2TextStyle,
                      ),
                      CustomButton(
                        width: width * 0.250,
                        height: 38,
                        color: const Color(0xffF2F2F2),
                        title: 'Edit Profile',
                        textStyle: TextStylesUtil.H2TextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff424242)),
                        textcolor: ColorsUtil.secondaryblack,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditProfile()));
                        },
                      ),
                      heightSpaceBox(),
                    ],
                  ),
                ),
              ),
              heightSpaceBox(height: 20),
              Material(
                shape: RoundedRectangleBorder(borderRadius: defaultRadius),
                elevation: 7.5,
                child: Container(
                  padding: padding,
                  height: height * 0.150,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Balance your place",
                              style: TextStylesUtil.H1TextStyle.copyWith(
                                  color: Color(0xff4D4D4D)),
                            ),
                            Text(
                              "Add your home or community to Balancers",
                              style: TextStylesUtil.H2TextStyle.copyWith(
                                  color: Color(0xff666666),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 91,
                        width: 122,
                        child: Image.asset(
                          'assets/balance.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              heightSpaceBox(height: 20),
              const MyCustomDivider(
                height: 2,
                indent: 10,
                endIndent: 10,
              ),
              heightSpaceBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "General",
                  style: TextStylesUtil.H1TextStyle.copyWith(
                      color: Colors.black45),
                ),
              ),
              heightSpaceBox(height: 20),
              const Genaralview(),
              heightSpaceBox(height: 30),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffCCCCCC)),
                    borderRadius: defaultRadius,
                  ),
                  child: ListTile(
                      leading: const Icon(Icons.logout_outlined),
                      title: Text(
                        'Logout',
                        style: TextStylesUtil.H2TextStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff4D4D4D),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class Genaralview extends StatefulWidget {
  const Genaralview({Key? key}) : super(key: key);

  @override
  State<Genaralview> createState() => _GenaralviewState();
}

class _GenaralviewState extends State<Genaralview> {
  final Map<String, IconData> genralItems = {
    'My Automobiles': Icons.directions_car_filled_outlined,
    'My Apartment': Icons.apartment,
    'My Address': Icons.location_city_outlined,
    'Payment': Icons.payment,
    'Your Bookings': Icons.face,
    'Help & Support': Icons.help,
  };

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffCCCCCC)),
        borderRadius: defaultRadius,
      ),
      height: height * 0.500,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          indent: 50,
          height: 10,
          color: Colors.black38,
        ),
        itemCount: genralItems.length,
        itemBuilder: (context, index) {
          final title = genralItems.keys.elementAt(index);
          final icon = genralItems[title];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListTile(
              leading: Icon(
                icon,
                color: Color(0xff4D4D4D),
              ),
              title: Text(
                title,
                style: TextStylesUtil.H2TextStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff4D4D4D),
                ),
              ),
              trailing: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    " ${index + 1}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: const Color(0xff4D4D4D),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    color: const Color(0xff4D4D4D),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _genarakItems(title),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  _genarakItems(String title) {
    switch (title) {
      case 'My Automobiles':
        return MyAutomobilesScreen(title);

      case 'My Apartment':
        break;
      case 'My Address':
        return MYAddress(title);

      case 'Payment':
        return PaymentScreen(title);
      case 'Your Bookings':
        return BookingsScreen(title);
      case 'Help & Support':
        return SupportHelpDeskScreen(title);
      default:
        return const SizedBox();
    }
  }
}
