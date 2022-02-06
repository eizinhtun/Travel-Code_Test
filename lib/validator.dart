// @dart=2.9
import 'package:flutter/material.dart';

class Validator {
  static String email(
      BuildContext context, String value, String fieldName, bool isRequired) {
    if (isRequired) {
      if (value.isEmpty) {
        return "Email is Required";
      }
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (regex.hasMatch(value)) {
      return null;
    } else {
      return "Email is not valid!";
    }
  }

  static String phone(
      BuildContext context, String value, String countryCode, bool isRequired) {
    RegExp phoneExp =
        RegExp(r'(^09\d{6,9}|^08\d{6,9}|^06\d{6,9}|^1[0-9]{10})$');

    RegExp mmPhoneExp = RegExp(r'^09\d{6,9}$');
    RegExp sgPhoneExp = RegExp(r'^(6|8|9)\d{7}$');
    RegExp chPhoneExp = RegExp(
        r'^1(?:3(?:4[^9\D]|[5-9]\d)|5[^3-6\D]\d|7[28]\d|8[23478]\d|9[578]\d)\d{7}$');
    RegExp mlPhoneExp = RegExp(r'^(1)[0-46-9]*[0-9]{7,8}$');

    RegExp thPhoneExp = RegExp(r'^9\d{6,9}|^8\d{6,9}|^6\d{6,9}$');
    RegExp regExp = RegExp(r'^09\d{6,9}$');
    switch (countryCode) {
      case "+95":
        regExp = mmPhoneExp;
        break;
      case "+65":
        regExp = sgPhoneExp;
        break;
      case "+60":
        regExp = mlPhoneExp;
        break;
      case "+66":
        regExp = thPhoneExp;
        break;
      case "+86":
        regExp = chPhoneExp;
        break;
    }

    if (isRequired) {
      if (value.isEmpty) {
        return "Phone Number is Required!";
      }
    }

    if (value.isEmpty) {
      return "Enter mobile number";
    } else if (!regExp.hasMatch(value)) {
      return "Enter valid mobile number";
    }

    return null;
  }

  static String requiredField(
      BuildContext context, String value, String fieldName) {
    if (value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String dateOfBirth(
      BuildContext context, String value, bool isRequired) {
    if (isRequired) {
      if (value.isEmpty || value == "DD/MM/YYYY") {
        return "Date of Birth is Required";
      }
    }
    return null;
  }
}
