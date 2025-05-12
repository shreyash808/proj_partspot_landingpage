import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/onboarding/data/onboarding_model.dart';

class OnboardingController extends GetxController {
  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  final List<OnBoardPageData> onBoardingList = [
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
}
