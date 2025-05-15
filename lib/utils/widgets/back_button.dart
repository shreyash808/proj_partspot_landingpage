import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.whiteColor,
      ),
      child: Icon(Icons.arrow_back_rounded,size: 14,),
    );
  }
}
