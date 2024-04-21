import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/const.dart';
import '../../../../utils/custom_color.dart';
import '../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../utils/custom_widget/custom_text.dart';
import '../cubit/splash_cubit.dart';

class ScreenSplah extends StatelessWidget {
  const ScreenSplah({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          var cubit = context.read<SplashCubit>();
          return Scaffold(
            backgroundColor:role=='admin'? appSplashColor: whiteColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  role == 'admin'
                      ? SizedBox()
                      : CircleAvatar(
                          radius: 80,
                          child: Lottie.asset(
                            'assets/images/Animation - 1713193978361.json',
                          ),
                        ),
                  CustomText(
                    text: role == 'admin' ? 'Admin App' : "Shopping Basket",
                    color: role=='admin'? appSplshNameColor : buttonColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
