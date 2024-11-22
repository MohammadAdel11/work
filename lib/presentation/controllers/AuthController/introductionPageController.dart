import 'package:get/get.dart';
import 'package:herafi/presentation/routes/app_routes.dart';

class introductionPageController extends GetxController{


  void start(){
    Get.toNamed(AppRoutes.auth);
  }
}