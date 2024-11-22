import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/orderPageControllers/chatsPageController.dart';

import '../../../domain/entites/chat.dart';

class chatsPage extends StatelessWidget {
  const chatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatsPageController controller = Get.find();
    final List<chatEntity> chats = controller.HomePageController.chats;
    return Scaffold(
      body: SizedBox.expand(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'الرسائل',
                style: Theme.of(context).textTheme!.bodyLarge,
              ),
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                child: TextField(
                  style:Theme.of(context).textTheme!.bodyMedium,
                  decoration: InputDecoration(
                    hintText: 'بحث...',
                    hintStyle: Theme.of(context).textTheme!.bodyMedium,
                    prefixIcon: Icon(Icons.search,color: Colors.white.withOpacity(0.8),size: 40,),

                  ),
                  controller: controller.searchController,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: controller.searchController,
                builder: (BuildContext context, TextEditingValue value, Widget? child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: chats.length,
                      itemBuilder: (ctx, index) {
                        final chat = chats[index];
                        if(chat.user.name.toLowerCase().contains(value.text.toLowerCase().trim()) || value.text.trim().isEmpty)
                          return ListTile(
                            title: Text(chat.user.name.toString()),
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                chat.user.getImage(),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            subtitle: Text(
                              chat.user.phoneNumber.toString(),
                              style: Theme.of(context).textTheme!.bodySmall,
                            ),
                            onTap: () => controller.toChatPage(chat),
                            trailing: chat.lastMessage != null
                                ? Column(
                              children: [
                                chat.missedMessagesCountByMe == 0
                                    ? CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                    chat.missedMessagesCountByMe
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme!
                                        .bodySmall,
                                  ),
                                )
                                    : Container(),
                                Text(chat.lastMessage!.text)
                              ],
                            )
                                : Container(
                              width: 1,
                            ),
                          );
                        else
                          return Container();
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
