class UserModel {
  int? id;
  String? name;
  int? age;
  String? photo;
  String? gender;
  String? phone;
  String? searchPurpose;
  String? city;
  List<String>? hobbies;

  UserModel({
    this.id,
    this.name,
    this.age,
    this.photo,
    this.gender,
    this.phone,
    this.searchPurpose,
    this.city,
    this.hobbies,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    photo = json['photo'];
    gender = json['gender'];
    phone = json['phone'];
    searchPurpose = json['searchPurpose'];
    city = json['city'];
    hobbies = json['hobbies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['photo'] = this.photo;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['searchPurpose'] = this.searchPurpose;
    data['city'] = this.city;
    data['hobbies'] = this.hobbies;
    return data;
  }
}