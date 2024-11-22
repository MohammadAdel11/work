import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class progressIndicator extends StatelessWidget {
  const progressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    if((Platform.isIOS || Platform.isMacOS))
      return Center(child: CupertinoActivityIndicator(color: Theme.of(context).focusColor,radius: 15.sp,));
    else {
      return Center(child: SizedBox(child: FittedBox(child: CircularProgressIndicator(color: Theme.of(context).focusColor.withOpacity(0.7))),width: 25.sp,height: 25.sp,));
    }

  }
}
