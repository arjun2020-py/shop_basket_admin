import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_amount_button.dart';
import '../../../../../utils/custom_widget/custom_arrow_back.dart';
import '../../../../../utils/custom_widget/custom_elevbutton.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../../home/view/screen_detailed_home.dart';

class DetailedCategoryScreen extends StatelessWidget {
  const DetailedCategoryScreen({super.key, required this.data});
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userAppMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: transprentColor,
        leading: CustomArrowBack(),
        title: CustomText(
          text: data['category_name'],
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('add_new_product')
              .snapshots(),
          builder: (context, snapshot) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: buttonColor,
                        ),
                        hintText: 'search products  '),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 6.0),
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenHomeDetailed(),
                            ));
                          },
                          child: Container(
                              height: MediaQuery.sizeOf(context).height,
                              decoration: BoxDecoration(color: whiteColor),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/apple.png',
                                    width: 100,
                                  ),
                                  CustomText(
                                      text: 'Apple',
                                      color: blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  CustomAmountButton(
                                    amount: '300',
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: buttonColor),
                                      onPressed: () {},
                                      child: CustomText(
                                          text: 'Add To Cart',
                                          color: blackColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              )));
                    },
                  ),
                )
              ],
            );
          }),
    );
  }
}
