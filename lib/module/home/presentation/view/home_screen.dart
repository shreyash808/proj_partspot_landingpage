import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:partyspot/module/home/presentation/view/widgets/feature_grid.dart';
import 'package:partyspot/module/home/presentation/view/widgets/party_sport_vip_home.dart';
import 'package:partyspot/module/home/presentation/view/widgets/popular_events_list.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        StringConsts.welcomeToPartSpot,
                        style: AppTextStyles.get24BoldTextStyle(),
                      ),
                    ),
                    SizedBox(width: 8),
                    CustomSvgPicture(
                      iconPath: AppIcons.notificationActiveIcon,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: 16 / 6,
                ),
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: CustomImageAsset(image: AppImages.dummyCarousel),
                  );
                },
              ),
              FeatureGrid(),
              PopularEventsList(),
              PartySportVipHome(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
