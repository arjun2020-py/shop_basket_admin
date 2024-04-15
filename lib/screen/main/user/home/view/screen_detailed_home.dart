import 'package:flutter/material.dart';
import 'package:shop_basket_admin/utils/custom_widget/custom_sized_box.dart';


import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_arrow_back.dart';
import '../../../../../utils/custom_widget/custom_icon_widget.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../../cart/screen_cart.dart';

class ScreenHomeDetailed extends StatelessWidget {
  const ScreenHomeDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userAppMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: transprentColor,
        leading: CustomArrowBack(),
        title: CustomText(
          text: 'Details',
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/apple.png',
                  width: 250,
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.5,
                color: whiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: 'Apple',
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    CustomText(
                        text: 'Fruits',
                        color: blackColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                    Row(
                      children: [
                        const Icon(
                          Icons.currency_rupee_outlined,
                          size: 16,
                        ),
                        CustomText(
                            text: '150',
                            color: greenColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: greenColor, width: 1.5)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove,
                                color: greenColor,
                                size: 16,
                              )),
                        ),
                        horzotalSizedBox(10),
                        CustomText(
                          text: '2',
                          color: blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        horzotalSizedBox(10),
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                              color: greenColor,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: greenColor, width: 1.5)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: whiteColor,
                                size: 16,
                              )),
                        ),
                      ],
                    ),
                    CustomText(
                      text: 'ProductDetails',
                      color: blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pretium orci at diam rhoncus, at ultricies urna posuere. Pellentesque sagittis mauris urna, et luctus odio consequat vitae. Integer libero sapien, fringilla eu magna quis, condimentum congue libero.',
                        color: blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    verticalSizedBox(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: 'Price Total',
                                color: blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 16,
                                ),
                                CustomText(
                                    text: '300',
                                    color: blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                          ],
                        ),
                        horzotalSizedBox(80),
                        CustomIconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenCart(),
                            ));
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
