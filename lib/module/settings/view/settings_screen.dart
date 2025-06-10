import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/alert_dialogs/image_popup.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';
import 'package:percentify/components/RoundedCircularPercentify.dart';
// import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // double totalHeight = constraints.maxHeight;
          // double blurPosition = totalHeight * 0.4 - 30;

          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: double.infinity,
                      color: AppColor.whiteColor,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            AppImages.settingsBackground,
                            fit: BoxFit.cover,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Profile",
                                  style: AppTextStyles.get24BoldTextStyle(
                                    color: Colors.white,
                                  ),
                                ),

                                Spacer(),

                                InkWell(
                                  onTap: () {},
                                  child: CustomImageAsset(
                                    image: AppIcons.exploreBell,
                                    height: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Container(
                      width: double.infinity,
                      color: AppColor.whiteColor,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              children: [
                                profileListItem(
                                  imagePath: AppImages.profileIcon,
                                  onTap: () {
                                    Get.toNamed(Routes.profileScreen);
                                  },
                                  title: StringConsts.editProfile,
                                ),

                                profileListItem(
                                  imagePath: AppImages.bookingIcon,
                                  onTap: () {
                                    Get.toNamed(Routes.bookingScreen);
                                  },
                                  title: StringConsts.myBookings,
                                ),
                                profileListItem(
                                  imagePath: AppImages.reviewIcon,
                                  onTap: () {},
                                  title: StringConsts.myReviews,
                                ),
                                profileListItem(
                                  imagePath: AppImages.payIcon,
                                  onTap: () {},
                                  title: StringConsts.paymentMethods,
                                ),
                                profileListItem(
                                  imagePath: AppImages.supportIcon,
                                  onTap: () {
                                    Get.dialog(
                                      ImageDialog(
                                        title: "",
                                        imagePath: AppImages.supportImage,

                                        buttonText: StringConsts.reqCallBack,
                                        onConfirm: () {
                                          Get.back();
                                        },
                                        // outlineText: StringConsts.cancel,
                                        themeColor: AppColor.buttonOrange,
                                      ),
                                    );
                                  },
                                  title: StringConsts.helpSupport,
                                ),
                                profileListItem(
                                  imagePath: AppImages.deleteAccountIcon,
                                  onTap: () {
                                    Get.dialog(
                                      ImageDialog(
                                        title:
                                            StringConsts
                                                .reallyWantDeleteAccount,
                                        imagePath: AppImages.deleteAccountImage,
                                        buttonText: StringConsts.confirm,
                                        onConfirm: () {
                                          Get.back();
                                        },
                                        outlineText: StringConsts.cancel,
                                        themeColor: AppColor.buttonOrange,
                                      ),
                                    );
                                  },
                                  title: StringConsts.delAccount,
                                ),
                                profileListItem(
                                  imagePath: AppImages.logoutIcon,
                                  onTap: () {
                                    Get.dialog(
                                      ImageDialog(
                                        title: StringConsts.reallyWantLogout,
                                        imagePath: AppImages.logoutImage,
                                        buttonText: StringConsts.confirm,
                                        onConfirm: () {
                                          Get.back();
                                        },
                                        outlineText: StringConsts.cancel,
                                        themeColor: AppColor.buttonOrange,
                                      ),
                                    );
                                  },
                                  title: StringConsts.logout,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment(0, -0.5),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.fromLTRB(10, 90, 10, 8),

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffFFFFFF).withOpacity(0.74),
                              Color(0xffE1E1E1).withOpacity(0.33),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 0.2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'UTSAV SHARMA',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.get20BoldTextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: AppColor.borderB0B0B0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(100),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /// Circular Icon
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                      color: AppColor.buttonOrange,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const CustomImageAsset(
                                      image: AppIcons.crownIcon,
                                    ),
                                  ),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        StringConsts.beastCaps,
                                        style:
                                            AppTextStyles.get18SemiBoldTextStyle(),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        StringConsts.monthlySubs,
                                        style:
                                            AppTextStyles.get10SemiBoldTextStyle(
                                              color: AppColor.colorA1A1A1,
                                            ),
                                      ),
                                    ],
                                  ),

                                  const Spacer(),

                                  Container(
                                    height: 68,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: AppColor.buttonOrange,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(100),
                                        bottomRight: Radius.circular(100),
                                        topLeft: Radius.circular(100),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        StringConsts.upgrade,
                                        style:
                                            AppTextStyles.get14SemiBoldTextStyle(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: -50,
                      child: SizedBox(
                        width: 120,
                        height: 120 + 20,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColor.buttonOrange,
                                  width: 5,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                            ),

                            Positioned(
                              bottom: 10,
                              left: 8,
                              right: 0,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 3,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "75%",
                                    style: AppTextStyles.get14BoldTextStyle(
                                      color: AppColor.buttonOrange,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget profileListItem({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.dividerColor)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            const SizedBox(width: 18),
            Expanded(
              child: Text(title, style: AppTextStyles.get16RegularTextStyle()),
            ),
          ],
        ),
      ),
    );
  }
}
