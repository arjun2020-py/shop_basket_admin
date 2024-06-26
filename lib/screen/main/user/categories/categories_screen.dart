import 'package:flutter/material.dart';

import '../../../../utils/custom_color.dart';
import '../../../../utils/custom_widget/custom_text.dart';
import '../home/cubit/home_cubit.dart';
import '../home/view/screen_detailed_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'view/detailed_category_screen.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key, required this.homeCubit});
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Category'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('add_new_category')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemCount: snapshot.data!.docs.length,
                //homeCubit.categoryList.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailedCategoryScreen(data: data,),
                    )),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 100,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(data['image']),
                          ),
                          // CircleAvatar(
                          //   backgroundImage: CachedNetworkImage()),
                          // ),
                          CustomText(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            text: data['category_name'],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
