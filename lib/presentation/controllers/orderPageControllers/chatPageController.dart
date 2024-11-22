import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/entites/Message.dart';
import '../../../domain/entites/chat.dart';
import '../../../domain/usecases/chatUseCases/GetMessagesUseCase.dart';
import '../../../domain/usecases/chatUseCases/SendMessageUseCase.dart';
import '../../../domain/usecases/chatUseCases/getStreamMessagesUseCase.dart';
import '../../../global/setOfMethods.dart';
import '../../Widgets/showImage.dart';

class chatPageController extends GetxController{
  final SendMessageUseCase sendMessageUseCase;
  final GetMessagesUseCase getMessagesUseCase;
  final getStreamMessagesUseCase GetStreamMessagesUseCase;
  final chatEntity chat;
  chatPageController(this.sendMessageUseCase, this.getMessagesUseCase,this.chat,this.GetStreamMessagesUseCase);

  var isLoading = true.obs;
  RxBool isFinishedFetchingMessages=RxBool(false);
  final int index=0;
  var messages = <Message>[].obs;
  var messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void onInit() {
    super.onInit();
    GetStreamMessages();
    scrollController.addListener(_scrollListener);
  }

  Future<void> loadMessages() async {
    final result = await getMessagesUseCase.call(chat);
    result.fold(
          (failure) {
        Get.snackbar('خطأ', 'فشل في تحميل الرسائل');
      },
          (messageList) {
            isFinishedFetchingMessages.value=messageList.length<20;
        messages.addAll(messageList);
      },
    );
    isLoading.value=false;
  }

  Future<void> sendMessage({String? outerMessage,String? resource}) async {
    if (messageController.text.isNotEmpty || resource!=null) {
      final message = Message(
        senderId: currentUserId,
        text: outerMessage??messageController.text.trim(),
        timestamp: DateTime.now(),
        resource: resource
      );

      final result = await sendMessageUseCase.execute(message);
      result.fold(
            (failure) {
          Get.snackbar('خطأ', 'فشل في إرسال الرسالة');
        },
            (_) {
          messageController.clear();
        },
      );
    }
  }
  void GetStreamMessages()async{
    final result=await GetStreamMessagesUseCase(chat);
    result.fold((ifLeft){
      Get.snackbar('خطأ', 'فشل في إرسال الرسالة');
    }, (right){
      right.listen((data){
        if(messages.isEmpty){
          messages.addAll(data);
          messages.refresh();
          isFinishedFetchingMessages.value=data.length<20;
          return;
        }
        data.forEach((message){
          //first Retrieve
          if(!messages.contains(message)){
            messages.insert(0, message);
          }
        });
        scrollController.animateTo(scrollController.position.minScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeIn);
      });

    });

    isLoading.value=false;
  }

  void _scrollListener()async{
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if(!isFinishedFetchingMessages.value){
        loadMessages();
      }
    }
  }
  void sendImageMessage()async{
    final TextEditingController controller=TextEditingController();
    String? image=await globalMethods().selectPhoto(context: Get.context!);
    if(image==null)return;
    Get.dialog(
        AlertDialog(backgroundColor:Theme.of(Get.context!).primaryColor,
      title: Text('ارفاق صورة',style: Theme.of(Get.context!).textTheme!.bodyLarge,),
      alignment: Alignment.center,
      content: Wrap(
        children: [
          Image.file(File(image!)),SizedBox(height: 3,),
          TextField(controller: controller,)
        ],
      ),
      actions: [
        TextButton(onPressed: ()async{
          sendMessage(resource: image,outerMessage: controller.text);
          Get.back();
        }, child: Text('ارسال')),
        TextButton(onPressed: (){Get.back();}, child: Text('الغاء'))
      ],
      actionsAlignment: MainAxisAlignment.center,
    ));
  }
  void handleImageTap(String imageSource){
    Get.to(imageViewWithInteractiveView(title: 'صورة', image: imageSource,));
  }
}