import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

class RepresentativeScreen extends StatelessWidget {
  const RepresentativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.deepPurple, AppColor.deepOrange],
                begin: Alignment.center,
                end: Alignment.bottomLeft,
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(
                    top: 35,
                    bottom: 35,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.buttonOrange),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(radius: 50),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Sujeet Kumar Jain",
                                    style: AppTextStyles.get20BoldTextStyle(),
                                  ),
                                ),

                                Text(
                                  "Senior Relation Manager",
                                  style: AppTextStyles.get12RegularTextStyle(
                                    color: AppColor.colorB1B1B1,
                                  ),
                                ),

                                Divider(color: AppColor.colorE4E4E4),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    StringConsts.about,
                                    style:
                                        AppTextStyles.get16SemiBoldTextStyle(),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Dedicated and detail-oriented with a passion for creating seamless and memorable experiences. From concept to completion, he is specialise in planning and executing a wide range of events—corporate functions, social gatherings, weddings, and more. With strong organisational skills, a creative mindset, and a commitment to client satisfaction, Sujeet ensure every event is professionally managed and uniquely tailored to exceed expectations.",
                                    style: AppTextStyles.get12RegularTextStyle(
                                      color: AppColor.colorB1B1B1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: AppButton(
                          StringConsts.getOnCall,
                          isCurve: true,
                          onPressed: () {},
                          height: 50,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          textStyle: AppTextStyles.get14BoldTextStyle(
                            color: Colors.white,
                          ),
                          backgroundColor: AppColor.buttonOrange,
                        ),
                      ),

                      AppButton(
                        StringConsts.connectOnWhatsapp,
                        isCurve: true,
                        onPressed: () {},
                        height: 50,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        textStyle: AppTextStyles.get14BoldTextStyle(
                          color: Colors.white,
                        ),
                        backgroundColor: AppColor.buttonOrange,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
