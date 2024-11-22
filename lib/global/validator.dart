import 'package:flutter/cupertino.dart';

class Validator {
  String? validEmail(String? email, BuildContext context) {
    String pattern = r'\w+@\w+\.\w+';
    RegExp regExp = RegExp(pattern);
    if (email == null || email.isEmpty) {
      return 'لا يمكن أن يكون حقل البريد الإلكتروني فارغًا';
    }
    if (!regExp.hasMatch(email)) {
      return 'يرجى كتابة البريد الإلكتروني بشكل صحيح';
    }
    return null;
  }

  String? validUserName(String? userName, BuildContext context) {
    if (userName == null || userName.isEmpty) {
      return 'يجب كتابة الاسم';
    }
    return null;
  }

  String? validPassword(String? password, BuildContext context) {
    if (password == null || password.isEmpty) {
      return 'لا يمكن أن يكون حقل كلمة المرور فارغًا';
    } else if (password.length < 6) {
      return 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل';
    }
    return null;
  }

  String? validEmailAddress(String? emailAddress, BuildContext context) {
    if (emailAddress == null || emailAddress.isEmpty) {
      return 'لا يمكن أن يكون حقل البريد الإلكتروني فارغًا';
    }
    return null;
  }
  String? validPhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty ) {
      return 'لا يمكن أن يكون حقل الرقم فارغًا';
    }
    else if(phoneNumber.length<9)
      return 'يجب ان يكون الرقم صحيح 9 ارقام على الاقل';
    return null;
  }
}
