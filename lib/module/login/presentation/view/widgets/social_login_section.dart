import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/login/presentation/controller/login_controller.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class SocialLoginSection extends StatelessWidget {
  SocialLoginSection({super.key});
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Divider(color: AppColor.colorD9D9D9),
        ),

        SocialLoginButton(
          text: StringConsts.conWithApple,
          iconPath: AppIcons.appleIcon,
          onTap: () => print("Apple login tapped"),
        ),
        const SizedBox(height: 10),
        SocialLoginButton(
          text: StringConsts.conWithGoogle,
          iconPath: AppIcons.googleIcon,
          onTap: (){
            loginController.onGoogleSignIn(onSuccess: (){
              Get.toNamed(Routes.appEntryScreen);
            });
          },
        ),
      ],
    );
  }

  SocialLoginButton({
    required String text,
    required String? iconPath,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.colorD9D9D9, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CustomSvgPicture(iconPath: iconPath,height: 24,width: 24,fit: BoxFit.fitHeight),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.color727272,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
