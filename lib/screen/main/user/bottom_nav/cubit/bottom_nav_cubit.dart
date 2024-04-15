import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../cart/screen_cart.dart';
import '../../my_order/screen_my_order.dart';
import '../../fav/screen_fav.dart';
import '../../home/view/screen_home.dart';
import '../../profile/screen_profile.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit(this.context) : super(BottomNavInitial());
  BuildContext context;
  int currentIndex = 0;

  List<Widget> screens = [
    ScreenHome(),
    ScreenFav(),
    ScreenCart(),
    MyTabBar(),
    ScreenProfile()
  ];
  onChnageValue(int index) {
    currentIndex = index;
    emit(BottomNavInitial());
  }
 
}
