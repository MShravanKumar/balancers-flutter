import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';
import '../../custom/custom_bottomsheet_handel.dart';
import '../../utils/colors_const.dart';
import '../../utils/global_variables.dart';
import '../shop_screens/cart.dart';

class CarServiceAddonsCart extends StatefulWidget {
  const CarServiceAddonsCart({super.key});

  @override
  State<CarServiceAddonsCart> createState() => _CarServiceAddonsCartState();
}

class _CarServiceAddonsCartState extends State<CarServiceAddonsCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomBottomSheetHandel(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add-ons',
                style: TextStylesUtil.H1TextStyle,
              ),
              InkWell(
                child: Text('Skip'),
                onTap: () {},
              )
            ],
          ),
          CarServiceCard(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
                color: ColorsUtil.primaryButnColor,
                title: 'CONTINUE',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectLocation()));
                }),
          )
        ],
      ),
    );
  }
}

Widget CarServiceCard(BuildContext context) {
  return Expanded(
    child: ListView.builder(
        itemBuilder: (context, int index) => Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),

              //height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: buttonRadius,
                border: Border.all(color: ColorsUtil.borderColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    leading: Container(
                      height: 92,
                      width: 92,
                      decoration: BoxDecoration(
                        borderRadius: buttonRadius,
                      ),
                      child: Image.asset(
                        'assets/banner.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text('Scratch Removal Buffing'),
                    subtitle: ListTile(
                      title: Text('data'),
                      subtitle: Text('data'),
                      trailing: CustomButton(
                        padding: EdgeInsets.all(0),
                        border: Border.all(color: ColorsUtil.primaryButnColor),
                        height: 32,
                        width: 86,
                        color: Colors.transparent,
                        title: 'Add',
                        textcolor: ColorsUtil.primaryButnColor,
                        iconColor: ColorsUtil.primaryButnColor,
                        onTap: () {},
                        leadingIcon: Icons.add_outlined,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xffE9F0FD),
                  ),
                  Text(
                    'Benefits',
                    style: TextStylesUtil.H1TextStyle,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildBulletListItem(),
                      GestureDetector(
                        onTap: () {
                          _CarRepairDetaiils(context);
                        },
                        child: Text(
                          'View Details',
                          style: TextStylesUtil.H2TextStyle.copyWith(
                              color: ColorsUtil.primaryButnColor,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
  );
}

Widget buildBulletListItem() {
  return Expanded(
    child: Container(
      height: 50,
      width: 250,
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, int index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.circle_rounded,
                  size: 5,
                  color: ColorsUtil.borderColor,
                ),
                widthSpaceBox(),
                Text(
                  'Dorem ipsum dolor sit amet',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStylesUtil.H2TextStyle,
                ),
              ],
            );
          }),
    ),
  );
}

// class ShoppingCart extends StatefulWidget {
//   @override
//   _ShoppingCartState createState() => _ShoppingCartState();
// }

// class _ShoppingCartState extends State<ShoppingCart> {
//   int itemCount = 0;

//   void addItem() {
//     setState(() {
//       itemCount++;
//     });
//   }

//   void removeItem() {
//     if (itemCount > 0) {
//       setState(() {
//         itemCount--;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 86,
//       height: 32,
//       padding: EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: addItem,
//             child: Icon(Icons.add),
//           ),
//           Text('data'),
//           ElevatedButton(
//             onPressed: removeItem,
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

void _CarRepairDetaiils(BuildContext context) {
  Navigator.pop(context);
  showModalBottomSheet(
    enableDrag: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return RepairDetails();
    },
  );
}

class RepairDetails extends StatefulWidget {
  const RepairDetails({super.key});

  @override
  State<RepairDetails> createState() => _RepairDetailsState();
}

class _RepairDetailsState extends State<RepairDetails> {
  List<String> repairBenefits = [
    ' Dorem ipsum dolor sit amet',
    'Consectetur adipiscing elitadipiscing eli.',
    'Consectetur adipiscing elit.',
    'Dorem ipsum dolor ',
    'Consectetur adipiscing elitscing elit.',
    'Consectetur adipiscing elit.',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.95,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: ColorsUtil.primaryBgColor,
          borderRadius: BorderRadius.only(
            topLeft: defaultRadius.topLeft,
            topRight: defaultRadius.topRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBottomSheetHandel(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(
                'assets/banner.png',
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Scratch Removal Buffing'),
                CustomButton(
                  padding: EdgeInsets.all(0),
                  border: Border.all(color: ColorsUtil.primaryButnColor),
                  height: 32,
                  width: 86,
                  color: Colors.transparent,
                  title: 'Add',
                  textcolor: ColorsUtil.primaryButnColor,
                  iconColor: ColorsUtil.primaryButnColor,
                  onTap: () {},
                  leadingIcon: Icons.add_outlined,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.history_toggle_off),
                widthSpaceBox(),
                Text('40 mins extra'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star_border_outlined),
                widthSpaceBox(),
                Text('data'),
              ],
            ),
            heightSpaceBox(height: 20),
            Text(
              "Benifits",
              style: TextStylesUtil.H1TextStyle,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE9F0FD)),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: repairBenefits.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Icon(
                          Icons.circle,
                          size: 5,
                        ),
                      ),
                      Expanded(
                        child: Text(repairBenefits[index],
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  );
                },
              ),
            ),
            Text(
              'Customer Reviews (20)',
              style: TextStylesUtil.H1TextStyle,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, int index) =>
                    customersReviews(context, EdgeInsets.all(10)),
              ),
            )
          ],
        ));
  }
}

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
