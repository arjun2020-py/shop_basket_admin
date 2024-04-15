import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../product/view/screen_product.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.context) : super(AddProductInitial());
  BuildContext context;
  TextEditingController productNamectr = TextEditingController(),
      shortDecrptionctr = TextEditingController(),
      productPricectr = TextEditingController();
  XFile? image;
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  String imageUrl = '';
  String dropdownValue = "Jars";
  bool isLoading = false;
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
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(image!.path));

      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print(e);
    }

    print('image is : ${image?.name}');
  }

  pickImageFromPhone() async {
    final picker = ImagePicker();

    image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(image!.path));

      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print(e);
    }
    emit(AddProductInitial());
    print('image is : ${image?.name}');
  }

  storeDataToFirestore(String productName, String shortDecrption, String type,
      String productPrice, String images) async {
    isLoading = true;
    emit(AddProductInitial());
    if (productNamectr.text.isNotEmpty &&
        shortDecrptionctr.text.isNotEmpty &&
        productPricectr.text.isNotEmpty) {
      DocumentReference documentReference =
          await FirebaseFirestore.instance.collection('add_new_product').add({
        "product_name": productName,
        "short_decrption": shortDecrption,
        "type_of_product": type,
        "product_price": productPrice,
        "image": images
      });
      isLoading = false;

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScreenProduct(),
      ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('product is not added')));
    }
  }
}
