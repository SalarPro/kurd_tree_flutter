import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kurd_tree/src/constants/assets.dart';
import 'package:kurd_tree/src/helper/k_widgets.dart';
import 'package:kurd_tree/src/helper/spcolor.dart';
import 'package:kurd_tree/src/screens/profile_screen.dart';
import 'package:kurd_tree/src/widgets/k_text_filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPColors.dark,
      body: body,
    );
  }

  Widget get body => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, left: 40, right: 40),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: SPColors.main,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 0, 255, 76).withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: Offset(4, 6), // changes position of shadow
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "Kurd Tree",
                  style: SPColors.lightStyle(50,
                      weight: FontWeight.bold, color: SPColors.dark),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const KTextField(
              icon: Assets.resourceIconMail,
              title: "Email",
            ),
            const KTextField(
              icon: Assets.resourceIconPassword,
              title: "Password",
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                KWidget.btnMedium(
                  title: "Login",
                  onTap: () {
                    Get.to(
                      () => const ProfileScreen(),
                    );
                  },
                )
              ],
            )
          ],
        ),
      );
}
