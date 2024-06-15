import 'dart:convert';

class AddSubjectModel {
  int subjectId;
  AddSubjectModel({
    required this.subjectId,
  });

  AddSubjectModel copyWith({
    int? subjectId,
  }) {
    return AddSubjectModel(
      subjectId: subjectId ?? this.subjectId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subject_id': subjectId,
    };
  }

  factory AddSubjectModel.fromMap(Map<String, dynamic> map) {
    return AddSubjectModel(
      subjectId: map['subject_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddSubjectModel.fromJson(String source) => AddSubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddSubjectModel(subject_id: $subjectId)';

  @override
  bool operator ==(covariant AddSubjectModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.subjectId == subjectId;
  }

  @override
  int get hashCode => subjectId.hashCode;
}
