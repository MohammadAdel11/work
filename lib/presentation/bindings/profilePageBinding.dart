import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/AuthController/profilePageController.dart';


class profilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(profilePageController());
  }
}
