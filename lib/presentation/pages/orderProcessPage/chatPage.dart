import 'package:cached_network_image/cached_network_image.dart';
import 'package:herafi/presentation/controllers/orderPageControllers/chatPageController.dart';
import 'package:flutter/material.dart';
import 'package:herafi/presentation/Widgets/progressIndicator.dart';
import 'package:get/get.dart';

import '../../Widgets/leadingAppBar.dart';
import '../../Widgets/showImage.dart';

class chatPage extends StatelessWidget {
  const chatPage({super.key});
  @override
  Widget build(BuildContext context) {
    final chatPageController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                controller.chat.user.getImage(),
              ),
              backgroundColor: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Text(controller.chat.user.name)
          ],
        ),
        leading: leadingAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value)
                return progressIndicator();
              else {
                return Container(
                  color: Theme.of(context).primaryColor,
                  child: ListView.builder(
                    reverse: true,
                    controller: controller.scrollController,
                    itemCount: controller.messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index != controller.messages.length) {
                        final message = controller.messages[index];
                        return ListTile(
                          title: Align(
                            alignment:
                                message.senderId == controller.currentUserId
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:
                                    message.senderId == controller.currentUserId
                                        ? Colors.blueAccent
                                        : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  if (message.resource != null)
                                    GestureDetector(
                                      child: Hero(

                                        tag: message.resource!,
                                        child: CachedNetworkImage(
                                          imageUrl: message.resource!,
                                          width: Get.width * 0.6,
                                        ),
                                      ),
                                      onTap: () {
                                        controller.handleImageTap(message.resource!);
                                      },
                                    ),
                                  Text(
                                    message.text,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: message.senderId ==
                                              controller.currentUserId
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        if (controller.isFinishedFetchingMessages.value)
                          return Container();
                        else
                          return Center(child: progressIndicator());
                      }
                    },
                  ),
                );
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.messageController,
                    decoration: InputDecoration(hintText: 'اكتب رسالة...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.image_outlined),
                  onPressed: controller.sendImageMessage,
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: controller.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
