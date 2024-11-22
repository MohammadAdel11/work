import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';
class leadingAppBar extends StatelessWidget {
  const leadingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ()=>Get.back(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: ThemeColors.goldColor,
          size: 25.sp,
        ));
  }
}
