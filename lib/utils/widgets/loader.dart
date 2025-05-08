import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';


class CircularLoader extends StatelessWidget {
  final double? value;
  final Color? bgColor;
  const CircularLoader({super.key,this.value,this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: value,
        backgroundColor: bgColor,
      ),
    );
  }
}


class FullScreenLoading {
  static void show({String? message}) {
    Get.dialog(
      PopScope(
        canPop: true,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          // height: 120.spH,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          constraints: BoxConstraints(
            maxHeight: 200.0.spH,
            maxWidth: 200.0.spH,
          ),
          child:  Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0.spW,
                    width: 40.0.spW,
                    child: const CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColor.whiteColor),
                      backgroundColor: AppColor.primaryColor,
                    ),
                  ),
                  if (message != null)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.spH,horizontal: 15.spW),
                      child: Text(
                        message,
                        style: AppTextStyles.get14RegularTextStyle(color: AppColor.whiteColor),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
