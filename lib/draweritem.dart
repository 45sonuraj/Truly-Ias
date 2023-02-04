import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  VoidCallback ontap;
  String itemName;

  DrawerItem({super.key, required this.itemName, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade400,
      onTap: ontap,
      leading: Text(itemName),
      minLeadingWidth: 25,
    );
  }
}
