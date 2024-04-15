import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit(this.context) : super(ChangeLanguageInitial());
  BuildContext context;
  bool isCheck = false;
  bool isChecks = false;
  onChanged(bool value) {
    isCheck = value;
    emit(ChangeLanguageInitial());
  }
   onChangeded(bool value) {
    isChecks = value;
    emit(ChangeLanguageInitial());
  }
}
