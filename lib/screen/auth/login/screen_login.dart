import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/custom_widget/custom_auth_option.dart';
import '../../../utils/custom_widget/custom_divider_widget.dart';
import '../../../utils/custom_widget/custom_elevbutton.dart';
import '../../../utils/custom_widget/custom_sized_box.dart';
import '../../../utils/custom_widget/custom_text.dart';
import '../../../utils/custom_widget/custom_text_button.dart';
import '../../../utils/custom_widget/custom_textfiled.dart';
import '../register/view/screen_register.dart';
import 'cubit/login_cubit.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key, this.role});
  String? role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocProvider(
            create: (context) => LoginCubit(context),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                var cubit = context.read<LoginCubit>();
                return Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSizedBox(50),
                        CircleAvatar(
                          radius: 80,
                          child: Lottie.asset(
                            'assets/images/Animation - 1710046137885.json',
                          ),
                        ),
                        verticalSizedBox(20),
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
                        CustomText(
                          text: 'Login',
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomTextfiled(
                          obscureText: false,
                          hintText: 'email',
                          controller: cubit.emailCtr,
                          validator: (value) => cubit.emailValidtor(value!),
                        ),
                        verticalSizedBox(10),
                        CustomTextfiled(
                          obscureText: cubit.ispasswordVisible,
                          icons: cubit.ispasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          sufixOnPressed: () {
                            cubit.passIsVisbleCheck();
                          },
                          hintText: 'password',
                          controller: cubit.passwordCtr,
                          validator: (value) => cubit.passwordValidtor(value!),
                        ),
                        verticalSizedBox(10),
                        CustomElevButton(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          onPressed: () {
                            role = cubit.dropdownValue;
                            String email = cubit.emailCtr.text.trim();
                            String password = cubit.passwordCtr.text.trim();
                            cubit.userLogin(email, password);
                          },
                          boderRadius: 20,
                          bgColor: greenColor,
                          child: CustomText(
                              text: 'Login',
                              color: blackColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        verticalSizedBox(10),
                        CustomDivderWidget(),
                        CustomAuthOption(
                          optionText: "Don't have an account?",
                          textButtonText: 'Register',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenRegister(),
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
