
import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/AuthController/settingPageController.dart';

class settingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(settingPageController());
  }
}
