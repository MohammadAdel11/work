import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/AuthController/homePageController.dart';
import 'package:herafi/presentation/pages/account_screen.dart';
import 'package:herafi/presentation/pages/trakingPage.dart';
import '../Widgets/itemInBottomNavigationBar.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});
  @override
  Widget build(BuildContext context){
    final homePageController controller = Get.find();
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: bottomNavigationBar(controller),
        body: Obx(() {
          return getSelectedPage(controller);
        }),
    );
  }

  Widget getSelectedPage(homePageController controller) {
    switch (controller.index.value) {
      case 4:
        return AccountScreen();
      case 3:return trackingPage();
      default:
        return HomePage(controller);
    }
  }
  Widget HomePage(homePageController controller){
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          header(controller),
        ],
      ),
    );
  }
  Widget bottomNavigationBar(homePageController controller) {
    return Builder(builder: (context) {
      return Container(
        height: 70.spMin,
        decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.spMin),
                topRight: Radius.circular(15.spMin))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            itemInBottomNavigationBar(
              icon: Icons.home_outlined,
              index: 0,
            ),
            itemInBottomNavigationBar(
              icon: Icons.shopping_cart_outlined,
              index: 1,
            ),
            itemInBottomNavigationBar(
              icon: Icons.manage_search,
              index: 2,
            ),
            itemInBottomNavigationBar(
              icon: Icons.task,
              index: 3,
            ),
            itemInBottomNavigationBar(
              icon: Icons.person,
              index: 4,
            ),
          ],
        ),
      );
    });
  }

  Widget header(homePageController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Theme(
          data: ThemeData(),
          child: TextButton(
            onPressed: () {
              controller.toChats();
            },
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Obx(() {
                    return Text(
                      controller.chats.fold<int>(0, (sum, combine) {
                        return sum + combine.missedMessagesCountByMe;
                      }).toString(),
                      style: Theme.of(Get.context!).textTheme!.bodySmall!,
                    );
                  }),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Theme(
          data: ThemeData(),
          child: IconButton(
            onPressed: () {
              controller.toChatBot();
            },
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  child: Image.asset('lib/core/utils/images/robot-setting.png'),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
