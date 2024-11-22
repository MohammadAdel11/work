import 'package:flutter/material.dart';
import 'package:herafi/presentation/Widgets/progressIndicator.dart';


class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: progressIndicator(),
        ),
      );
  }
}
