// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:university_management/models/schedule/subject_for_all_schedule_model.dart';

class AllSchdeuleModel {
  int id;
  String startTime;
  String endTime;
  String place;
  int day;
  SubjectForAllScheduleModel subject;
  AllSchdeuleModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.place,
    required this.day,
    required this.subject,
  });

  AllSchdeuleModel copyWith({
    int? id,
    String? startTime,
    String? endTime,
    String? place,
    int? day,
    SubjectForAllScheduleModel? subject,
  }) {
    return AllSchdeuleModel(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      place: place ?? this.place,
      day: day ?? this.day,
      subject: subject ?? this.subject,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start_time': startTime,
      'end_time': endTime,
      'place': place,
      'day': day,
      'Subject': subject.toMap(),
    };
  }

  factory AllSchdeuleModel.fromMap(Map<String, dynamic> map) {
    return AllSchdeuleModel(
      id: map['id'] as int,
      startTime: map['start_time'] as String,
      endTime: map['end_time'] as String,
      place: map['place'] as String,
      day: map['day'] as int,
      subject: SubjectForAllScheduleModel.fromMap(map['Subject'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllSchdeuleModel.fromJson(String source) => AllSchdeuleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllSchdeuleModel(id: $id, start_time: $startTime, end_time: $endTime, place: $place, day: $day, Subject: $subject)';
  }

  @override
  bool operator ==(covariant AllSchdeuleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.place == place &&
      other.day == day &&
      other.subject == subject;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      place.hashCode ^
      day.hashCode ^
      subject.hashCode;
  }
}
