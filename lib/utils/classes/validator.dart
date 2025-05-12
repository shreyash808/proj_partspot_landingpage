// import 'package:get/get.dart';
// import 'package:partyspot/utils/constants/string_consts.dart';

// class Validator{


//   static String? validatePassword(String password) {
//     if (password.isEmpty) {
//       return StringConsts.passwordCannotBeEmpty.tr;
//     }
//     if (password.length < 4) {
//       return StringConsts.passwordMustBeFourCharLong.tr;
//     }
//     // if (!RegExp(r'^(?=.*[A-Z])').hasMatch(password)) {
//     //   return StringConsts.passwordMustContainAtLeastOneUppercase.tr;
//     // }
//     // if (!RegExp(r'^(?=.*[a-z])').hasMatch(password)) {
//     //   return StringConsts.passwordMustContainAtLeastOneLowercase.tr;
//     // }
//     // if (!RegExp(r'^(?=.*\d)').hasMatch(password)) {
//     //   return StringConsts.passwordMustContainAtLeastOneNumber.tr;
//     // }
//     // if (!RegExp(r'^(?=.*[!@#$&*~%^(){}[\]:;<>,.?/\\|_+=-])').hasMatch(password)) {
//     //   return StringConsts.passwordMustContainAtLeastOneSpecialChar.tr;
//     // }
//     return null;
//   }

//   static String? validateConfirmPassword(String password,{String? reTypePassword}){
//     if(reTypePassword != null && password != reTypePassword){
//       return StringConsts.enteredPasswordsDontMatch.tr;
//     }
//     return null;
//   }

//   static String? validateEmail(String email) {
//     if (GetUtils.isEmail(email)) {
//       return null;
//     }
//     return StringConsts.enteredEmailIsIncorrect.tr;
//   }

//   static String? validatePhoneNumber(String email) {
//     if (GetUtils.isPhoneNumber(email)) {
//       return null;
//     }
//     return StringConsts.enteredPhoneNumberIsIncorrect.tr;
//   }

//   static String? validateUsername(String username) {
//     // Check if the username is empty
//     if (username.isEmpty) {
//       return StringConsts.userNameCannotBeEmpty.tr;
//     }

//     // Check if the username is between 3 and 15 characters
//     if (username.length < 6 || username.length > 15) {
//       return StringConsts.userNameMustBeBetweenTheseChar.tr;
//     }

//     // Check if the username starts with a number
//     if (RegExp(r'^\d').hasMatch(username)) {
//       return StringConsts.userNameCannotStartWithNumber.tr;
//     }

//     // Check if the username contains only letters, periods, underscores, and numbers
//     if (!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(username)) {
//       return StringConsts.userNameCanOnlyContain.tr;
//     }

//     // Check if the username contains at least one alphanumeric character
//     if (!RegExp(r'[a-zA-Z0-9]').hasMatch(username)) {
//       return StringConsts.userNameShouldBeAlphaNumeric.tr;
//     }
//     return null;
//   }

//   static String? validateName(String? name) {
//     if (name?.isEmpty ?? true) {
//       return StringConsts.nameCannotBeEmpty.tr;
//     }

//     if ((name?.length ?? 0) > 30) {
//       return StringConsts.nameMustBeBetween.tr;
//     }

//     // Allow English (A-Z, a-z), Arabic characters, and spaces
//     if (!RegExp(r"^[\p{L}\s]+$", unicode: true).hasMatch(name ?? '')) {
//       return StringConsts.invalidName.tr;
//     }

//     return null;
//   }

//   static String? validateLastName(String? name) {
//     // Allow empty last name
//     if (name?.isEmpty ?? true) {
//       return null;
//     }

//     // Check length if not empty
//     if ((name?.length ?? 0) > 30) {
//       return StringConsts.nameMustBeBetween.tr;
//     }

//     // Allow only letters and spaces
//     if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(name ?? '')) {
//       return StringConsts.invalidName.tr;
//     }

//     return null;
//   }


// }