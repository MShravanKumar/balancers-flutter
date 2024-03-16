// import 'package:balancers/view/add_vehicle_screens/my_vehicles.dart';
// import 'package:balancers/view/home_screen/home_screen_view.dart';
// import 'package:balancers/view/property_screen/property_screen_view.dart';
// import 'package:balancers/view/shop_screen/shop_screen_view.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int pageIndex = 0;

//   final pages = [
//     const HomeScreenView(),
//     const ShopScreenView(),
//     const VehicleScreen(),
//     const PropertyScreenView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[pageIndex],
//       bottomNavigationBar: Container(
//         height: 60,
//         decoration: BoxDecoration(
//           color: Theme.of(context).primaryColor,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   pageIndex = 0;
//                 });
//               },
//               icon: pageIndex == 0
//                   ? const Icon(
//                       Icons.home_filled,
//                       color: Colors.white,
//                       size: 35,
//                     )
//                   : const Icon(
//                       Icons.home_outlined,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//             ),
//             IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   pageIndex = 1;
//                 });
//               },
//               icon: pageIndex == 1
//                   ? const Icon(
//                       Icons.work_rounded,
//                       color: Colors.white,
//                       size: 35,
//                     )
//                   : const Icon(
//                       Icons.work_outline_outlined,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//             ),
//             IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   pageIndex = 2;
//                 });
//               },
//               icon: pageIndex == 2
//                   ? const Icon(
//                       Icons.widgets_rounded,
//                       color: Colors.white,
//                       size: 35,
//                     )
//                   : const Icon(
//                       Icons.widgets_outlined,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//             ),
//             IconButton(
//               enableFeedback: false,
//               onPressed: () {
//                 setState(() {
//                   pageIndex = 3;
//                 });
//               },
//               icon: pageIndex == 3
//                   ? const Icon(
//                       Icons.person,
//                       color: Colors.white,
//                       size: 35,
//                     )
//                   : const Icon(
//                       Icons.person_outline,
//                       color: Colors.white,
//                       size: 35,
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:balancers/custom/home_appbar.dart';
import 'package:balancers/utils/colors_const.dart';
import 'package:balancers/view/add_vehicle_screens/my_vehicles.dart';
import 'package:balancers/view/home_screen/home_screen_view.dart';
import 'package:balancers/view/shop_screens/shopping_screen.dart';
import 'package:flutter/material.dart';

import 'view/info_screens/info_bottomSheet_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  LocationData? _selectedLocation;
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    HomeScreenView(),
    ShoppingScreen(),
    VehicleScreen(),
  ];
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return HomeMenuBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        selectedLocation: _selectedLocation,
        onProfilePressed: () {},
        onNotificationPressed: () {},
        onLocationChanged: (location) {
          setState(() {
            _selectedLocation = location;
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view_rounded),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Shop',
            activeIcon: Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: ColorsUtil.primaryblack,
              radius: 30,
              child: Image.asset(
                'assets/Isolation_Mode.png',
                height: 25,
                fit: BoxFit.fill,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car_outlined,
            ),
            activeIcon: Icon(
              Icons.directions_car_rounded,
            ),
            label: 'Vehicle',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.business_sharp),
            activeIcon: Icon(Icons.business_rounded),
            label: 'Property',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            showBottomSheet(context);
            return;
          }
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }
}
