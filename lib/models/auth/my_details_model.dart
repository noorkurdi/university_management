// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:university_management/models/collage/collage_model.dart';

class MyDetailsModel {
  int id;
  String name;
  String uniNumber;
  int year;
  String email;
  CollageModel collage;
  MyDetailsModel({
    required this.id,
    required this.name,
    required this.uniNumber,
    required this.year,
    required this.email,
    required this.collage,
  });

  MyDetailsModel copyWith({
    int? id,
    String? name,
    String? uniNumber,
    int? year,
    String? email,
    CollageModel? collage,
  }) {
    return MyDetailsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uniNumber: uniNumber ?? this.uniNumber,
      year: year ?? this.year,
      email: email ?? this.email,
      collage: collage ?? this.collage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'university_number': uniNumber,
      'year': year,
      'email': email,
      'Collage': collage.toMap(),
    };
  }

  factory MyDetailsModel.fromMap(Map<String, dynamic> map) {
    return MyDetailsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      uniNumber: map['university_number'] as String,
      year: map['year'] as int,
      email: map['email'] as String,
      collage: CollageModel.fromMap(map['Collage'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyDetailsModel.fromJson(String source) => MyDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyDetailsModel(id: $id, name: $name, university_number: $uniNumber, year: $year, email: $email, Collage: $collage)';
  }

  @override
  bool operator ==(covariant MyDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.uniNumber == uniNumber &&
      other.year == year &&
      other.email == email &&
      other.collage == collage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      uniNumber.hashCode ^
      year.hashCode ^
      email.hashCode ^
      collage.hashCode;
  }
}
