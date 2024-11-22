
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:herafi/data/remotDataSource/chatsRemotDataSource.dart';
import 'package:herafi/domain/usecases/chatUseCases/getStreamMessagesUseCase.dart';
import 'package:herafi/presentation/controllers/orderPageControllers/chatPageController.dart';

import '../../../data/repositroies/ChatRepositoryImpl.dart';
import '../../../domain/usecases/chatUseCases/GetMessagesUseCase.dart';
import '../../../domain/usecases/chatUseCases/SendMessageUseCase.dart';
import '../../controllers/AuthController/homePageController.dart';

class chatPageBinding extends Bindings {
  @override
  void dependencies() {// Dependency Injection
    Get.put(ChatRepositoryImpl(chatsRemotDataSource()));
    Get.put(SendMessageUseCase(Get.find<ChatRepositoryImpl>()));
    Get.put(GetMessagesUseCase(Get.find<ChatRepositoryImpl>()));
    Get.put(getStreamMessagesUseCase(Get.find<ChatRepositoryImpl>()));
    Get.put(chatPageController(
      Get.find<SendMessageUseCase>(),
      Get.find<GetMessagesUseCase>(),
      Get.arguments,
      Get.find<getStreamMessagesUseCase>()
    ));
  }
}
