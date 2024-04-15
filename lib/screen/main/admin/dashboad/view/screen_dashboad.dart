import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../cubit/dashboad_cubit.dart';
import '../viewModel/custom_card_data.dart';
import '../viewModel/dashboad_drawer.dart';

class ScreenDashboad extends StatelessWidget {
  const ScreenDashboad({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboadCubit(context),
      child: BlocBuilder<DashboadCubit, DashboadState>(
        builder: (context, state) {
          var cubit = context.read<DashboadCubit>();
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
                actions: [
                  IconButton(
                      onPressed: () {
                        cubit.logout();
                      },
                      icon: Icon(Icons.logout))
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            text: 'Products',
                            icons: Icons.grid_view,
                            count: '26')
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
                    ),
                    verticalSizedBox(30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCardData(
                            text: 'Sold out',
                            icons: Icons.storefront,
                            count: '4'),
                        CustomCardData(
                            text: 'Low in stock',
                            icons: Icons.published_with_changes,
                            count: '2')
                      ],
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
