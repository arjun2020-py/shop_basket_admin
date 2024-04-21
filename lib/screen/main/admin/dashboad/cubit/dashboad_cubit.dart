import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'dashboad_state.dart';

class DashboadCubit extends Cubit<DashboadState> {
  DashboadCubit(this.context) : super(DashboadInitial());
  BuildContext context;
  logout() async {
  FirebaseAuth.instance.signOut();
    SharedPreferences prf = await SharedPreferences.getInstance();
    prf.clear();
    Navigator.of(context).pop();
  }
}
