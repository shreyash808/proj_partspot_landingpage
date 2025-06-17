import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class Validator{
  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid number';
    } else if (age < 0) {
      return 'Age cannot be negative';
    } else if (age < 18) {
      return 'You must be at least 18 years old';
    } else if (age > 100) {
      return 'Please enter a realistic age';
    }
    return null;
  }




  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password cannot be empty";
    }
    if (password.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!RegExp(r'^(?=.*[A-Z])').hasMatch(password)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'^(?=.*[a-z])').hasMatch(password)) {
      return "Password must contain at least one lowercase letter";
    }
    if (!RegExp(r'^(?=.*\d)').hasMatch(password)) {
      return "Password must contain at least one number";
    }
    if (!RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>_\-\[\]\\/])').hasMatch(password)) {
      return "Password must contain at least one special character";
    }

    // If all validations pass
    return null;
  }
  static String? validateConfirmPassword(String password,{String? reTypePassword}){
    if(reTypePassword != null && password != reTypePassword){
      return "Entered passwords don’t match";
    }
    return null;
  }

  static String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }else if (value.length < 3) {
      return 'Must be at least 3 characters long';
    }
    return null; // Valid input
  }

  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null; // Valid input
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid phone number.';
    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Please enter a valid phone number.';
    } else if (value.length < 9) {
      return 'Please enter a valid phone number.';
    }
    return null; // Valid input
  }

  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Name cannot be empty.";
    }

    if (name.length < 2 || name.length > 30) {
      return "Name must be between 2 and 30 characters.";
    }

    // Allow letters (including accented), spaces, hyphens, and apostrophes
    final nameRegex = RegExp(r"^[\p{L}\s'-]+$", unicode: true);
    if (!nameRegex.hasMatch(name)) {
      return 'Name contains invalid characters.';
    }

    return null; // Valid input
  }

  static String? validateUsername(String username) {
    // Check if the username is empty
    if (username.isEmpty) {
      return "Username cannot be empty.";
    }

    // Check if the username is between 3 and 15 characters
    if (username.length < 3 || username.length > 20) {
      return "Username must be between 2 and 20 characters";
    }

    // Check if the username starts with a number
    if (RegExp(r'^\d').hasMatch(username)) {
      return "Username cannot start with a number";
    }

    // Check if the username contains only letters, periods, underscores, and numbers
    if (!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(username)) {
      return "Username can only contain letters, periods, underscores, and numbers";
    }

    // Check if the username contains at least one alphanumeric character
    if (!RegExp(r'[a-zA-Z0-9]').hasMatch(username)) {
      return "Username should be at least alphanumeric";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (GetUtils.isEmail(email ?? '')) {
      return null;
    }
    return StringConsts.enteredEmailIsIncorrect;
  }

}