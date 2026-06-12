import 'package:flutter/material.dart';
import 'package:i_bank/constants/color_constants.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  String? appBarText;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Widget? customLeading;


  CustomAppBar({super.key,
     this.appBarText,
     this.backgroundColor,
     this.textColor,
     this.iconColor,
    this.customLeading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      toolbarHeight: 120,
      leadingWidth: 70,
      leading: Padding(
        padding: const EdgeInsets.only(top: 35,left: 10),
        child: customLeading?? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp, color: iconColor,)),
      ),
      titleSpacing: 5,
      title: Padding(
        padding: const EdgeInsets.only(top: 35, left: 10),
        child: Row(
          children: [
             appBarText != null ? Text(appBarText!, style: TextStyle(color: textColor, fontSize: 25, fontWeight: FontWeight.bold),) : SizedBox(),
          ],
        ),
      ),

      centerTitle: true,);
  }}