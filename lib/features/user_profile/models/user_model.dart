import 'dart:convert';
import 'dart:typed_data';

class UserModel {
  int? id;
  String? name;
  int? age;
  Uint8List? photo;
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
    photo = base64Decode(json['photo']);
    gender = json['gender'];
    phone = json['phone'];
    searchPurpose = json['search_purpose'];
    city = json['city'];
    String test = json['hobbies'];
    hobbies = test.split(', ');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = base64Encode(this.photo!);
    data['user_id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['search_purpose'] = this.searchPurpose;
    data['city'] = this.city;
    data['hobbies'] = this.hobbies!.join(', ');
    return data;
  }
}