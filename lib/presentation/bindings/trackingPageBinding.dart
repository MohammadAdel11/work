import 'package:get/get.dart';
import '../controllers/trackingPageController.dart';


class trackingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(trackingPageController());
  }
}
