import 'package:flutter/material.dart';

class trnaslateErrorMessage {
  static String handleFirebaseAuthException(errorCode) {
    final errorMessages = {
      'invalid-email': {
        'en': 'The email address you entered is invalid.',
        'ar': 'البريد الإلكتروني الذي أدخلته غير صالح.'
      },
      'user-disabled': {
        'en': 'Your account has been disabled. Please contact support for assistance.',
        'ar': 'تم تعطيل حسابك. يرجى الاتصال بالدعم للحصول على المساعدة.'
      },
      'invalid-credential': {
        'en': 'The password or email you entered is incorrect. Please try again.',
        'ar': 'كلمة المرور أو البريد الإلكتروني الذي أدخلته غير صحيح. الرجاء المحاولة مرة أخرى.'
      },
      'email-already-in-use': {
        'en': 'This email address is already in use. Please try another email.',
        'ar': 'البريد الإلكتروني هذا مستخدم بالفعل. الرجاء تجربة بريد إلكتروني آخر.'
      },
      'weak-password': {
        'en': 'The password you entered is too weak. Please create a stronger password.',
        'ar': 'كلمة المرور التي أدخلتها ضعيفة للغاية. الرجاء إنشاء كلمة مرور أقوى.'
      },
      'operation-not-allowed': {
        'en': 'This operation is not allowed. Please contact support for assistance.',
        'ar': 'هذه العملية غير مسموح بها. الرجاء الاتصال بالدعم للحصول على المساعدة.'
      },
      "too-many-requests": {
        'en': 'Too many login attempts. Please try again later.',
        'ar': 'لقد تجاوزت عدد مرات المحاولات. يرجى المحاولة مرة أخرى في وقت لاحق.'
      },
      "invalid-verification-code": {
        'en': 'The verification code is invalid. Please check the code and try again.',
        'ar': 'الرمز غير صالح. يرجى التحقق من الرمز والمحاولة مرة أخرى.'
      },
      "user-not-found": {
        'en': 'No account found with this email address.',
        'ar': 'لا يوجد حساب مرتبط بهذا البريد الإلكتروني.'
      },
      'account-exists-with-different-credential': {
        'en': 'An account already exists with a different sign-in.',
        'ar': 'هناك حساب موجود بالفعل باستخدام  هذه الايميل`.'
      },
      'auth/cancelled-popup-request': {
        'en': 'The Facebook login popup was closed before completion.',
        'ar': 'تم إغلاق نافذة تسجيل الدخول باستخدام الفيسبوك قبل اكتمال العملية.'
      },
      'auth/user-disabled': {
        'en': 'The Facebook account associated with the login attempt is disabled.',
        'ar': 'تم تعطيل الحساب المرتبط بمحاولة تسجيل الدخول باستخدام الفيسبوك.'
      },
      'auth/user-not-found': {
        'en': 'The Facebook account used for login does not exist.',
        'ar': 'الحساب المستخدم لتسجيل الدخول باستخدام الفيسبوك غير موجود.'
      },
      'requires-recent-login': {
        'en': 'requires recent login',
        'ar': 'يتطلب الامر عملية اعادة تسجيل دخول ثم المحاوله مرة اخرى'
      },
    };


    final currentLanguage = 'ar';

    // Provide a default message if the error code is not found
    // Determine the current language
    if (!errorMessages.containsKey(errorCode)) {
      return currentLanguage == 'ar'
          ? 'حدث خطأ غير متوقع أثناء المصادقة. الرجاء المحاولة مرة أخرى.'
          : 'An unexpected error occurred during authentication. Please try again.';
    }


    // Return the translated error message based on the current language
    return errorMessages[errorCode]![currentLanguage]!;
  }
}
