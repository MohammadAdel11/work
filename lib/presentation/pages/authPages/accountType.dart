import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herafi/presentation/routes/app_routes.dart';
import '../../Widgets/CustomButton.dart';

class AccountType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اختار نوع الحساب للبدء'),backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  icon: Icons.person,
                  label: 'حساب العميل',
                  onPressed: () => Get.toNamed(AppRoutes.registerCustomer),
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  icon: Icons.work,
                  label: 'حساب الحرفي',
                  onPressed: () => Get.toNamed(AppRoutes.registerCraftsman),
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}