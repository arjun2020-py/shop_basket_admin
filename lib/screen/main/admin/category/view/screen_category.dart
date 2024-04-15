import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../../add_category/view/screen_add_category.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ScreenAddCategory(),
          ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: appSplashColor,
            )),
        title: Text('Category'),
      ),
      backgroundColor: appMainColor,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("add_new_category")
              .orderBy('time')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var category = snapshot.data!.docs[index];
                  return Container(
                    child: ListTile(
                      leading: Image.network(category['image']),
                      title: CustomText(
                        text: category['category_name'],
                        color: blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              );
            }
          }),
    );
  }
}
