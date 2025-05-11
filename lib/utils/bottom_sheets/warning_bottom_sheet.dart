import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

Future<bool?> showWarningBottomSheet({required BuildContext context,String? title,Function()? onYes,String? icon}) async {
  return await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Wrap(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.spH,vertical: 24.spH),
            child: Column(
              children: [
                if(icon != null)
                  CustomSvgPicture(iconPath: icon),
                Text(title ?? '',textAlign: TextAlign.center,
                  style: AppTextStyles.get16BoldTextStyle(),
                ),
                AppSizes.heightBox(boxHeight: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppOutlinedButton(
                        StringConsts.yes.tr,
                        onPressed: onYes,
                      ),
                    ),
                    AppSizes.widthBox(boxWidth: 10),
                    Expanded(
                      flex: 2,
                      child: AppButton(
                        StringConsts.no.tr,
                        onPressed: () {
                          Get.back(result: false);
                        },
                      ),
                    )
                  ],
                ),
                AppSizes.heightBox(boxHeight: 20),
              ],
            ),
          )
        ],
      );
    },
  ) ?? false;
}
