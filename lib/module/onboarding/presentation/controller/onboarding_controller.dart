import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/onboarding/data/onboarding_model.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/services/storage_service.dart';

class OnboardingController extends GetxController {
  final RxInt currentPage = 0.obs;
  final PageController pageController = PageController();
  final StorageService _storageService = locator<StorageService>();

  final List<OnBoardPageData> onBoardingList = [
    OnBoardPageData(
      title: StringConsts.OnBoardingText1,
      index: "1",
      image: AppImages.onBoardingImg1,
    ),
    OnBoardPageData(
      title: StringConsts.OnBoardingText2,
      index: "2",
      image: AppImages.onBoardingImg2,
    ),
    OnBoardPageData(
      title: StringConsts.OnBoardingText3,
      index: "3",
      image: AppImages.onBoardingImg3,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    Future.microtask((){
      _storageService.setIsOnBoardVisited(true);
    });
  }
}
