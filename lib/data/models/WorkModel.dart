// import 'package:herafi/domain/entites/work.dart';

// class WorkModel extends WorkEntity {
//   WorkModel({
//     required String id,
//     required String craftsmanId,
//     required String image,
//     required String title,
//     required String description,
//     required DateTime createdAt,
//   }) : super(
//           id: id,
//           craftsmanId: craftsmanId,
//           image: image,
//           title: title,
//           description: description,
//           createdAt: createdAt,
//         );

//   factory WorkModel.fromJson(Map<String, dynamic> json) {
//     return WorkModel(
//       id: json['id'].toString(),
//       craftsmanId: json['craftsman_id'],
//       image: json['image'],
//       title: json['title'],
//       description: json['description'],
//       createdAt: DateTime.parse(json['created_at']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'craftsman_id': craftsmanId,
//       'image': image,
//       'title': title,
//       'description': description,
//       'created_at': createdAt.toIso8601String(),
//     };
//   }
// }