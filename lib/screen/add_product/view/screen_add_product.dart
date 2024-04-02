import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/custom_widget/custom_sized_box.dart';
import '../../../utils/custom_widget/custom_text.dart';
import '../cubit/add_product_cubit.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      appBar: AppBar(
        leading: Container(
          child: IconButton(
              onPressed: () {
                    Navigator.of(context).pop();

              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: appSplashColor,
              )),
        ),
        centerTitle: true,
        title: CustomText(
          text: 'Add New Product',
          color: blackColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocProvider(
        create: (context) => AddProductCubit(context),
        child: BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
            var cubit = context.read<AddProductCubit>();
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSizedBox(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomText(
                        text: 'Product  Name',
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Add New Product  name!...'),
                    ),
                  ),
                  verticalSizedBox(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomText(
                        text: 'Short Decrption',
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Add short details of product....!',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CustomText(
                        text: 'type of product',
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton(
                      value: cubit.dropdownValue,
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: cubit.items.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        cubit.dropdownValueChange(newValue!);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomText(
                        text: 'Prodduct Price',
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Enter product price'),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appSplashColor,
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 40,
                          )),
                      TextButton(
                          onPressed: () {
                            cubit.pickImageFromGallery();
                          },
                          child: CustomText(
                              text: 'Add Picture',
                              color: blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appSplashColor),
                          onPressed: () {},
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
