import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kurd_tree/src/constants/assets.dart';
import 'package:kurd_tree/src/helper/k_widgets.dart';
import 'package:kurd_tree/src/helper/spcolor.dart';
import 'package:kurd_tree/src/models/kt_social_model.dart';
import 'package:kurd_tree/src/models/kt_user_model.dart';
import 'package:kurd_tree/src/screens/edit_profile_screen.dart';
import 'package:kurd_tree/src/widgets/k_social_row.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  KTUser? mUser;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SPColors.dark,
      body: Stack(
        children: [body, KWidget.loadingView(isLoading)],
      ),
    );
  }

  loadUser() async {
    print("loadUser called");
    setState(() {
      isLoading = true;
    });
    mUser = await KTUser.getUser(userUID: "abc123");
    if (mUser != null) {
      isLoading = false;
    }
    setState(() {});
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
                  child: mUser?.coverPictureUrl != null
                      ? CachedNetworkImage(
                          imageUrl: mUser!.coverPictureUrl!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
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
                  Get.to(() => EditProfileScreen(user: mUser))
                      ?.then((value) => loadUser());
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
                  child: mUser?.profilePictureUrl != null
                      ? CachedNetworkImage(
                          imageUrl: mUser!.profilePictureUrl!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
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
                    mUser?.fullName ?? "N/A",
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
              child: Text(mUser?.bio ?? "N/A", style: SPColors.lightStyle(14)),
            )),
        const SizedBox(height: 15),
        for (KTSocialModel socaila in mUser?.socials ?? [])
          KSocialRow(
            name: socaila.name,
            icon: socaila.icon,
            onTap: () {
              print(socaila.url);

              var uri = Uri.parse(socaila.url!);
              launchUrl(uri, mode: LaunchMode.inAppWebView);
            },
          ),
        const SizedBox(height: 100),
      ]),
    );
  }
}
