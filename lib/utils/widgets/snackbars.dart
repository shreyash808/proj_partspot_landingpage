import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/text_view.dart';

void showSnackBar(BuildContext context, {required String? text, Color? color, Color? textColor, bool? isError}) {
  if(text == null || text.isEmpty){
    return;
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.spW),
          child: Icon(
            isError == true ? Icons.error_outline_rounded : Icons.check_circle,
            color: AppColor.whiteColor,
          ),
        ),
        Expanded(
          child: TextView(
            text ?? 'Something went wrong!',
            style: AppTextStyles.get16RegularTextStyle(color: textColor ?? AppColor.whiteColor),
          ),
        )
      ],
    ),
    backgroundColor: color ?? (isError == true ? AppColor.errorColor : AppColor.primaryColor),
  ));
}
