import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class profilePageController extends GetxController{



  void navigateBack(){
    Get.back();
  }
  void saveChanges(){

  }
  void logout(){
    FirebaseAuth.instance.signOut();
  }
}