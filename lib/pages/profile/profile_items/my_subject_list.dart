import 'package:flutter/material.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/pages/profile/profile_items/my_subject_card.dart';

class MySubjectList extends StatelessWidget {
  const  MySubjectList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          itemCount: 15,
          itemBuilder: (context, index) {
            return const MySubjectCard();
          },
        ),
      ),
    );
  }
}
