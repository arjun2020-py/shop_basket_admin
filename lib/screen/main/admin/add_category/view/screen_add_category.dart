import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../cubit/add_category_cubit.dart';

class ScreenAddCategory extends StatelessWidget {
  const ScreenAddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: appSplashColor,
            )),
        title: CustomText(
          text: 'Add Category',
          color: blackColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocProvider(
        create: (context) => AddCategoryCubit(context),
        child: BlocBuilder<AddCategoryCubit, AddCategoryState>(
          builder: (context, state) {
            var cubit = context.read<AddCategoryCubit>();
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSizedBox(50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomText(
                      text: 'Category Name:',
                      color: blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalSizedBox(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      controller: cubit.categoryNameCtr,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'enter category name'),
                    ),
                  ),
                  verticalSizedBox(10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: appSplashColor),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 40,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.pickImageFromGallery();
                        },
                        child: CustomText(
                            text: 'Add Picture',
                            color: blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   height: MediaQuery.sizeOf(context).height * 0.4,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.black45,
                  //       image: DecorationImage(
                  //           fit: BoxFit.cover,
                  //           image:cubit.imageUrl.isEmpty ? AssetImage(
                  //               'assets/images/no_image.png'
                  //              ):AssetImage(cubit.image!.name))),
                  // ),
                  verticalSizedBox(10),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appSplashColor),
                          onPressed: () {
                            cubit.storeCategory();
                          },
                          child: CustomText(
                              text: 'Publish',
                              color: blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
