import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:partyspot/module/onboarding/presentation/widgets/circle_icon_button.dart';
import 'package:partyspot/module/onboarding/presentation/widgets/curve_clipper.dart';
import 'package:partyspot/module/onboarding/presentation/widgets/onboarding_dots.dart';
import 'package:partyspot/module/onboarding/presentation/widgets/slider_button.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.onBoardingList.length,
            onPageChanged: (index) {
              controller.currentPage.value = index;
            },
            itemBuilder: (context, index) {
              return Image.asset(
                controller.onBoardingList[index].image ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          Obx(
            () =>
                controller.currentPage.value ==
                        controller.onBoardingList.length - 1
                    ? const SizedBox()
                    : Positioned(
                      right: 30,
                      top: 40,
                      child: GestureDetector(
                        onTap: () {
                          controller.pageController.animateToPage(
                            controller.onBoardingList.length - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          StringConsts.skip,
                          style: AppTextStyles.get20SemiBoldTextStyle(
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.42,
                width: double.infinity,
                color: AppColor.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 34,
                  ),
                  child: Obx(() {
                    final currentIndex = controller.currentPage.value;
                    final isLastPage =
                        currentIndex == controller.onBoardingList.length - 1;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.onBoardingList.length,
                            (dotIndex) => OnboardingDot(
                              isActive: currentIndex == dotIndex,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        Text(
                          controller.onBoardingList[currentIndex].title,
                          style: AppTextStyles.get24MediumTextStyle(
                            color: AppColor.textPurple,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),

                        isLastPage
                            ? SlideToUnlockButton(
                              label: StringConsts.getStarted,
                              onSlideComplete: () {
                                Get.offNamed(Routes.loginScreen);
                              },
                            )
                            : InkWell(
                              onTap: () {
                                controller.pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: const CircularIconButton(
                                icon: Icons.arrow_forward,
                              ),
                            ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
