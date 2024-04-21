import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../../categories/categories_screen.dart';
import '../../categories/view/detailed_category_screen.dart';
import '../compoents/build_method.dart';
import '../compoents/custom_catagory_screen.dart';
import '../compoents/custom_category_section.dart';
import '../compoents/custom_reccmonded_screen.dart';
import '../cubit/home_cubit.dart';
import 'screen_detailed_home.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Location',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: greenColor,
                      ),
                      const CustomText(
                          text: 'india',
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  )
                ],
              ),
              actions: [
                Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications))),
                Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {
                          cubit.logout();
                        },
                        icon: const Icon(Icons.logout))),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Search Food,Drink,etc.',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          filled: true,
                          fillColor: whiteColor,
                          enabledBorder: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.search,
                            color: greenColor,
                          )),
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: cubit.slideList.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = cubit.slideList[index];
                      return BuildImages(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        cubit.sliderImages(index);

                        // final activeIndex = index;
                      },
                    ),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: cubit.activeIndex,
                    count: cubit.slideList.length,
                    effect: const JumpingDotEffect(),
                    onDotClicked: (index) {
                      cubit.activeIndex = index;
                    },
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenCategory(
                        homeCubit: cubit,
                      ),
                    )),
                    child: CustomCategorySectionText(
                      title: 'Categories',
                    ),
                  ),
                  // InkWell(
                  //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => DetailedCategoryScreen(),
                  //         )),
                  //     child:
                  CustomCategorySection(
                    homeCubit: cubit,
                  ),
                  //  ),
                  CustomCategorySectionText(title: 'Recommend'),
                  CustomRecommendScreen(
                    homeCubit: cubit,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
