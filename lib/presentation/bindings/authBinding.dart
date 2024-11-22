import 'package:get/get.dart';

import '../controllers/AuthController/authPageController.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(authPageController());
  }
}
