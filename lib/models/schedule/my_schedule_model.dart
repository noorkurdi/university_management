// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:university_management/models/schedule/subject_for_schedule_model.dart';

class MyScheduleModel {
  int id;
  SubjectForSchedule subject;
  MyScheduleModel({
    required this.id,
    required this.subject,
  });

  MyScheduleModel copyWith({
    int? id,
    SubjectForSchedule? subject,
  }) {
    return MyScheduleModel(
      id: id ?? this.id,
      subject: subject ?? this.subject,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'Subject': subject.toMap(),
    };
  }

  factory MyScheduleModel.fromMap(Map<String, dynamic> map) {
    return MyScheduleModel(
      id: map['id'] as int,
      subject:
          SubjectForSchedule.fromMap(map['Subject'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyScheduleModel.fromJson(String source) =>
      MyScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MyScheduleModel(id: $id, Subject: $subject)';

  @override
  bool operator ==(covariant MyScheduleModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.subject == subject;
  }

  @override
  int get hashCode => id.hashCode ^ subject.hashCode;
}
