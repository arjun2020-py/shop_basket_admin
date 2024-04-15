import 'package:flutter/material.dart';


import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_amount_button.dart';
import '../../../../../utils/custom_widget/custom_arrow_back.dart';
import '../../../../../utils/custom_widget/custom_elevbutton.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../../home/view/screen_detailed_home.dart';

class DetailedCategoryScreen extends StatelessWidget {
  const DetailedCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userAppMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: transprentColor,
        leading: CustomArrowBack(),
        title: CustomText(
          text: 'Friuts',
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Column(
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
                  mainAxisSpacing: 4.0),
              itemCount: 16,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => ScreenHomeDetailed(), ));
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
                        CustomAmountButton(amount: '300',),
                        CustomElevButton(
                          bgColor: buttonColor,
                          child: CustomText(text: 'Add To Cart', color: blackColor, fontSize: 18, fontWeight: FontWeight.w600),
                        
                          onPressed: () {},
                          width: 0.4,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
