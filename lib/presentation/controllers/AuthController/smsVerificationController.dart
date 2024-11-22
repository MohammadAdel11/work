import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:herafi/main.dart';
import '../../../global/alers.dart';
import '../../Widgets/progressIndicator.dart';
class smsVerificationController extends GetxController{
  var timer = 60.obs;
  String verificationId;
  final String phoneNumber;
  List<int> codes=List.generate(6, (index)=>0);
  smsVerificationController({required this.verificationId,required this.phoneNumber});
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
  void startTimer()async{
    while(true){
      if(timer!=0)
        timer.value=timer.value-1;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  void goBack(){
    Get.back();
  }
  void sendCode()async{

    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          alerts().showErrorSnackBar(Get.context!, "لقد حدثة مشكلة ما تأكد من الرقم وحاول مرة اخرى");
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationId=verificationId;
          timer.value=60;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
        },
      );

    }
    catch(e){
    }

  }
  void verifyNumber(){
    Get.dialog(
      Center(
        child: progressIndicator(),
      ),
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
    );
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: '123456');
      FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch(e){

    }
    Get.back();
  }
  void onChange(String value,int index,BuildContext context){
    if (value.isNotEmpty) {
      FocusScope.of(context).nextFocus();
    } else {
      FocusScope.of(context).previousFocus();
      return;
    }
    codes[index]=int.parse(value);
  }

}