
import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/AuthController/orderHistoryPageController.dart';

class orderHistoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(orderHistoryPageController());
  }
}
