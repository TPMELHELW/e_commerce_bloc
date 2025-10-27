import 'package:e_commerce_bloc/domain/auth/entity/user_entity.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String age;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      "firstName": firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'age': age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      gender: map['gender'],
      age: map['age'],
    );
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      age: age,
    );
  }
}
