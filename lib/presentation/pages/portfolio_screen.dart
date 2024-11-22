// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class PortfolioScreen extends StatefulWidget {
//   @override
//   _PortfolioScreenState createState() => _PortfolioScreenState();
// }

// class _PortfolioScreenState extends State<PortfolioScreen> {
//   final SupabaseClient supabaseClient = Supabase.instance.client;
//   List<Map<String, dynamic>> works = [];
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchWorks();
//   }

//   Future<void> _fetchWorks() async {
//     final craftsmanId = FirebaseAuth.instance.currentUser?.uid;
//     if (craftsmanId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("User not logged in!")),
//       );
//       return;
//     }

//     setState(() => isLoading = true);
//     try {
//       final response = await supabaseClient
//           .from('works')
//           .select('*')
//           .eq('craftsman_id', craftsmanId)
//           .order('created_at', ascending: false);

//       setState(() {
//         works = List<Map<String, dynamic>>.from(response as List);
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to fetch works: $e")),
//       );
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   Future<String> _uploadImageToFirebase(File file) async {
//     try {
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child('works_images')
//           .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

//       await ref.putFile(file);
//       return await ref.getDownloadURL();
//     } catch (e) {
//       throw Exception("Failed to upload image: $e");
//     }
//   }

//   Future<void> _addNewWork() async {
//     final craftsmanId = FirebaseAuth.instance.currentUser?.uid;
//     if (craftsmanId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("User not logged in!")),
//       );
//       return;
//     }

//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       _showWorkDetailModal(
//         imagePath: image.path,
//         onSave: (String title, String description, String imagePath) async {
//           try {
//             setState(() => isLoading = true);

//             // Upload image to Firebase
//             final imageUrl = await _uploadImageToFirebase(File(imagePath));

//             // Save work in Supabase
//             await supabaseClient.from('works').insert({
//               'craftsman_id': craftsmanId,
//               'image': imageUrl,
//               'title': title,
//               'description': description,
//               'created_at': DateTime.now().toIso8601String(),
//             });

//             _fetchWorks(); // Refresh works list
//           } catch (e) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("Failed to save work: $e")),
//             );
//           } finally {
//             setState(() => isLoading = false);
//           }
//         },
//       );
//     }
//   }

//   void _showWorkDetailModal({
//     String? title,
//     String? description,
//     String? imagePath,
//     void Function(String title, String description, String imagePath)? onSave,
//     Future<void> Function()? onDelete,
//   }) {
//     final titleController = TextEditingController(text: title ?? '');
//     final descriptionController = TextEditingController(text: description ?? '');
//     String? selectedImagePath = imagePath;

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             left: 16,
//             right: 16,
//             top: 16,
//             bottom: MediaQuery.of(context).viewInsets.bottom + 16,
//           ),
//           child: StatefulBuilder(
//             builder: (context, setState) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   GestureDetector(
//                     onTap: () async {
//                       final picker = ImagePicker();
//                       final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//                       if (pickedImage != null) {
//                         setState(() {
//                           selectedImagePath = pickedImage.path;
//                         });
//                       }
//                     },
//                     child: selectedImagePath != null
//                         ? Image.file(
//                             File(selectedImagePath!),
//                             height: 200,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           )
//                         : Container(
//                             height: 200,
//                             width: double.infinity,
//                             color: Colors.grey[300],
//                             child: Icon(Icons.add_a_photo, size: 50),
//                           ),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     controller: titleController,
//                     decoration: InputDecoration(labelText: "Title"),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     controller: descriptionController,
//                     decoration: InputDecoration(labelText: "Description"),
//                     maxLines: 3,
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           if (onSave != null) {
//                             onSave(
//                               titleController.text,
//                               descriptionController.text,
//                               selectedImagePath ?? '',
//                             );
//                             Navigator.pop(context);
//                           }
//                         },
//                         child: Text("Save"),
//                       ),
//                       if (onDelete != null)
//                         OutlinedButton(
//                           onPressed: () async {
//                             await onDelete();
//                             Navigator.pop(context);
//                           },
//                           child: Text("Delete"),
//                         ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _viewWorkDetail(int index) {
//     final work = works[index];
//     _showWorkDetailModal(
//       title: work['title'],
//       description: work['description'],
//       imagePath: work['image'],
//       onSave: (String title, String description, String imagePath) async {
//         try {
//           setState(() => isLoading = true);

//           // Update work in Supabase
//           await supabaseClient.from('works').update({
//             'title': title,
//             'description': description,
//           }).eq('id', work['id']);

//           _fetchWorks(); // Refresh works list
//         } catch (e) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Failed to update work: $e")),
//           );
//         } finally {
//           setState(() => isLoading = false);
//         }
//       },
//       onDelete: () async {
//         try {
//           setState(() => isLoading = true);

//           // Delete work from Supabase
//           await supabaseClient.from('works').delete().eq('id', work['id']);

//           _fetchWorks(); // Refresh works list
//         } catch (e) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Failed to delete work: $e")),
//           );
//         } finally {
//           setState(() => isLoading = false);
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Portfolio"),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: _addNewWork,
//                         child: Container(
//                           width: 50,
//                           height: 50,
//                           color: Colors.grey[300],
//                           child: Icon(Icons.add, color: Colors.black),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Text(
//                         'Add new work',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     padding: const EdgeInsets.all(16.0),
//                     itemCount: works.length,
//                     itemBuilder: (context, index) {
//                       final work = works[index];
//                       return GestureDetector(
//                         onTap: () => _viewWorkDetail(index),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.network(
//                             work['image'],
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
