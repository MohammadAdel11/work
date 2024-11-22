import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herafi/global/constants.dart';
import 'package:herafi/presentation/controllers/AuthController/introductionPageController.dart';

class introductionPage extends StatelessWidget {
  const introductionPage({super.key});
  @override
  Widget build(BuildContext context) {
    final introductionPageController controller=Get.find();
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Text(constants.appName,style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: 30,),
              Image.asset('lib/core/utils/images/dealing.png',height: Get.height*0.4,),
              SizedBox(height: 60,),
              SizedBox(
                width: Get.width*0.8,
                child: TextButton(
                    onPressed: controller.start,
                    child: Text(
                      "ابدأ",
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
