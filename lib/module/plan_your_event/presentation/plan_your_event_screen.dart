import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/self_hosted_party/presentation/controller/part_selection_controller.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/selection_item.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class PlanYourEventScreen extends StatelessWidget {
  final String? title;
  const PlanYourEventScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? '',style: AppTextStyles.get18MediumTextStyle()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.chooseDate,style: AppTextStyles.get16MediumTextStyle()),
                        Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor)),
                      ],
                    ),
                    CustomSvgPicture(iconPath: AppIcons.calendarIcon)
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.numberOfGuests,style: AppTextStyles.get16MediumTextStyle()),
                        Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('100 Guests',style: AppTextStyles.get16RegularTextStyle(color: AppColor.colorB1B1B1)),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColor.offWhiteColor,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: AppColor.disabledColor
                              )
                            ),
                            child: Text(StringConsts.custom,style: AppTextStyles.get12RegularTextStyle(color: AppColor.disabledColor),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.venueType,style: AppTextStyles.get16MediumTextStyle()),
                        Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GetBuilder<PartyTypeSelectionController>(
                        init: PartyTypeSelectionController(isMultiSelect: false),
                        tag: 'venue_type',
                        builder: (controller) {
                          final items = ["Garden", "Banquet", "Custom"];
                          return Obx(() => Wrap(
                            spacing: 5.spW,
                            runSpacing: 12,
                            children: List.generate(items.length, (index) {
                              final item = items[index];
                              final isSelected = controller.isSelected(item);
                              return SelectionItem(
                                text: item,
                                borderRadius: 4,
                                isSelected: isSelected,
                                onTap: () => controller.toggleSelection(item),
                                borderWidth: 1,
                                textStyle: AppTextStyles.get14RegularTextStyle(
                                  color: isSelected ? AppColor.orangeColor : AppColor.disabledColor,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                              );
                            }),
                          ));
                        }
                    )

                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.foodPreferences,style: AppTextStyles.get16MediumTextStyle()),
                        Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GetBuilder<PartyTypeSelectionController>(
                        init: PartyTypeSelectionController(isMultiSelect: false),
                        tag: 'food_preferences',
                        builder: (controller) {
                          final items = ["Only Veg.", "Non Veg.", "Custom"];
                          return Obx(() => Wrap(
                            spacing: 5.spW,
                            runSpacing: 12,
                            children: List.generate(items.length, (index) {
                              final item = items[index];
                              final isSelected = controller.isSelected(item);
                              return SelectionItem(
                                text: item,
                                borderRadius: 4,
                                isSelected: isSelected,
                                onTap: () => controller.toggleSelection(item),
                                borderWidth: 1,
                                textStyle: AppTextStyles.get14RegularTextStyle(
                                  color: isSelected ? AppColor.orangeColor : AppColor.disabledColor,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                              );
                            }),
                          ));
                        }
                    )
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.specialRequirements,style: AppTextStyles.get16MediumTextStyle()),
                        Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectionItem(
                            borderWidth: 1,
                            icon: AppIcons.uploadIcon,
                            textStyle: AppTextStyles.get14RegularTextStyle(
                              color:  AppColor.disabledColor,
                            ),
                            borderRadius: 4,
                            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                            text: StringConsts.uploadPDF, isSelected: false, onTap: (){})
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 22),
              AppButton(StringConsts.submit, onPressed: (){},backgroundColor: AppColor.violet,),
            ],
          ),
        ),
      ),
    );
  }
}
