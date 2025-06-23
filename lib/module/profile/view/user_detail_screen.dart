import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/profile/controller/user_detail_controller.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/constants/validator.dart';
import 'package:partyspot/utils/widgets/app_check_box.dart';
import 'package:partyspot/utils/widgets/app_drop_down.dart';
import 'package:partyspot/utils/widgets/app_text_field.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';
import 'package:partyspot/utils/widgets/loader.dart';

class UserDetailScreen extends StatelessWidget {
  UserDetailScreen({super.key});

  final UserDetailController userDetailController = Get.find<UserDetailController>();



  final TextEditingController _ageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  Future<void> _selectDOB(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime latestAllowedDOB = DateTime(today.year - 12, today.month, today.day);
    final DateTime earliestDOB = DateTime(1900); // Or any reasonable lower limit

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: latestAllowedDOB,
      firstDate: earliestDOB,
      lastDate: latestAllowedDOB,
      helpText: 'Select your date of birth',
    );

    if (picked != null && picked != userDetailController.selectedDate) {
      userDetailController.selectedDate = picked;
      _ageController.text =  DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.deepPurple, AppColor.deepOrange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Obx((){
            if(userDetailController.isBusy){
              return CircularLoader();
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.whiteColor,
              ),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 28),
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CustomSvgPicture(iconPath: AppIcons.backArrowIcon),
                        const SizedBox(width: 6,),
                        Text(StringConsts.fillUpYourDetails,style: AppTextStyles.get24SemiBoldTextStyle())
                      ],
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      title: StringConsts.enterYourName,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validator.validateName(value),
                      initialControllerValue: userDetailController.fullName,
                      onChanged: (val){
                        userDetailController.fullName = val;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      title: StringConsts.enterYourEmail,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      initialControllerValue: userDetailController.email,
                      validator: (value) => Validator.validateEmail(value),
                      onChanged: (val){
                        userDetailController.email = val;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      title: StringConsts.dob,
                      readOnly: true,
                      controller: _ageController,
                      initialControllerValue: userDetailController.selectedDate != null
                          ? DateFormat('dd/MM/yyyy').format(userDetailController.selectedDate
                          ?? DateTime.now()) : null,
                      onTap: (){
                        _selectDOB(context);
                      },
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 8,bottom: 8),
                          child: Text(
                            StringConsts.selectGender,
                            style: AppTextStyles.get14MediumTextStyle(color: AppColor.violetLightColor),
                          ),
                        ),
                        Obx((){
                          return AppDropDown<String?>(
                            value: userDetailController.gender,
                            hint: StringConsts.select,
                            items: ['Male', 'Female', 'Other']
                                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (val) {
                              userDetailController.gender = val;
                            },
                            validator: Validator.validateEmpty,
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 8,bottom: 8),
                          child: Text(
                            StringConsts.enterYourWhatsAppNo,
                            style: AppTextStyles.get14MediumTextStyle(color: AppColor.violetLightColor),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                if(!(userDetailController.loginResponse?.data?.user?.isNumberVerified ?? false)) {
                                  showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    userDetailController.countryCode = country.phoneCode;
                                  },
                                );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDEDED),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Obx((){
                                    return Text(
                                      CountryParser.tryParsePhoneCode(userDetailController.countryCode?.replaceAll("+", "") ?? '91')?.flagEmoji ?? '',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(child: AppTextField(
                              // readOnly: true,
                              autoValidateMode: AutovalidateMode.onUserInteraction,
                              readOnly: true,

                              initialControllerValue: userDetailController.phoneNumber?.toString() ?? '',
                              validator: (value) => Validator.validatePhoneNumber(value),
                            ))
                          ],
                        ),
                      ],
                    ),
                    AppSizes.heightBox(boxHeight: 36),
                    Row(
                      children: [
                        Obx((){
                          return AppCheckBox(
                            value: userDetailController.isTncAccepted,
                            onChanged: (val){
                              userDetailController.isTncAccepted = val;
                            },
                          );
                        }),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '',
                            children: <TextSpan>[
                              TextSpan(
                                  text: StringConsts.agree,
                                  style: AppTextStyles.get14MediumTextStyle(color: AppColor.violetLightColor)),
                              TextSpan(
                                  text: " ${StringConsts.tnc} ",
                                  style: AppTextStyles.get14MediumTextStyle(
                                    color: AppColor.blueLinkColor,
                                  )),
                              TextSpan(
                                  text: StringConsts.andContinue,
                                  style: AppTextStyles.get14MediumTextStyle(color: AppColor.violetLightColor)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Obx((){
                      return AppButton(StringConsts.submit, onPressed: (){
                        if(_formKey.currentState?.validate() ?? false){
                          userDetailController.onUpdateProfile(onSuccess: (){
                            Get.offAndToNamed(Routes.appEntryScreen);
                          });
                        }
                      },
                        isEnabled: userDetailController.isTncAccepted,
                      );
                    })
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}