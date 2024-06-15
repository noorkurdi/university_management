import 'package:flutter/material.dart';
import 'package:university_management/models/subjects/add_subject_model.dart';
import 'package:university_management/models/subjects/not_my_subject_model.dart';
import 'package:university_management/provider/subjects/add_subjects_provider.dart';

class NotMuSubjectListTile extends StatelessWidget {
  const NotMuSubjectListTile({
    super.key,
    required this.notMySubject,
    required this.addSubjects,
  });
  final NotMySubjectModel notMySubject;
  final AddSubjectsProvider addSubjects;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(
        onChanged: (value) {
          addSubjects
              .fillAndRemoveData(AddSubjectModel(subjectId: notMySubject.id));
        },
        value: addSubjects.data
            .contains(AddSubjectModel(subjectId: notMySubject.id)),
      ),
      title: Text(
        notMySubject.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "الساعات : ${notMySubject.gpa}",
      ),
    );
  }
}
