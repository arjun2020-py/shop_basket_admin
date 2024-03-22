import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/custom_widget/custom_text.dart';
import 'custom_list_tile.dart';

class DashboadDrawer extends StatelessWidget {
  const DashboadDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //  backgroundColor: Colors.red,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: appSplashColor),
              currentAccountPicture: CircleAvatar(
                // backgroundColor: appSplashColor,
                child: Text('A'),
              ),
              accountName: CustomText(
                text: 'Admin',
                color: whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              accountEmail: CustomText(
                text: '9012131410',
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
          CustomListTile(
            text: 'Home',
            icons: Icons.home,
            onTap: () {},
          ),
          CustomListTile(
            text: 'Orders',
            icons: Icons.shopping_cart,
            onTap: () {},
          ),
          CustomListTile(
            text: 'Products',
            icons: Icons.inventory_2,
            onTap: () {},
          ),
          CustomListTile(
            text: 'Add Product',
            icons: Icons.add,
            onTap: () {},
          ),
          CustomListTile(
            text: 'Delivery Boy',
            icons: Icons.directions_bike,
            onTap: () {},
          ),
          CustomListTile(
            text: 'Customer',
            icons: Icons.group,
            onTap: () {},
          ),
          Divider(
            thickness: 0.3,
            color: blackColor,
          ),
          CustomListTile(
            text: 'Privacy Policy ',
            icons: Icons.lock,
            onTap: () {},
          ),
          CustomListTile(
            text: 'Change Language',
            icons: Icons.language,
            onTap: () {},
          ),
          CustomListTile(
            text: 'Trem & Conditions',
            icons: Icons.description,
            onTap: () {},
          ),
          Divider(
            thickness: 0.3,
            color: blackColor,
          ),
          CustomListTile(
            text: 'Logout',
            icons: Icons.logout,
            onTap: () {},
          )
        ],
      ),
    );
  }
}
