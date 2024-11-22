import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herafi/main.dart';
import 'package:herafi/presentation/controllers/AuthController/settingPageController.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';

class settingPage extends StatelessWidget {
  const settingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingPageController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: leading(controller),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'الاعدادات',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          ListTile(
            title: Text(
              'المواقع المسجلة',
            ),
            leading: Icon(
              Icons.location_on,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'تواصل مع الدعم',
            ),
            leading: Icon(
              Icons.message,
            ),
            onTap: controller.contactAdham,
          ),

          ListTile(
            title: Text(
              'تسجيل الخروج',
            ),
            leading: Icon(
              Icons.logout,
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }

  Widget leading(settingPageController controller) {
    return IconButton(
        onPressed: controller.navigateBack,
        icon: Icon(
          Icons.arrow_back_ios,
          color: ThemeColors.goldColor,
        ));
  }
}
