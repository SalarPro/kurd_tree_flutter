import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kurd_tree/src/constants/assets.dart';
import 'package:kurd_tree/src/helper/spcolor.dart';
import 'package:kurd_tree/src/screens/edit_profile_screen.dart';
import 'package:kurd_tree/src/widgets/k_social_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              child: Text(
                  "Of a content management system, differs from other web-based systems ",
                  style: SPColors.lightStyle(14)),
            )),
        const SizedBox(height: 15),
        KSocialRow(
          name: "@Salar_Pro",
          icon: Assets.resourceIconInstagram,
          onTap: () {
            //
          },
        ),
        KSocialRow(
          name: "@SalarPro",
          icon: Assets.resourceIconYoutube,
          onTap: () {
            //
          },
        ),
        KSocialRow(
          name: "PayPal",
          icon: Assets.resourceIconPaypal,
          onTap: () {
            //
          },
        ),
        KSocialRow(
          name: "Salar Khalid",
          icon: Assets.resourceIconFacebook,
          onTap: () {
            //
          },
        ),
        KSocialRow(
          name: "+964 (0)750 350 5440",
          icon: Assets.resourceIconWhatsapp,
          onTap: () {
            //
          },
        ),
        KSocialRow(
          name: "+964 (0)750 350 5440",
          icon: Assets.resourceIconTelegram,
          onTap: () {
            //
          },
        ),
        KSocialRow(
          name: "+964 (0)750 350 5440",
          icon: Assets.resourceIconViber,
          onTap: () {
            //
          },
        ),
        const SizedBox(height: 100),
      ]),
    );
  }
}
