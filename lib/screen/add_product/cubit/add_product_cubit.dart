import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.context) : super(AddProductInitial());

  BuildContext context;
  String dropdownValue = "Jars";
  var items = [
    "Jars",
    "Chicken",
    "Fruits",
    "Sea food",
    "Nuts",
    "Bakery",
    "Dairy",
    "Drinks",
    "Canndes",
    "Snacks",
    "Cheese",
    "Ice cream",
    "Vegetables",
    "Milk",
    "Meat",
    "Others"
  ];
  dropdownValueChange(String value) {
    dropdownValue = value;
    emit(AddProductInitial());
  }

  pickImageFromGallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
  }

  pickImageFromPhone() async {}

  goBackButton(BuildContext context) {
    Navigator.of(context).pop();
  }
}
