import 'package:flutter/material.dart';
import 'package:shop_basket_admin/utils/custom_widget/custom_elevbutton.dart';

import '../../../../utils/custom_color.dart';
import '../../../../utils/custom_widget/custom_arrow_back.dart';
import '../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../utils/custom_widget/custom_text.dart';

import 'compoents/cart_price.dart';
import 'compoents/custom_divder.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userAppMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: transprentColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          text: 'Shopping Card',
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      decoration: ShapeDecoration(
                          color: whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/apple.png',
                            width: 50,
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: 'Apple',
                                color: blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.currency_rupee,
                                    size: 15,
                                  ),
                                  CustomText(
                                      text: '200',
                                      color: greenColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
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
                          horzotalSizedBox(10)
                        ],
                      )),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: transprentColor,
                );
              },
            ),
          ),
          verticalSizedBox(0),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const CartPriceAmount(
                  text: 'Subtotal',
                ),
                const CustomDivider(),
                const CartPriceAmount(text: 'Delivery free'),
                const CustomDivider(),
                const CartPriceAmount(text: 'Total Cost'),
                const CustomDivider(),
                CustomElevButton(width: 0.6,onPressed: () {
                  
                },
                child: CustomText(text: 'Checkout', color: buttonColor, fontSize: 18, fontWeight: FontWeight.w600),
                )
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
