import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

import '../widgets/text_view.dart';

void showActionAlertDialog(
    {required BuildContext context,
    required String title,
    required String icon,
    String? subtitle,
    required Function onYes}) {
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      height: 280.spH,
      padding: EdgeInsets.symmetric(horizontal: 20.spW),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          AppSizes.heightBox(boxHeight: 30),
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: const Color(0XFF9E3488).withOpacity(0.26),blurStyle: BlurStyle.normal,
                      blurRadius: 8.4,
                      spreadRadius: 0,
                      offset: const Offset(0, 4))
                ],
              ),
              child: SvgPicture.asset(
                icon,
              )),
          AppSizes.heightBox(boxHeight: 20),
          TextView(
            title,
            style: AppTextStyles.get16BoldTextStyle(color: AppColor.blackColor),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) AppSizes.heightBox(boxHeight: 10),
          if (subtitle != null)
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.get14RegularTextStyle(color: AppColor.lightTextColor),
            ),
          AppSizes.heightBox(boxHeight: 30),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: AppOutlinedButton(
                  StringConsts.yes,
                  height: 60.spH,
                  // width: 100.spW,
                  onPressed: () {
                    onYes();
                  },
                ),
              ),
              AppSizes.widthBox(boxWidth: 10),
              Expanded(
                flex: 2,
                child: AppButton(
                  StringConsts.no,
                  height: 60.spH,
                  //width: 177.spW,
                  onPressed: () {
                    Get.back();
                  },
                ),
              )
            ],
          )
        ],
      ),
    ),
  ));
}
