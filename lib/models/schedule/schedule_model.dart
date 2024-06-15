// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ScheduleModel {
  int id;
  int day;
  String startTime;
  String endTime;
  String place;
  ScheduleModel({
    required this.id,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.place,
  });

  ScheduleModel copyWith({
    int? id,
    int? day,
    String? startTime,
    String? endTime,
    String? place,
  }) {
    return ScheduleModel(
      id: id ?? this.id,
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'day': day,
      'start_time': startTime,
      'end_time': endTime,
      'place': place,
    };
  }

  factory ScheduleModel.fromMap(Map<String, dynamic> map) {
    return ScheduleModel(
      id: map['id'] as int,
      day: map['day'] as int,
      startTime: map['start_time'] as String,
      endTime: map['end_time'] as String,
      place: map['place'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleModel.fromJson(String source) => ScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ScheduleModel(id: $id, day: $day, start_time: $startTime, end_time: $endTime, place: $place)';
  }

  @override
  bool operator ==(covariant ScheduleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.day == day &&
      other.startTime == startTime &&
      other.endTime == endTime &&
      other.place == place;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      day.hashCode ^
      startTime.hashCode ^
      endTime.hashCode ^
      place.hashCode;
  }
}
