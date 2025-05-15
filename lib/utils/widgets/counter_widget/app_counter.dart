import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/counter_widget/app_counter_controller.dart';

class AppCounter extends StatelessWidget {
  final AppCounterController controller;
  final ValueChanged<int> onChanged;

  const AppCounter({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    controller.counterRx.listen((value) => onChanged(value));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderGreyColor),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Obx(() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: controller.decrement,
            child: Icon(
              Icons.remove,
              size: 18,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${controller.counter}',
            style: AppTextStyles.get20BoldTextStyle(),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: controller.increment,
            child: Icon(
              size: 18,
              Icons.add,
            ),
          ),
        ],
      )),
    );
  }
}
