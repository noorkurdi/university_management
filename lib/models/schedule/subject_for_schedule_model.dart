// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/models/schedule/my_schedule_model.dart';

import 'package:university_management/models/schedule/schedule_model.dart';

class SubjectForSchedule {
  int id;
  String name;
  List<ScheduleModel> schedule;
  SubjectForSchedule({
    required this.id,
    required this.name,
    required this.schedule,
  });

  SubjectForSchedule copyWith({
    int? id,
    String? name,
    List<ScheduleModel>? schedule,
  }) {
    return SubjectForSchedule(
      id: id ?? this.id,
      name: name ?? this.name,
      schedule: schedule ?? this.schedule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'Schedule': schedule.map((x) => x.toMap()).toList(),
    };
  }

  factory SubjectForSchedule.fromMap(Map<String, dynamic> map) {
    return SubjectForSchedule(
      id: map['id'] as int,
      name: map['name'] as String,
      schedule: List<ScheduleModel>.from(
        (map['Schedule'] as List<dynamic>).map<ScheduleModel>(
          (x) => ScheduleModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectForSchedule.fromJson(String source) =>
      SubjectForSchedule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SubjectForSchedule(id: $id, name: $name, Schedule: $schedule)';

  @override
  bool operator ==(covariant SubjectForSchedule other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.schedule, schedule);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ schedule.hashCode;
}
