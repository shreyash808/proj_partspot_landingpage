import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/controller/app_entry_controller.dart';
import 'package:partyspot/module/explore/view/explore_screen.dart';
import 'package:partyspot/module/home/presentation/view/home_screen.dart';
import 'package:partyspot/module/party_spot_vip/view/vip_screen.dart';
import 'package:partyspot/module/representative/view/representative_screen.dart';
import 'package:partyspot/module/settings/view/settings_screen.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart' show AppColor;
import 'package:partyspot/utils/constants/string_consts.dart';

class AppEntryScreen extends StatelessWidget {
  AppEntryScreen({super.key});

  final AppEntryController controller = Get.find<AppEntryController>();

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.dashboard_outlined,
    Icons.confirmation_num_outlined,
    Icons.settings_outlined,
  ];

  final List<String> _labels = [
    StringConsts.home,
    StringConsts.events,
    StringConsts.partySportVip,
    StringConsts.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AppEntryController>(
        builder: (controller) {
          return Scaffold(
            body: IndexedStack(
              index: controller.selectedIndex,
              children: [
                HomeScreen(),
                ExploreScreen(),
                VipScreen(),
                SettingsScreen(),
                // RepresentativeScreen(),
              ],
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(color: AppColor.silverColor, blurRadius: 8),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_icons.length, (index) {
                  bool isSelected = index == controller.selectedIndex;
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: GestureDetector(
                      onTap: () {
                        controller.updateIndex(index);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration:
                            isSelected
                                ? BoxDecoration(
                                  color: AppColor.lightOrangeColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColor.orangeColor,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.lightOrangeColor,
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                      offset: Offset(4, 4),
                                    ),
                                    BoxShadow(
                                      color: AppColor.lightOrangeColor,
                                      blurRadius: 8,
                                      spreadRadius: 2,
                                      offset: Offset(-4, -4),
                                    ),
                                  ],
                                )
                                : BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _icons[index],
                              color:
                                  isSelected
                                      ? AppColor.orangeColor
                                      : AppColor.blackColor,
                              size: 28,
                            ),
                            if (isSelected)
                              Text(
                                _labels[index],
                                style: AppTextStyles.get10SemiBoldTextStyle(),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
