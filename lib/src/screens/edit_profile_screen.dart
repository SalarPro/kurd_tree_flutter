import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kurd_tree/src/constants/assets.dart';
import 'package:kurd_tree/src/helper/spcolor.dart';
import 'package:kurd_tree/src/widgets/k_text_filed.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: SPColors.dark,
      body: body,
    );
  }

  Widget get body {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: (Get.width / (16 / 9) - 32) +
                  70 +
                  (MediaQuery.of(context).padding.top),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: Get.width / (16 / 9) -
                    32 +
                    (MediaQuery.of(context).padding.top),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    Assets.resourceIconPc,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const EditProfileScreen());
                },
                child: SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      color: SPColors.main.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      Assets.resourceIconEdit,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 0,
              child: Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    Assets.resourceIconPersone,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 30,
              left: 140,
              bottom: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Salar Pro",
                    style: SPColors.lightStyle(
                      30,
                      weight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Image.asset(
                    Assets.resourceIconVerified,
                    width: 25,
                    height: 25,
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text(
                "User Info",
                style: SPColors.lightStyle(22),
              ),
            ],
          ),
        ),
        KTextField(
          controller: TextEditingController(
            text:
                "Of a content management system, differs from other web-based systems",
          ),
          dynamicHeight: true,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "Full name",
          icon: Assets.resourceIconUser,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "Email",
          icon: Assets.resourceIconMail,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "Password",
          icon: Assets.resourceIconPassword,
          isPassword: true,
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Text("Social Media", style: SPColors.lightStyle(22)),
            ],
          ),
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "@Salar_Pro",
          icon: Assets.resourceIconInstagram,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "@Salar_Pro",
          icon: Assets.resourceIconInstagram,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "@SalarPro",
          icon: Assets.resourceIconYoutube,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "PayPal",
          icon: Assets.resourceIconPaypal,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "Salar Khalid",
          icon: Assets.resourceIconFacebook,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "+964 (0)750 350 5440",
          icon: Assets.resourceIconWhatsapp,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "+964 (0)750 350 5440",
          icon: Assets.resourceIconTelegram,
        ),
        KTextField(
          controller: TextEditingController(),
          hint: "+964 (0)750 350 5440",
          icon: Assets.resourceIconViber,
        ),
        const SizedBox(height: 100),
      ]),
    );
  }
}
