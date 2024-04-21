import 'package:cloud_firestore/cloud_firestore.dart';
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
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('add_new_category')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data!.docs[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 50,
                  child: Column(
                    children: [
                      Image.network(data['image']),
                      CustomText(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        //  text: homeController.catageryList[index].name,
                        text: data['category_name'],
                        color: blackColor,
                      ),
                    ],
                  ),
                );
              },
            );
            }
          }),
    );
  }
}
