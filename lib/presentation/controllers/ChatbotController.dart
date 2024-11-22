import 'dart:async';
import 'package:get/get.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';

class ChatbotController extends GetxController {
  final TextEditingController textController=TextEditingController();
  // Initialize OpenAI instance
  late OpenAI openAI;
  // Observables for managing loading state and messages
  var isLoading = false.obs;
  var chatMessages = <Messages>[].obs;
  String? threadId;
  final String assistantId='asst_p6PPNuKhw74ifZTv4kuJoFeH';
  final double borderRadius=15;

  @override
  void onInit() {
    super.onInit();
    openAI = OpenAI.instance.build(
      token: "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", // Replace with your API key
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
      ),
      enableLog: true,
    );
    createThread();
  }

  Future createThread()async{
    final thread = await openAI.threads.createThread();
    threadId=thread.id;
  }
  void createPrompt(String prompt) async {
    try {
      this.chatMessages.add(Messages(role: Role.user,content: prompt));
      isLoading.value=true;

      if(threadId==null){
        await createThread();
      }
      await openAI.threads.v2.messages.createMessage(
        threadId: threadId!,
        request: CreateMessage(
          role: "user",
          content: prompt,
        ),
      );
      await openAI.threads.runs.createRun(
        threadId: threadId!,
        request: CreateRun(
          assistantId: assistantId,
        ),
      );


      late MessageDataResponse messages;
      double time=0;
      


      while(true){
        if(time>10){
          Get.snackbar("خطأ","لقد حدث خطأ الرجاء المحاولة مرة اخرى لاحقا");
          return;
        }
        await Future.delayed(Duration(milliseconds: 500)); // Wait for a few seconds
        messages = await openAI.threads.v2.messages.listMessage(threadId: threadId!);
        if(messages.data.length!=this.chatMessages.length && messages.data.first.content.length!=0){
          break;
        };
        time+=0.5;
      }

      if (messages.data.isNotEmpty) {
          this.chatMessages.add(Messages(role: Role.assistant,content: messages.data.first.content.first.text.value));
          isLoading.value=false;
      } else {
      }
    } catch (e) {
      Get.snackbar("خطأ","لقد حدث خطأ الرجاء المحاولة مرة اخرى");
    }
  }

}
