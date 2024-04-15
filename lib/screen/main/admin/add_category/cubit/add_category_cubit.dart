import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../category/view/screen_category.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit(this.context) : super(AddCategoryInitial());
  BuildContext context;
  TextEditingController categoryNameCtr = TextEditingController();
  XFile? image;
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  String imageUrl = '';
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
         print('image url === ${imageUrl}');
    } catch (e) {
      print(e);
    }

    print('image is : ${image?.name}');
  }

  pickImageFromCamera() async {
    final picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(image!.path));

      imageUrl = await referenceImageToUpload.getDownloadURL();
      print('image url === ${imageUrl}');
    } catch (e) {
      print(e);
    }

    print('image is : ${image?.name}');
  }

  storeCategory() async {
    String categoryName  = categoryNameCtr.text;
    FirebaseFirestore.instance.collection('add_new_category').add({
      "category_name": categoryName,
      "image":imageUrl,
      "time":DateTime.now()
    }).then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenCategory(),)));
  }
}
