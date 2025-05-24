import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';

class FaqCard extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final List<FaqItem> faqList;

  const FaqCard({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.faqList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title,
                  style: AppTextStyles.get20BoldTextStyle(color: Colors.white),
                ),
              ),
              ...faqList.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.question,
                        style: AppTextStyles.get14MediumTextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        item.answer,
                        style: AppTextStyles.get12RegularTextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}
