import '../../domain/entites/user.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.id,
    required super.image,
    required super.createdAt,
    required super.phoneNumber,
    required super.userType,
    required super.location,
    required super.dateOfBirth,
  });

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      id: json['id'],
      image: json['image'] ?? '', // Default to empty string if image is null
      createdAt: DateTime.parse(json['created_at']),
      phoneNumber: json['phone_number'],
      userType: json['user_type'],
      location: json['location'],
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'])
          : DateTime.now(), // Default to current date if null
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'phone_number': phoneNumber,
      'user_type': userType,
      'location': location,
      'date_of_birth': dateOfBirth.toIso8601String(), // Include date of birth
    };
  }

  // Map from Entity to Model
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      id: entity.id,
      image: entity.image,
      createdAt: entity.createdAt,
      phoneNumber: entity.phoneNumber,
      userType: entity.userType,
      location: entity.location,
      dateOfBirth: entity.dateOfBirth,
    );
  }

  // Map from Model to Entity
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      id: id,
      image: image,
      createdAt: createdAt,
      phoneNumber: phoneNumber,
      userType: userType,
      location: location,
      dateOfBirth: dateOfBirth,
    );
  }
}
