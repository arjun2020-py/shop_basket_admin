import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shop_basket_admin/screen/auth/login/screen_login.dart';

import '../../../../utils/auth_enum.dart';
import '../../../../utils/const.dart';
import '../../../../utils/local_storage/local_storage.dart';
import '../../../main/admin/dashboad/view/screen_dashboad.dart';
import '../../../main/user/bottom_nav/view/screen_bottom_nav.dart';
import '../../register/view/screen_register.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    currentUser().then((userId) {
      authStatus =
          userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
    });
    splash();
  }
  BuildContext context;
  AuthStatus authStatus = AuthStatus.notSignedIn;
  Future<String> currentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  splash() async {
    var data = LocalStorage();
     role = await data.getStringPrf();
    Future.delayed(Duration(milliseconds: 800), () {
      switch (authStatus) {
        case AuthStatus.notSignedIn:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ScreenLogin(),
          ));
          break;
        case AuthStatus.signedIn:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>role=='admin' ?ScreenDashboad() : ScreenBottomNav(),
          ));
          break;
        default:
      }
    });
    emit(SplashInitial());
  }
}
