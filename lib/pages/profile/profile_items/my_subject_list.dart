import 'package:flutter/material.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/pages/profile/profile_items/my_subject_card.dart';
import 'package:university_management/provider/subjects/my_subjects_provider.dart';

class MySubjectList extends StatelessWidget {
  const MySubjectList({
    super.key,
    required this.mySubjectsProvider,
  });
  final MySubjectsProvider mySubjectsProvider;
  @override
  Widget build(BuildContext context) {
    return mySubjectsProvider.connectionEnum == ConnectionEnum.connecting
        ? Center(
            child: CircularProgressIndicator(
              color: AppColors.blueWpuColor,
            ),
          )
        : SizedBox(
            width: double.infinity,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                ),
                itemCount: mySubjectsProvider.mySubjects.length,
                itemBuilder: (context, index) {
                  return MySubjectCard(
                    mySubject: mySubjectsProvider.mySubjects[index],
                  );
                },
              ),
            ),
          );
  }
}
