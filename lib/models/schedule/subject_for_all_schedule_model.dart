// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:university_management/models/collage/collage_model.dart';

class SubjectForAllScheduleModel {
  int id;
  String name;
  int year;
  int gpa;
  CollageModel collage;
  SubjectForAllScheduleModel({
    required this.id,
    required this.name,
    required this.year,
    required this.gpa,
    required this.collage,
  });

  SubjectForAllScheduleModel copyWith({
    int? id,
    String? name,
    int? year,
    int? gpa,
    CollageModel? collage,
  }) {
    return SubjectForAllScheduleModel(
      id: id ?? this.id,
      name: name ?? this.name,
      year: year ?? this.year,
      gpa: gpa ?? this.gpa,
      collage: collage ?? this.collage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'year': year,
      'GPA': gpa,
      'Collage': collage.toMap(),
    };
  }

  factory SubjectForAllScheduleModel.fromMap(Map<String, dynamic> map) {
    return SubjectForAllScheduleModel(
      id: map['id'] as int,
      name: map['name'] as String,
      year: map['year'] as int,
      gpa: map['GPA'] as int,
      collage: CollageModel.fromMap(map['Collage'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectForAllScheduleModel.fromJson(String source) => SubjectForAllScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubjectForAllScheduleModel(id: $id, name: $name, year: $year, GPA: $gpa, Collage: $collage)';
  }

  @override
  bool operator ==(covariant SubjectForAllScheduleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.year == year &&
      other.gpa == gpa &&
      other.collage == collage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      year.hashCode ^
      gpa.hashCode ^
      collage.hashCode;
  }
}
