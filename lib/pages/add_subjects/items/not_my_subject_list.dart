import 'package:flutter/material.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/models/subjects/not_my_subject_model.dart';
import 'package:university_management/pages/add_subjects/items/not_my_subject_list_tile.dart';
import 'package:university_management/provider/subjects/add_subjects_provider.dart';
import 'package:university_management/provider/subjects/not_my_subjects_provider.dart';
import 'package:university_management/widgets/circular_widget.dart';

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
    return StreamBuilder<List<NotMySubjectModel>>(
      stream: notMySubjects.getNotMySubjects(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return SizedBox(
            height: 550,
            width: double.infinity,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return NotMuSubjectListTile(
                  notMySubject: snapshot.data![index],
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
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Circular();
        } else {
          return const Center(
            child: Text(
              "لا يوجد مواد",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }
}
