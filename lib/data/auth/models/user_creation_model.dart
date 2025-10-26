class UserCreationModel {
  String? password;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? age;

  UserCreationModel({
    this.gender,
    this.age,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
  });

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'gender': gender,
    };
  }
}
