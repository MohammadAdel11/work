import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DiplomaScreen extends StatefulWidget {
  @override
  _DiplomaScreenState createState() => _DiplomaScreenState();
}

class _DiplomaScreenState extends State<DiplomaScreen> {
  final List<File> diplomaImages = [];

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        diplomaImages.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diploma"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: diplomaImages.length + 1,
                itemBuilder: (context, index) {
                  if (index == diplomaImages.length) {
                    return GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.add, size: 50, color: Colors.black54),
                      ),
                    );
                  } else {
                    return Stack(
                      children: [
                        Image.file(diplomaImages[index], fit: BoxFit.cover),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                diplomaImages.removeAt(index);
                              });
                            },
                            child: Icon(Icons.remove_circle, color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
