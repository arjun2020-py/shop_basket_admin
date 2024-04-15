import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../../add_product/view/screen_add_product.dart';

class ScreenProduct extends StatelessWidget {
  const ScreenProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddProductScreen(),
          ));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: appMainColor,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: 'Products',
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: appSplashColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: appSplashColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.list,
                color: appSplashColor,
              ))
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("add_new_product")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var product = snapshot.data!.docs[index];
                  return Slidable(
                    startActionPane: ActionPane(
                        motion: ScrollMotion(),
                        dismissible: DismissiblePane(onDismissed: () {}),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: deleteCardColor,
                            foregroundColor: whiteColor,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                          SlidableAction(
                            onPressed: (context) {},
                            backgroundColor: updateCardColor,
                            foregroundColor: whiteColor,
                            icon: Icons.edit,
                            label: 'Edit',
                          ),
                        ]),
                    child: ListTile(
                      leading: Container(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        height: MediaQuery.sizeOf(context).height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(product['image']))),
                      ),
                      title: CustomText(
                          text: product['product_name'],
                          color: blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 14,
                              ),
                              CustomText(
                                  text: product['product_price'],
                                  color: blackColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          Row(
                            children: [
                              CustomText(
                                  text: 'Type:',
                                  color: blackColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                              CustomText(
                                  text: ' Friuts',
                                  color: blackColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 0.8,
                  );
                },
              );
            }
          }),
      // ),
    );
  }
}
