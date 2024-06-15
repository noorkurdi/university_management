import 'package:flutter/material.dart';
import 'package:university_management/pages/add_subjects/items/not_my_subject_list_tile.dart';
import 'package:university_management/provider/subjects/add_subjects_provider.dart';
import 'package:university_management/provider/subjects/not_my_subjects_provider.dart';

class NotMySubjectsList extends StatelessWidget {
  const NotMySubjectsList({
    super.key,
    required this.notMySubjects,
    required this.addSubjects,
  });
  final NotMySubjectsProvider notMySubjects;
  final AddSubjectsProvider addSubjects;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      width: double.infinity,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return NotMuSubjectListTile(
            notMySubject: notMySubjects.notMySubjects[index],
            addSubjects: addSubjects,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: notMySubjects.notMySubjects.length,
      ),
    );
  }
}
