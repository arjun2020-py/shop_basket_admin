import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../utils/local_storage/local_storage.dart';
import '../../../main/admin/dashboad/view/screen_dashboad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../main/user/bottom_nav/view/screen_bottom_nav.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.context) : super(RegisterInitial());
  BuildContext context;
  TextEditingController emailCtr = TextEditingController(),
      mobCtr = TextEditingController(),
      passwordCtr = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String dropdownValue = "admin";

  var items = ["admin", "user"];
  dropdownValueChange(String value) {
    dropdownValue = value;
    emit(RegisterInitial());
  }

  mobileValidator(String value) {
    if (value.isEmpty) {
      return "mobno is not vaild";
    }
  }

  emailValidator(String value) {
    if (value.isEmpty) {
      return "email is not vaild";
    }
  }

  passwordValidator(String value) {
    if (value.isEmpty) {
      return "password is not vaild";
    }
  }

  userRegister(String email, String password) async {
    try {
      if (emailCtr.text.isNotEmpty && passwordCtr.text.isNotEmpty) {
        isLoading = true;
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then(
          (value) {
            userCollection();
            var data = LocalStorage();
            data.setStringPrf(dropdownValue);
            isLoading = false;
            emit(RegisterInitial());
          },
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('invaild entry in firebase')));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  regiserButtonClick(String email, String password) {
    if (formKey.currentState!.validate()) {
      userRegister(email, password);
      print('-------------------------------p1');
    }
  }

  userCollection() async {
    if (dropdownValue.isNotEmpty &&
        emailCtr.text.isNotEmpty &&
        mobCtr.text.isNotEmpty &&
        passwordCtr.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('user_collection').add({
        "role": dropdownValue,
        "time": DateTime.now(),
        "email": emailCtr.text,
        "mobile": mobCtr.text,
        "password": passwordCtr.text
      }).then((value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => dropdownValue == 'admin'
                  ? ScreenDashboad()
                  : ScreenBottomNav())));
    }
  }
}
