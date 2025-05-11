import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:partyspot/module/onboarding/data/onboarding_model.dart';
import 'package:partyspot/module/onboarding/presentation/widgets/circle_icon_button.dart';
import 'package:partyspot/module/onboarding/presentation/widgets/curve_clipper.dart';
import 'package:partyspot/module/onboarding/presentation/widgets/onboarding_dots.dart';
import 'package:partyspot/module/onboarding/presentation/widgets/slider_button.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  List<OnBoardPageData> onBoardingList = [
    OnBoardPageData(
      title: 'Discover events near you.',
      index: "1",
      image: 'assets/images/png/onBoarding1.png',
    ),
    OnBoardPageData(
      title: 'Easy event booking.',
      index: "2",
      image: 'assets/images/png/onboarding2.png',
    ),
    OnBoardPageData(
      title: 'Host and manage your\n own events.',
      index: "3",
      image: 'assets/images/png/onBoarding3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: onBoardingList.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Image.asset(
                  onBoardingList[index].image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: TopCurveClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 34,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          const Spacer(flex: 2),
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                onBoardingList.length,
                                (index) => OnboardingDot(
                                  isActive: currentPage == index,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(flex: 2),
                          Text(
                            onBoardingList[currentPage].title,

                            style: AppTextStyles.get24MediumTextStyle(
                              color: AppColor.textPurple,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(flex: 3),

                          currentPage == 2
                              ? SlideToUnlockButton(
                                label: "Get Started",
                                onSlideComplete: () {
                                  Get.offNamed(Routes.loginScreen);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => const NextScreen(),
                                  //   ),
                                  // );
                                },
                              )
                              : InkWell(
                                onTap: () {
                                  pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: CircularIconButton(
                                  icon: Icons.arrow_forward,
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
