import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../../utils/custom_widget/custom_text.dart';
import '../cubit/change_language_cubit.dart';

class ScreenChangeLanguage extends StatelessWidget {
  const ScreenChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeLanguageCubit(context),
      child: BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
        builder: (context, state) {
          var cubit = context.read<ChangeLanguageCubit>();
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    verticalSizedBox(40),
                    CustomText(
                      text: 'choose your language',
                      color: blackColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    verticalSizedBox(40),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  cubit.isCheck ? Colors.purple : Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/english.png'),
                        ),
                        title: CustomText(
                            text: 'English',
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        trailing: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          value: cubit.isCheck,
                          onChanged: (value) {
                            cubit.onChanged(value!);
                          },
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: cubit.isChecks
                                  ? Colors.purple
                                  : Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/indian.png'),
                        ),
                        title: CustomText(
                            text: 'Hindi',
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        trailing: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          value: cubit.isChecks,
                          onChanged: (value) {
                            cubit.onChangeded(value!);
                          },
                        ),
                      ),
                    ),
                    verticalSizedBox(MediaQuery.sizeOf(context).height * 0.6),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appSplashColor),
                          onPressed: () {},
                          child: CustomText(
                              text: 'Continue',
                              color: whiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
