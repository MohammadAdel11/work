import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:herafi/domain/entites/chat.dart';
import 'package:herafi/domain/entites/user.dart';
import 'package:herafi/domain/usecases/chatUseCases/fetchUserChats.dart';
import 'package:herafi/presentation/routes/app_routes.dart';

import '../../../core/status/error/Failure.dart';
import '../../../domain/usecases/chatUseCases/fetchUserData.dart';

class homePageController extends GetxController {
  final fetchUserChatsUseCase fetchChatsUseCase;
  final fetchUserDataUseCase FetchUserData;

  homePageController({required this.fetchChatsUseCase,required this.FetchUserData});
  Rx<UserEntity> userEntity=Rx(UserEntity(name: '', id: '', image: '', createdAt: DateTime.now(), phoneNumber: '', userType: '', location: '', dateOfBirth: DateTime.now()));
  Rx<int> index = 0.obs;
  List list = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxList<chatEntity> chats = <chatEntity>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchChats();
    fetchUserData();
  }

  void orderherafi() {
    Get.toNamed(AppRoutes.orderherafi);
  }

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState!.closeDrawer();
  }

  void navigateProfilePage() {
    Get.toNamed(AppRoutes.profile);
  }

  void navigateSettingPage() {
    Get.toNamed(AppRoutes.setting);
  }

  void navigateOrderHistoryPage() {
    Get.toNamed(AppRoutes.orderHistory);
  }

  bool isSelected(int index) {
    return index == this.index.value;
  }

  void selectItem(int selectedItem) {
    index.value = selectedItem;
  }

  void toChats() {
    Get.toNamed(AppRoutes.chatspage);
  }
  void toChatBot() {
    Get.toNamed(AppRoutes.chatbot);
  }
  void fetchUserData()async{
    Future.delayed(Duration(seconds: 1)).then((onValue)=>Get.toNamed(AppRoutes.accountType));
    final result=await FetchUserData(userId: FirebaseAuth.instance.currentUser!.uid);
    result.fold(
            (left){
          Get.snackbar('خطا', 'لقد حدث خطا ما يرجى المحاولة مرة اخرى');
        },
            (right){
          if(right==null){
            Get.offAllNamed(AppRoutes.accountType);
          }
          else{
            userEntity.value=right;
          }
        }
    );
  }
  void fetchChats() async {
    Either<Failure, List<chatEntity>> chats =
    await fetchChatsUseCase(userId: FirebaseAuth.instance.currentUser!.uid);
    chats.fold((ifLeft) {
      Get.snackbar('مشكلة', 'لقد حدثة مشكلة اثناء تحميل الرسائل');
    }, (ifRight) {
      this.chats.value=ifRight;
    });
  }
}