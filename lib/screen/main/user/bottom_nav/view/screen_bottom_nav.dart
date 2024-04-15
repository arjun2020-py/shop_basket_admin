import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/custom_color.dart';
import '../cubit/bottom_nav_cubit.dart';

class ScreenBottomNav extends StatelessWidget {
  const ScreenBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BottomNavCubit(context),
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          var cubit = context.read<BottomNavCubit>();
          return Scaffold(
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: CupertinoTabBar(
                onTap: (index) => cubit.onChnageValue(index),
                currentIndex: cubit.currentIndex,
                activeColor: blackColor,
                inactiveColor: gryColor,
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_basket), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
                ],
              ));
        },
      ),
    );
  }
}
