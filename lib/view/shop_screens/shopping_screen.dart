import 'package:balancers/custom/custom_button.dart';
import 'package:balancers/custom/custom_card.dart';
import 'package:flutter/material.dart';

import '../../utils/colors_const.dart';
import '../../utils/global_variables.dart';
import '../../utils/textstyles_const.dart';
import 'cart.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final ScrollController _scrollController = ScrollController();
  List<String> groceryCategories = [
    'Top Coat',
    'Windshield',
    'Waterless Cleaning',
  ];
  String selectedCategory = '';
  final Map<String, List<String>> groceryItems = {
    'Top Coat': ['Apple', 'Banana', 'Grapes', 'Orange'],
    'Windshield': ['Carrot', 'Broccoli', 'Tomato', 'Cucumber'],
    'Waterless Cleaning': ['Milk', 'Cheese', 'Yogurt', 'Butter'],
  };
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    selectedCategory = groceryCategories[selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          heightSpaceBox(),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: defaultRadius,
                      color: ColorsUtil.primaryBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search products for vehicle or property',
                        border: OutlineInputBorder(borderRadius: defaultRadius),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                InkWell(
                  onTap: () {
                    // Add your filter logic here
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: ColorsUtil.primaryBgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.filter_list,
                        size: 30,
                        color: ColorsUtil.primaryButnColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CategoryButton(
            categoryList: groceryCategories,
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
                selectedCategory = groceryCategories[index];
              });
            },
            selectedIndex: selectedIndex,
          ),
          const SizedBox(height: 20),
          productCard()
        ],
      ),
    );
  }

  Widget productCard() {
    return Expanded(
      child: ListView.builder(
        itemCount: groceryItems[selectedCategory]?.length ?? 0,
        itemBuilder: (context, index) {
          return CustomCard(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            boxShadow: [
              BoxShadow(
                color: Color(0xff83AEFF36).withOpacity(0.21),
                blurRadius: 12,
                spreadRadius: 0,
                offset: Offset(2, 2),
              ),
            ],
            padding: EdgeInsets.all(0),
            margin: const EdgeInsets.all(10),
            height: 200,
            color: ColorsUtil.primaryBgColor,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 34,
                      width: 86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(18),
                            bottomLeft: Radius.circular(8)),
                        color: Color(0xffDE8D00),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFFC850),
                            size: 10,
                          ),
                          Text(
                            'Premium',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsUtil.primaryBgColor),
                          )
                        ],
                      ),
                    )),
                Container(
                  child: Row(
                    children: [
                      CustomCard(
                          margin: const EdgeInsets.all(16),
                          color: ColorsUtil.primaryBgColor,
                          height: 200,
                          width: 150,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: defaultRadius,
                                child: SizedBox(
                                  height: 200,
                                  width: 150,
                                  child: Image.asset(
                                    'assets/shopping.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              CustomCard(
                                padding: EdgeInsets.all(0),
                                height: 25,
                                width: 25,
                                borderRadius: BorderRadius.circular(25),
                                child: Center(
                                    child: Icon(
                                  Icons.favorite_outline,
                                  size: 15,
                                )),
                              )
                            ],
                          )),
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(right: 10),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Coat Temper Wax',
                                textAlign: TextAlign.center,
                                style: TextStylesUtil.H1TextStyle,
                              ),
                              Text(
                                'A perfect shine and clean to you windshield',
                                textAlign: TextAlign.center,
                                style: TextStylesUtil.H2TextStyle.copyWith(
                                    color: ColorsUtil.secondaryblack),
                              ),
                              heightSpaceBox(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹ 1799',
                                    textAlign: TextAlign.center,
                                    style: TextStylesUtil.onBrdngTitleStyle
                                        .copyWith(fontSize: 24),
                                  ),
                                  CustomButton(
                                      padding: EdgeInsets.all(0),
                                      height: 30,
                                      color: ColorsUtil.primaryButnColor,
                                      title: 'Add',
                                      onTap: () {})
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  final List<String> categoryList;
  final ValueChanged<int> onItemSelected;
  final int selectedIndex;

  const CategoryButton({
    required this.categoryList,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) => Container(
          height: 38,
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: ElevatedButton(
            onPressed: () {
              widget.onItemSelected(index);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.selectedIndex == index
                  ? ColorsUtil.primaryButnColor
                  : ColorsUtil.cardcolor,
            ),
            child: Text(
              widget.categoryList[index],
              style: widget.selectedIndex == index
                  ? TextStylesUtil.H1TextStyle.copyWith(
                      color: ColorsUtil.primaryBgColor,
                    )
                  : TextStylesUtil.H1TextStyle.copyWith(
                      fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
