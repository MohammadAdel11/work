import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herafi/presentation/controllers/AuthController/orderHistoryPageController.dart';

import '../themes/colors.dart';
class orderHistoryPage extends StatelessWidget {
  const orderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderHistoryPageController controller=Get.find();
    return Scaffold(
      appBar: AppBar(leading: leading(controller),backgroundColor: Colors.transparent,),
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.library_add_check_rounded,color: Colors.white,size: 50,),
            Text('لا يوحد طلبات سابقة',style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
  Widget leading(orderHistoryPageController controller){
    return IconButton(onPressed:controller.navigateBack, icon: Icon(Icons.arrow_back_ios,color: ThemeColors.goldColor,));
  }
}
