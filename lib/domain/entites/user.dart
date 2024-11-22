class UserEntity {
  final String name;
  final String id;
  final String image;
  final DateTime createdAt;
  final String phoneNumber;
  final String userType;
  final String location;
  final DateTime dateOfBirth; // New field

  UserEntity({
    required this.name,
    required this.id,
    required this.image,
    required this.createdAt,
    required this.phoneNumber,
    required this.userType,
    required this.location,
    required this.dateOfBirth, // Include dateOfBirth
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.createdAt == createdAt &&
        other.phoneNumber == phoneNumber &&
        other.userType == userType &&
        other.location == location &&
        other.dateOfBirth == dateOfBirth;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    image.hashCode ^
    createdAt.hashCode ^
    phoneNumber.hashCode ^
    userType.hashCode ^
    location.hashCode ^
    dateOfBirth.hashCode;
  }
  String getImage(){
    if(image.isEmpty){
      if(userType=="craftsman"){
        return  "https://firebasestorage.googleapis.com/v0/b/herrfi-bd37c.appspot.com/o/craftsman.png?alt=media&token=d15afb8f-ec47-4460-bc6f-13119c30d3b5";
      }
      else{
        return "https://firebasestorage.googleapis.com/v0/b/herrfi-bd37c.appspot.com/o/profile-2.png?alt=media&token=f5385b3c-c568-449e-9185-c20fdc4b374b";
      }
    }
    return image;
  }
}
