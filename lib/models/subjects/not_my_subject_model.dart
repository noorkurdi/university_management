// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotMySubjectModel {
  int id;
  String name;
  int gpa;
  NotMySubjectModel({
    required this.id,
    required this.name,
    required this.gpa,
  });

  NotMySubjectModel copyWith({
    int? id,
    String? name,
    int? gpa,
  }) {
    return NotMySubjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gpa: gpa ?? this.gpa,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'GPA': gpa,
    };
  }

  factory NotMySubjectModel.fromMap(Map<String, dynamic> map) {
    return NotMySubjectModel(
      id: map['id'] as int,
      name: map['name'] as String,
      gpa: map['GPA'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotMySubjectModel.fromJson(String source) =>
      NotMySubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NotMySubjectModel(id: $id, name: $name, GPA: $gpa)';

  @override
  bool operator ==(covariant NotMySubjectModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.gpa == gpa;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ gpa.hashCode;
}
