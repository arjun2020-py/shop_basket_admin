import 'package:flutter/material.dart';


import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../cubit/home_cubit.dart';

class CustomCategorySection extends StatelessWidget {
  const CustomCategorySection({
    super.key,
    required this.homeCubit,
  });
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Set a fixed height here as an example
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: homeCubit.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          var data = homeCubit.categoryList[index];
          return Container(
            margin: EdgeInsets.all(10),
            width: 50,
            child: Column(
              children: [
                Image.asset(homeCubit.categoryList[index].imageUrl),
                CustomText(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  //  text: homeController.catageryList[index].name,
                  text: data.text,
                  color: blackColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
