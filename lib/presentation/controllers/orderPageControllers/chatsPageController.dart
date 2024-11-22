import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/AuthController/homePageController.dart';
import 'package:herafi/presentation/routes/app_routes.dart';

import '../../../domain/entites/chat.dart';

class chatsPageController extends GetxController{
  final homePageController HomePageController;
  final TextEditingController searchController=TextEditingController();

  chatsPageController({required this.HomePageController});

  @override
  void onInit() {
    super.onInit();
  }
  void toChatPage(chatEntity c){
    Get.toNamed(AppRoutes.chatpage,arguments: c);
  }

}