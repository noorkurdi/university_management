// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:university_management/models/auth/my_details_model.dart';
import 'package:university_management/models/subjects/subject_model_for_marks.dart';

class MySubjectModel {
  int id;
  int? firstQuiz;
  int? secondQuiz;
  int? practicalTest;
  int? finalTest;
  int? total;
  double? points;
  String? grade;
  MyDetailsModel student;
  SubjectModelForMarks subject;
  MySubjectModel({
    required this.id,
    this.firstQuiz,
    this.secondQuiz,
    this.practicalTest,
    this.finalTest,
    this.total,
    this.points,
    this.grade,
    required this.student,
    required this.subject,
  });

  MySubjectModel copyWith({
    int? id,
    int? firstQuiz,
    int? secondQuiz,
    int? practicalTest,
    int? finalTest,
    int? total,
    double? points,
    String? grade,
    MyDetailsModel? student,
    SubjectModelForMarks? subject,
  }) {
    return MySubjectModel(
      id: id ?? this.id,
      firstQuiz: firstQuiz ?? this.firstQuiz,
      secondQuiz: secondQuiz ?? this.secondQuiz,
      practicalTest: practicalTest ?? this.practicalTest,
      finalTest: finalTest ?? this.finalTest,
      total: total ?? this.total,
      points: points ?? this.points,
      grade: grade ?? this.grade,
      student: student ?? this.student,
      subject: subject ?? this.subject,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_quiz': firstQuiz,
      'second_quiz': secondQuiz,
      'practical_test': practicalTest,
      'final': finalTest,
      'total': total,
      'points': points,
      'grade': grade,
      'Student': student.toMap(),
      'Subject': subject.toMap(),
    };
  }

  factory MySubjectModel.fromMap(Map<String, dynamic> map) {
    return MySubjectModel(
      id: map['id'] as int,
      firstQuiz: map['first_quiz'] != null ? map['first_quiz'] as int : null,
      secondQuiz: map['second_quiz'] != null ? map['second_quiz'] as int : null,
      practicalTest:
          map['practical_test'] != null ? map['practical_test'] as int : null,
      finalTest: map['final'] != null ? map['final'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
      points: map['points'] != null
          ? ((map['points'] is int)
              ? (map['points'] as int).toDouble()
              : map['points'] as double)
          : null,
      grade: map['grade'] != null ? map['grade'] as String : null,
      student: MyDetailsModel.fromMap(map['Student'] as Map<String, dynamic>),
      subject:
          SubjectModelForMarks.fromMap(map['Subject'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory MySubjectModel.fromJson(String source) =>
      MySubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentSubjectModel(id: $id, first_quiz: $firstQuiz, second_quiz: $secondQuiz, practical_test: $practicalTest, final: $finalTest, total: $total, points: $points, grade: $grade, Student: $student, Subject: $subject)';
  }

  @override
  bool operator ==(covariant MySubjectModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstQuiz == firstQuiz &&
        other.secondQuiz == secondQuiz &&
        other.practicalTest == practicalTest &&
        other.finalTest == finalTest &&
        other.total == total &&
        other.points == points &&
        other.grade == grade &&
        other.student == student &&
        other.subject == subject;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstQuiz.hashCode ^
        secondQuiz.hashCode ^
        practicalTest.hashCode ^
        finalTest.hashCode ^
        total.hashCode ^
        points.hashCode ^
        grade.hashCode ^
        student.hashCode ^
        subject.hashCode;
  }
}
