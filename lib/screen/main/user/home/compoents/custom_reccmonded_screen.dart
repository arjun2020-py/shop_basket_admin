import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../cubit/home_cubit.dart';

class CustomRecommendScreen extends StatelessWidget {
  const CustomRecommendScreen({
    super.key,
    required this.homeCubit,
  });
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Set a fixed height here as an example
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('add_new_product')
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
                    width: 60,
                    child: Column(
                      children: [
                        Image.network(
                          data['image'],
                          width: 40,
                        ),
                        CustomText(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          //  text: homeController.catageryList[index].name,
                          text: data['product_name'],
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
