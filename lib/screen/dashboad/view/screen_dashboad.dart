import 'package:flutter/material.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/custom_widget/custom_sized_box.dart';
import '../../../utils/custom_widget/custom_text.dart';
import '../viewModel/custom_card_data.dart';
import '../viewModel/dashboad_drawer.dart';

class ScreenDashboad extends StatelessWidget {
  const ScreenDashboad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appMainColor,
        drawer: const DashboadDrawer(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  return Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.list));
          }),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: CustomText(
            text: 'Dashboad',
            color: appNameColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: Column(
          children: [
            verticalSizedBox(50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCardData(
                  text: 'Orders',
                  icons: Icons.shopping_cart,
                  count: '200',
                ),
                CustomCardData(
                    text: 'Products', icons: Icons.inventory_2, count: '26')
              ],
            ),
            verticalSizedBox(30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCardData(
                    text: 'Customer', icons: Icons.group, count: '10'),
                CustomCardData(
                    text: 'Delivery Boy',
                    icons: Icons.directions_bike,
                    count: '4')
              ],
            )
          ],
        ));
  }
}