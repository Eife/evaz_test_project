class UserModel {
  String uid;
  String? name;
  String? surname;
  String? parentName;

  UserModel({
    required this.uid,
    this.name, 
    this.surname, 
    this.parentName, 
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"] ?? "", 
      name: json["name"],
      surname: json["surname"],
      parentName: json["parentName"],
    );
  }
}
