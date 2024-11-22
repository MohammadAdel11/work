import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app_routes.dart';

class initialPage{
  static bool? isLogIn;
  static ConnectivityResult? result;
  void handleInitialPage(snapshot){
    final User? user=snapshot[0];
    final ConnectivityResult connectivity=snapshot[1][0];


    ///check if change happen

    
    if((user==null)==isLogIn && connectivity==result){
      result=connectivity;
      isLogIn=(user==null);
      return;
    }
    else{
      result=connectivity;
      isLogIn=(user==null);
    }


    if(!connectivity.name.contains('none')){
      if(user!=null){
          Get.offAllNamed(AppRoutes.home);
      }
      else{
        Get.offAllNamed(AppRoutes.introduction);
      }
    }
    else
      Get.offAllNamed(AppRoutes.noInternetConnection);

  }

}