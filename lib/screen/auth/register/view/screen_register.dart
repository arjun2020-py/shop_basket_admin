import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_basket_admin/screen/auth/login/screen_login.dart';
import 'package:shop_basket_admin/screen/auth/register/cubit/register_cubit.dart';

import '../../../../utils/custom_color.dart';
import '../../../../utils/custom_widget/custom_auth_option.dart';
import '../../../../utils/custom_widget/custom_divider_widget.dart';
import '../../../../utils/custom_widget/custom_elevbutton.dart';
import '../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../utils/custom_widget/custom_text.dart';
import '../../../../utils/custom_widget/custom_textfiled.dart';

class ScreenRegister extends StatelessWidget {
  const ScreenRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocProvider(
            create: (context) => RegisterCubit(context),
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                var cubit = context.read<RegisterCubit>();
                return Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSizedBox(50),
                        CircleAvatar(
                          radius: 80,
                          child: Lottie.asset(
                            'assets/images/Animation - 1710046097403.json',
                          ),
                        ),
                        verticalSizedBox(20),
                        CustomText(
                          text: 'Register',
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
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
                        CustomTextfiled(
                          hintText: 'email',
                          controller: cubit.emailCtr,
                          validator: (value) => cubit.emailValidator(value!),
                        ),
                        verticalSizedBox(10),
                        CustomTextfiled(
                          hintText: 'mobile',
                          controller: cubit.mobCtr,
                          validator: (value) => cubit.mobileValidator(value!),
                        ),
                        verticalSizedBox(10),
                        CustomTextfiled(
                          hintText: 'password',
                          controller: cubit.passwordCtr,
                          validator: (value) => cubit.passwordValidator(value!),
                        ),
                        verticalSizedBox(10),
                        CustomElevButton(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          onPressed: () {
                            String email = cubit.emailCtr.text;
                            String password = cubit.passwordCtr.text;
                            cubit.regiserButtonClick(email, password);
                          },
                          boderRadius: 20,
                          bgColor: greenColor,
                          child: cubit.isLoading == true
                              ? CircularProgressIndicator()
                              : CustomText(
                                  text: 'Register',
                                  color: blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                        ),
                        verticalSizedBox(10),
                        CustomDivderWidget(),
                        CustomAuthOption(
                          optionText: "All ready have an account?",
                          textButtonText: 'Login',
                          onPressed: () {
                        
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenLogin(role: cubit.dropdownValue,),
                            ));
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
