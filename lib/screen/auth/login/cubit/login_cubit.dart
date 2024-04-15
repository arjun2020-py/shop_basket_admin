import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../utils/const.dart';
import '../../../../utils/local_storage/local_storage.dart';
import '../../../main/admin/dashboad/view/screen_dashboad.dart';
import '../../../main/user/bottom_nav/view/screen_bottom_nav.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.context) : super(LoginInitial()) {
   
  }
  BuildContext context;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailCtr = TextEditingController(),
      passwordCtr = TextEditingController();

  String dropdownValue = "admin";
 bool? ispasswordVisible;
  var items = ["admin", "user"];
  dropdownValueChange(String value) {
    dropdownValue = value;
    emit(LoginInitial());
  }

  emailValidtor(String value) {
    if (value.isEmpty) {
      return 'in-vaild email id';
    }
  }

  passwordValidtor(String value) {
    if (value.isEmpty) {
      return 'in-vaild  password';
    }
  }

  userLogin(String email, String password) async {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      var data = LocalStorage();
      data.setStringPrf(dropdownValue);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            dropdownValue == 'admin' ? ScreenDashboad() : ScreenBottomNav(),
      ));
    });
  }
}
