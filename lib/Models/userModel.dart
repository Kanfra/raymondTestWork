class UserModel{
  final String id;
  final String name;
  final String email;
  final String password;
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
});

  // map for sending data
  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
    };
  }

  //factory for receiving data
  factory UserModel.fromJson(Map<String, dynamic> map){
    return UserModel(
        id: map["_id"],
        name: map["name"],
        email: map["email"],
        password: map["password"],
    );
  }
}