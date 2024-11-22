import 'package:get/get.dart';
import '../../controllers/ChatbotController.dart';

class ChatbotBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatbotController>(ChatbotController(),permanent: true);
  }
}
