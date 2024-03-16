import 'package:flutter/material.dart';
import '../../custom/navigation_appbar.dart';
import '../../custom/custom_card.dart';
import '../../models/my_address_model.dart';
import '../../utils/colors_const.dart';
import '../../utils/global_variables.dart';
import '../../utils/platform_padding.dart';
import '../../utils/textstyles_const.dart';

class MYAddress extends StatefulWidget {
  final String title;

  const MYAddress(this.title, {super.key});

  @override
  State<MYAddress> createState() => _MYAddressState();
}

class _MYAddressState extends State<MYAddress> {
  List<MyAddressModel> myAddressList = [];

  int? isCardSelected;
  @override
  Widget build(BuildContext context) {
    final padding = getPlatformPadding(context).copyWith(right: 5, left: 5);

    return Scaffold(
      appBar: NavigationAppBar(title: widget.title),
      body: Padding(
        padding: padding,
        child: Column(
          children: [
            CustomCard(
              onTap: () {
                // Add a new MyAutoMobiles instance to the list when "Add Car" is tapped
                setState(() {});
                myAddressList.add(MyAddressModel(
                  workPlace: 'Home',
                  doorNum: '2-2-123 Durgam cheruvu, madhapur Hyderabad',
                  icon: Icons.home,
                ));
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
                      'Add Address',
                      style: TextStylesUtil.H1TextStyle.copyWith(
                          color: const Color(0xff1A1A1A)),
                    )
                  ],
                ),
              ),
            ),
            myAddressList.isNotEmpty
                ? _buildCarList()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Not found any address"),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildCarList() {
    return Expanded(
      child: ListView.builder(
        itemCount: myAddressList.length,
        itemBuilder: (context, index) {
          MyAddressModel currentaddress = myAddressList[index];

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
                contentPadding: const EdgeInsets.all(3),
                leading: Icon(
                  currentaddress.icon,
                  size: 30,
                ),
                title: Text(
                  currentaddress.workPlace,
                  style: TextStylesUtil.H1TextStyle,
                ),
                subtitle: Text(
                  currentaddress.doorNum,
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
                                    size: 20,
                                  ))
                              : const CircleAvatar(
                                  backgroundColor: Color(0xffF6F6F6),
                                  radius: 20,
                                  child: Icon(Icons.edit),
                                )),
                      Visibility(
                          visible: isCardSelected == index,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                myAddressList.removeAt(index);
                                ;
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
                                  size: 20,
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
