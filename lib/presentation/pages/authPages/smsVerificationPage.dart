import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:herafi/presentation/controllers/AuthController/smsVerificationController.dart';
import '../../themes/colors.dart';

class smsVerificationPage extends StatelessWidget {
  const smsVerificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    final smsVerificationController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              color: ThemeColors.goldColor,
              onPressed: controller.goBack,
              icon: Icon(
                Icons.arrow_back_ios_new,
              )),
          actions: [trailing(controller)],
          backgroundColor: Colors.transparent,
          title:
              Text("تاكيد رقم الهاتف", style: TextStyle(color: Colors.white)),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text('لقد تم ارسال رقم تاكيد يرجى ادخاله والاتسمرار'),
              SizedBox(
                height: 30,
              ),
              Row(
                  children: List.generate(6, (index) {
                return number(Get.size, index, context,controller);
              })),
              SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: controller.verifyNumber, child: Text("تاكيد الرقم")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container number(Size size, int index, BuildContext context,smsVerificationController controller) {
    return Container(
      margin: EdgeInsets.all(5),
      width: size.width * 0.13,
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey,
          border: InputBorder.none,
          enabledBorder: UnderlineInputBorder(),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        onChanged:(value)=>controller.onChange(value,index,context),
      ),
    );
  }

  Widget resendCode(smsVerificationController controller) {
    return TextButton(onPressed:controller.sendCode, child: Text('resend'));
  }

  Widget trailing(smsVerificationController controller) {
    return Obx(() {
      if (controller.timer == 0)
        return resendCode(controller);
      else
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${controller.timer}',
            style: TextStyle(color: Colors.white),
          ),
        );
    });
  }
}
