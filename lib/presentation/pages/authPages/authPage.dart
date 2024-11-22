import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herafi/global/commonBorder.dart';
import 'package:herafi/presentation/controllers/AuthController/authPageController.dart';
import 'package:herafi/presentation/routes/app_routes.dart';
import 'package:herafi/presentation/themes/colors.dart';

class authPage extends StatelessWidget {
  const authPage({super.key});
  @override
  Widget build(BuildContext context) {
    final authPageController controller = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'التسجيل',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'ادخل رقم هاتفك للبدء',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      child: Form(
                    key: controller.key,
                    child: TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(9)],
                      validator: controller.validPhoneNumber,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context).textTheme!.bodyMedium,
                      controller: controller.textFiledController,
                      decoration: InputDecoration(
                        prefix: Text(
                          'رقم الهاتف: ',
                          style: Theme.of(context).textTheme!.bodyMedium,
                        ),
                        label: Text('+970'),
                        hintText: "5XXXXXXXX",
                      ),
                    ),
                  )
                  )
                ],
              ),
              ...[
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: "اوافق على "),
                      TextSpan(
                          text: "الشروط والاحكام",
                          style: TextStyle(color: Theme.of(context).focusColor),
                          recognizer: TapGestureRecognizer()..onTap = ()=>Get.toNamed(AppRoutes.privacyPolicy)),
                    ]))
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width * 0.8,
                      child: TextButton(
                          onPressed: controller.verify,
                          child: Text('تاكيد رقم الهاتف')),
                    ),
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
