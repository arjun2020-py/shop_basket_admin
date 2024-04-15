import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/custom_widget/custom_images.dart';
import '../model/category_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial());
  BuildContext context;
  int activeIndex = 0;

  
  sliderImages(int index) {
    activeIndex = index;
    emit(HomeInitial());
  }

  List<String> slideList = [
    'assets/images/sl1.jpg',
    'assets/images/sl3.jpg',
    'assets/images/sl4.jpeg'
  ];

  List<CategoryModel> categoryList = [
    CategoryModel(imageUrl: jares, text: 'Jars'),
    CategoryModel(imageUrl: chicken, text: 'Chicken'),
    CategoryModel(imageUrl: fruits, text: 'Fruits'),
    CategoryModel(imageUrl: seaFood, text: 'Sea food'),
    CategoryModel(imageUrl: nuts, text: 'Nuts'),
    CategoryModel(imageUrl: bakery, text: 'Bakery'),
    CategoryModel(imageUrl: drinks, text: 'Drinks'),
    CategoryModel(imageUrl: diary, text: 'Diary'),
    CategoryModel(imageUrl: canndies, text: 'Canndies'),
    CategoryModel(imageUrl: snackes, text: 'Snacks'),
    CategoryModel(imageUrl: cheese, text: 'cheese'),
    CategoryModel(imageUrl: icream, text: 'Icream'),
    CategoryModel(imageUrl: vegtable, text: 'Vegtables'),
    CategoryModel(imageUrl: milk, text: 'Milk'),
    CategoryModel(imageUrl: meat, text: 'Meat'),
    CategoryModel(imageUrl: others, text: 'Others')
  ];
   logout() async {
    FirebaseAuth.instance.signOut();
    SharedPreferences prf = await SharedPreferences.getInstance();
    prf.clear();
    Navigator.of(context).pop();
  }
}
