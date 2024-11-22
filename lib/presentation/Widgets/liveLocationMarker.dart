import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class liveLocationMarker extends StatelessWidget {
  const liveLocationMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('lib/core/utils/animations/liveLocation.json',width: 200,height: 200,);
  }
}
