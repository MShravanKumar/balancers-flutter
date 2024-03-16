import 'package:flutter/material.dart';
import '../utils/colors_const.dart';
import '../utils/global_variables.dart';
import '../utils/textstyles_const.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const NavigationAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120.0,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(),
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
            size: defaultIconSize, color: ColorsUtil.primaryblack),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: TextStylesUtil.H1TextStyle.copyWith(color: Color(0xff1A1A1A)),
      ),
      centerTitle: true,
      backgroundColor: ColorsUtil.primaryBgColor,
      actions: actions ?? [],
      elevation: 0,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.1),
          child: Divider(
            thickness: 1,
            height: 0,
            color: Color(0xff0000001F).withAlpha(20),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
