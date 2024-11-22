import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/AuthController/introductionPageController.dart';

import '../controllers/AuthController/introductionPageController.dart';


class introductionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(introductionPageController());
  }
}
