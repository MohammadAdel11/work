import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:herafi/presentation/Widgets/leadingAppBar.dart';


class imageViewWithInteractiveView extends StatelessWidget {
  const imageViewWithInteractiveView({super.key, required this.title, required this.image});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: leadingAppBar(),title: Text(title),),
      body: SizedBox.expand(
        child: Center(
          child: InteractiveViewer(
              panEnabled: true, // Allow panning
              boundaryMargin: EdgeInsets.all(20),
              minScale: 0.5,
              maxScale: 4,
              child: CachedNetworkImage(imageUrl: image)
          ),
        ),
      )
    );
  }
}
