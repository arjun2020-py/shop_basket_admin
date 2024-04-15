import 'package:flutter/material.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../../add_category/view/screen_add_category.dart';
import '../../add_product/view/screen_add_product.dart';
import '../../category/view/screen_category.dart';
import '../../change_language/view/screen_change_language.dart';
import '../../product/view/screen_product.dart';
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
            text: 'Category',
            icons: Icons.category,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenCategory(),
              ));
            },
          ),
          CustomListTile(
            text: 'Products',
            icons: Icons.grid_view,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenProduct(),
              ));
            },
          ),
          CustomListTile(
            text: 'Add Product',
            icons: Icons.add,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddProductScreen(),
              ));
            },
          ),
          CustomListTile(
            text: 'Add Category',
            icons: Icons.category_rounded,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenAddCategory(),
              ));
            },
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
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenChangeLanguage(),
              ));
            },
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
