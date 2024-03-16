import 'package:balancers/utils/textstyles_const.dart';
import 'package:flutter/material.dart';
import '../utils/global_variables.dart';
import '../view/profile_sceeen/profile_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final LocationData? selectedLocation;
  final VoidCallback onProfilePressed;
  final VoidCallback onNotificationPressed;
  final ValueChanged<LocationData?> onLocationChanged;

  const HomeAppBar({
    Key? key,
    required this.selectedLocation,
    required this.onProfilePressed,
    required this.onNotificationPressed,
    required this.onLocationChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        backgroundColor: Colors.white,
        leadingWidth: MediaQuery.of(context).size.width,
        leading: _buildLocationDropdown(),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                ),
                onPressed: onNotificationPressed,
              ),
              Positioned(
                right: 15,
                top: 10,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()));
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/userprofile.png'),
            ),
          ),
          widthSpaceBox(),
        ],
      ),
    );
  }

  Widget _buildLocationDropdown() {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 10,
      ),
      title: Row(
        children: [
          const Icon(Icons.near_me_rounded),
          Text(
            selectedLocation?.city ?? 'Select Location',
            style: TextStylesUtil.H1TextStyle,
          ),
          //if (selectedLocation != null)
          const Icon(
            Icons.arrow_drop_down_rounded,
          ),
        ],
      ),
      subtitle: Text(
        selectedLocation?.address ?? 'Address Unknown',
        style: TextStylesUtil.H2TextStyle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class LocationData {
  final String city;
  final String address;

  LocationData({required this.city, required this.address});
}
