import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

import '../widgets/text_view.dart';

void showSuccessfulAlertDialog(
    {required BuildContext context,
    required String title,
    required String subtitle,
    required Function onTap,
    double? height,
    required String buttonTitle}) {
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: PopScope(
      canPop: false,
      child: Container(
        width: AppSizes.width,
        padding: EdgeInsets.symmetric(horizontal: 20.spW),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSizes.heightBox(boxHeight: 30),
            Container(
                height: 61.spH,
                width: 61.spW,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Color(0XFF9E3488), blurRadius: 8.4, spreadRadius: 0, offset: Offset(0, 4))
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColor.steelPinkColor, AppColor.purpleDarkColor],
                  ),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30.spH,
                )),
            AppSizes.heightBox(boxHeight: 20),
            TextView(title, style: AppTextStyles.get16BoldTextStyle(color: AppColor.blackColor),textAlign: TextAlign.center,),
            if (subtitle.isNotEmpty) AppSizes.heightBox(boxHeight: 10),
            if (subtitle.isNotEmpty)
              TextView(
                subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.get14RegularTextStyle(color: AppColor.lightTextColor),
              ),
            AppSizes.heightBox(boxHeight: 30),
            AppButton(
              buttonTitle,
              height: 60.spH,
              width: 216.spW,
              onPressed: () {
                onTap();
              },
            ),
            AppSizes.heightBox(boxHeight: 20),
          ],
        ),
      ),
    ),
  ));
}
