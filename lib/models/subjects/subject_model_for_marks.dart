import 'dart:convert';

class SubjectModelForMarks {
  int id;
  String name;
  int year;
  int gpa;
  SubjectModelForMarks({
    required this.id,
    required this.name,
    required this.year,
    required this.gpa,
  });

  SubjectModelForMarks copyWith({
    int? id,
    String? name,
    int? year,
    int? gpa,
  }) {
    return SubjectModelForMarks(
      id: id ?? this.id,
      name: name ?? this.name,
      year: year ?? this.year,
      gpa: gpa ?? this.gpa,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'year': year,
      'GPA': gpa,
    };
  }

  factory SubjectModelForMarks.fromMap(Map<String, dynamic> map) {
    return SubjectModelForMarks(
      id: map['id'] as int,
      name: map['name'] as String,
      year: map['year'] as int,
      gpa: map['GPA'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModelForMarks.fromJson(String source) =>
      SubjectModelForMarks.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubjectModel(id: $id, name: $name, year: $year, GPA: $gpa)';
  }

  @override
  bool operator ==(covariant SubjectModelForMarks other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.year == year &&
        other.gpa == gpa;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ year.hashCode ^ gpa.hashCode;
  }
}
