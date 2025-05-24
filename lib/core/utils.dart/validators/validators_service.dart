import 'package:flutter/material.dart';

class Validators {
  static bool validateForm(GlobalKey<FormState> formKey) {
    return (formKey.currentState?.validate() ?? false);
  }

  static String? requiredField(String? value) {
    if (value != null) {
      if (value.isNotEmpty) {
        return null;
      }
    }
    return "This field is required";
  }
}
