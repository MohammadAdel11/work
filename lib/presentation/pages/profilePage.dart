import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/AuthController/profilePageController.dart';
import 'package:herafi/presentation/themes/colors.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePageController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Text('الملف الشخصي',
              style: TextStyle(color: ThemeColors.goldColor)),
          centerTitle: true,
          leading: leading(controller),
          actions: [trailing(controller)],
          backgroundColor: Colors.transparent,
        ),
        body: body(controller));
  }

  Widget body(profilePageController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.grey),
                  child: Icon(
                Icons.person,
                    color: Colors.white,
                    size: 75,
              )),
              SizedBox(width: 15,),
              Text('رقم الهاتف'+":+970595722162")
            ],
          ),
          SizedBox(height: 30,),
          TextFormField(
            decoration: InputDecoration(label: Text("الاسم")),
          ),
          SizedBox(height: 30,),
          Theme(
            data: ThemeData(),
            child: TextButton(
              onPressed: controller.logout,
              child: Row(
                children: [
                  Icon(Icons.logout,color: Colors.white,),
                  SizedBox(width: 10,),
                  Text('تسجيل الخروج',style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
  Widget leading(profilePageController controller){
    return IconButton(
        onPressed: controller.navigateBack,
        icon: Icon(
          Icons.arrow_back_ios,
          color: ThemeColors.goldColor,
        ));
  }
  Widget trailing(profilePageController controller){
    return TextButton(onPressed: controller.saveChanges, child: Text('حفظ'),);
  }
}
