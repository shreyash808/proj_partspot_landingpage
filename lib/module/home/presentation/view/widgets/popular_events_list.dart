import 'package:flutter/material.dart';
import 'package:partyspot/module/home/presentation/view/widgets/event_item.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart'
    show AppTextStyles;
import 'package:partyspot/utils/constants/string_consts.dart' show StringConsts;

class PopularEventsList extends StatelessWidget {
  const PopularEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConsts.popularEvents,
            style: AppTextStyles.get20MediumTextStyle(),
          ),
          const SizedBox(height: 8),
          Column(
            children: List.generate(3, (index) {
              return EventItem();
            }),
          ),
        ],
      ),
    );
  }

}
