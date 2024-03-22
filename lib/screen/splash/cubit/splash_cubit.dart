import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../dashboad/view/screen_dashboad.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    splash();
  }
  BuildContext context;
  splash() async {
    Future.delayed(Duration(milliseconds: 500), () {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScreenDashboad(),
      ));
    });
    emit(SplashInitial());
  }
}
