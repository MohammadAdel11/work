import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:herafi/data/repositroies/craftsmanRepositoryImp.dart';
import 'package:herafi/domain/entites/craftsman.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/remotDataSource/craftsmanRemotDataSource.dart';


class EditCraftsmanScreen extends StatefulWidget {
  @override
  _EditCraftsmanScreenState createState() => _EditCraftsmanScreenState();
}

class _EditCraftsmanScreenState extends State<EditCraftsmanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _yearsOfExperienceController = TextEditingController();
  final _categoryController = TextEditingController();

  String? _imageUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCraftsmanDetails();
  }

  Future<void> _fetchCraftsmanDetails() async {
    setState(() => _isLoading = true);
    try {
      final craftsmanId = FirebaseAuth.instance.currentUser?.uid;
      if (craftsmanId == null) throw Exception("User not logged in");

      final repository = CraftsmanRepositoryImpl(CraftsmanRemoteDataSource(
        Supabase.instance.client,
        FirebaseAuth.instance,
      ));

      final result = await repository.fetchCraftsmanById(craftsmanId);
      result.fold(
        (failure) => throw Exception(failure.message),
        (craftsman) {
          _nameController.text = craftsman.name;
          _locationController.text = craftsman.location;
          _yearsOfExperienceController.text = craftsman.yearsOfExp.toString();
          _categoryController.text = craftsman.category;
          _imageUrl = craftsman.image;
          setState(() {});
        },
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch craftsman details: $error")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<String> _uploadImageToFirebase(File file) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('craftsman_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(file);
      final imageUrl = await ref.getDownloadURL();

      setState(() {
        _imageUrl = imageUrl;
      });

      return imageUrl;
    } catch (e) {
      throw Exception("Failed to upload image: $e");
    }
  }

  Future<void> _updateCraftsmanProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final craftsmanId = FirebaseAuth.instance.currentUser?.uid;
      if (craftsmanId == null) throw Exception("User not logged in");

      final repository = CraftsmanRepositoryImpl(CraftsmanRemoteDataSource(
        Supabase.instance.client,
        FirebaseAuth.instance,
      ));

      final craftsman = CraftsmanEntity(
        id: craftsmanId,
        name: _nameController.text.trim(),
        location: _locationController.text.trim(),
        yearsOfExp: int.parse(_yearsOfExperienceController.text.trim()),
        category: _categoryController.text.trim(),
        image: _imageUrl ?? '',
        createdAt: DateTime.now(), // Replace with actual field if needed
        phoneNumber: '', // Replace with actual field if needed
        userType: 'craftsman',
        dateOfBirth: DateTime(2000, 1, 1), // Replace with actual field if needed
      );

      final result = await repository.updateCraftsman(craftsman);
      result.fold(
        (failure) => throw Exception(failure.message),
        (_) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully")),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile: $error")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Craftsman Info"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final pickedFile =
                            await ImagePicker().pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          await _uploadImageToFirebase(File(pickedFile.path));
                        }
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _imageUrl != null ? NetworkImage(_imageUrl!) : null,
                        child: _imageUrl == null ? Icon(Icons.add_a_photo, size: 50) : null,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: "Name"),
                      validator: (value) =>
                          value == null || value.isEmpty ? "Enter name" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _locationController,
                      decoration: InputDecoration(labelText: "Location"),
                      validator: (value) =>
                          value == null || value.isEmpty ? "Enter location" : null,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _yearsOfExperienceController,
                      decoration: InputDecoration(labelText: "Years of Experience"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter years of experience";
                        }
                        final years = int.tryParse(value);
                        if (years == null || years < 0) {
                          return "Enter a valid number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _categoryController,
                      decoration: InputDecoration(labelText: "Category"),
                      validator: (value) =>
                          value == null || value.isEmpty ? "Enter category" : null,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _updateCraftsmanProfile,
                      child: Text("Save Changes"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _yearsOfExperienceController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}
