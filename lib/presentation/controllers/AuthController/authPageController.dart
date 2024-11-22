import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:herafi/global/alers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../Widgets/progressIndicator.dart';
import '../../routes/app_routes.dart';

class authPageController extends GetxController{
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController textFiledController=TextEditingController();
  String countryCode='+970';


  void verify(){
    if(key.currentState!.validate()){
      sendVerificationCode();
    }
  }

  String? validPhoneNumber(String? phoneNumber){
    if(phoneNumber==null || phoneNumber.isEmpty)
      return "لا يمكن ان يكون الحقل فارغا";
    if(phoneNumber.length!=9)
      return "يرجى ادخال رقم صحيح";
    return null;
  }

  void sendVerificationCode()async{
    final String phoneNumber='+970'+textFiledController.text;
    Get.dialog(
      Center(
        child: progressIndicator(),
      ),
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
    );
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+970'+textFiledController.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e){
          print('failed');
          alerts().showErrorSnackBar(Get.context!, "لقد حدثة مشكلة ما تأكد من الرقم وحاول مرة اخرى");
        },
        codeSent: (String verificationId, int? resendToken) {
          print('done');
          Get.back();
          Get.toNamed(AppRoutes.smsVerification,arguments: {"verificationId":verificationId,"phoneNumber":phoneNumber});
        },
        codeAutoRetrievalTimeout: (String verificationId) {
        },
      );

    }
    catch(e){
    }

  }

}