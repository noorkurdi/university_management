import 'package:flutter/material.dart';

class AppServices {
  AppServices._();

    static double _getScaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }

  static double getResponsiveFontSize(BuildContext context,
      {required double fontSize}) {
    double scaleFactor = _getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }
}


class AppValidations {
  static String? Function(String?)? requiredValidation = (value) {
    if (value!.isEmpty || value == '') {
      return "هذا الحقل مطلوب";
    } else {
      return null;
    }
  };

  static String? Function(String?)? passwordValidation = (value) {
    if (value!.isEmpty || value == '') {
      return "هذا الحقل مطلوب";
    } else if (value.length < 6) {
      return 'يجب أن تتكون كلمة السر  على الأقل من 6 أحرف';
    } else {
      return null;
    }
  };


  static passwordConfirmationValidation(String? value, String confirmation) {
    if (value!.isEmpty || value == '') {
      return "This field is required";
    } else if (value != confirmation) {
      return "Doesn't confirm the password";
    } else {
      return null;
    }
  }
}
