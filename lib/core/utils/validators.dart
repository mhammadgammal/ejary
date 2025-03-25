import 'package:ejary/core/utils/extensions/string_extenstions.dart';

abstract class Validators {
  static String? validateName(String? name) =>
      name == null || name.isEmpty
          ? 'Name is  Required'
          : name.length < 4
          ? 'Name should be at least four characters'
          : null;

  static String? validateEmail(context, String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required'.tr(context);
    } else if (!RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-z]+(.com)*$",
    ).hasMatch(email)) {
      return 'Email is invalid, Please write a valid email'.tr(context);
    }
    return null;
  }

  static String? validatePassword(context, String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required'.tr(context);
    } else if (!RegExp(
      r"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    ).hasMatch(password)) {
      return 'Password should contain:\n- atleast 8 characters\n- at least one digit\n- at least a special character'
          .tr(context);
    }
    return null;
  }

  static String? validataConfirmPassword(String? password1, String? password2) {
    if (password2 == null || password2.isEmpty) {
      return 'Confirm Password is required';
    } else if (password2 != password1) {
      return 'Passwords isn\'t identical';
    }
    return null;
  }

  static String? validatePhone(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone Number is required';
    } else if (!RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(phoneNumber)) {
      return 'Invalid Phone Number';
    }
    return null;
  }

  static String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address field is required';
    }

    return null;
  }
}
