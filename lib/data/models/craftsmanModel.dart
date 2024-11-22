import 'package:herafi/domain/entites/craftsman.dart';

class CraftsmanModel extends CraftsmanEntity {
  CraftsmanModel({
    required super.category,
    required super.yearsOfExp,
    required super.name,
    required super.id,
    required super.image,
    required super.createdAt,
    required super.phoneNumber,
    required super.userType,
    required super.location,
    required super.dateOfBirth, // Include DOB
  });

  /// Convert JSON to CraftsmanModel
  factory CraftsmanModel.fromJson(Map<String, dynamic> json) {
    return CraftsmanModel(
      category: json['category'],
      yearsOfExp: json['years_of_experience'],
      name: json['name'],
      id: json['id'],
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      phoneNumber: json['phone_number'],
      userType: json['user_type'],
      location: json['location'],
      dateOfBirth: DateTime.parse(json['date_of_birth']), // Parse DOB
    );
  }

  /// Convert CraftsmanModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'years_of_experience': yearsOfExp,
      'name': name,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'phone_number': phoneNumber,
      'user_type': userType,
      'location': location,
      'date_of_birth': dateOfBirth.toIso8601String(), // Save DOB
    };
  }
}
