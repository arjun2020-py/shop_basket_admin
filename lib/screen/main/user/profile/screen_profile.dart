import 'package:flutter/material.dart';


import '../../../../utils/custom_color.dart';
import '../../../../utils/custom_widget/custom_arrow_back.dart';
import '../../../../utils/custom_widget/custom_sized_box.dart';
import '../../../../utils/custom_widget/custom_text.dart';
import 'compoents/custom_profile_card.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userAppMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: transprentColor,
        leading: const CustomArrowBack(),
        title: CustomText(
          text: 'Profile',
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: greenColor,
                      ))
                ],
              ),
              CustomText(
                  text: 'Adam Jhon',
                  color: blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              verticalSizedBox(20),
              const CustomProfileCard(
                text: 'Your Profile',
                prefixIcon: Icons.person,
                sufixIcon: Icons.arrow_forward_ios_rounded,
              ),
              const CustomProfileCard(
                text: 'Mange Address',
                prefixIcon: Icons.location_pin,
                sufixIcon: Icons.arrow_forward_ios_rounded,
              ),
              const CustomProfileCard(
                text: 'passwrod',
                prefixIcon: Icons.lock,
                sufixIcon: Icons.arrow_forward_ios_rounded,
              ),
              const CustomProfileCard(
                text: 'Payment Method',
                prefixIcon: Icons.payment,
                sufixIcon: Icons.arrow_forward_ios_rounded,
              ),
              const CustomProfileCard(
                text: 'About',
                prefixIcon: Icons.help,
                sufixIcon: Icons.arrow_forward_ios_rounded,
              ),
              CustomProfileCard(
                  text: 'Notifcation',
                  prefixIcon: Icons.notifications,
                  sufixIcon: Icons.countertops)
            ],
          ),
        ),
      ),
    );
  }
}
