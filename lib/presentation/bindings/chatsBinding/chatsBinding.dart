import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/orderPageControllers/chatsPageController.dart';

class chatsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>chatsPageController(HomePageController: Get.find()));
  }
}
