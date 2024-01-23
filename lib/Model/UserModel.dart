import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String role;
  final String userClass;

  UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.userClass,
  });

  Map<String, dynamic> toJson() {
    return {"Name": name, "Email": email, "Role": role, "Class": userClass};
  }

factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  final data = document.data();
  return UserModel(id: document.id ,email: data!["email"], name: data["name"], role: data["role"], userClass: data["class"],);
}



}


