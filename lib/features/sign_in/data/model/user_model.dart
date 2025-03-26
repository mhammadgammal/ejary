import 'package:flutter/material.dart' show immutable;

@immutable
class UserModel {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String profilePicturePath;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.profilePicturePath,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone_number': phoneNumber,
    'password': password,
    'profile_picture_path': profilePicturePath,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phoneNumber: json['phone_number'],
    password: json['password'],
    profilePicturePath: json['profile_picture_path'],
  );
}
