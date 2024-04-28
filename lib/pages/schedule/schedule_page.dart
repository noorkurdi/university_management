import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/pages/home/home_items/today_schedule_card.dart';
import 'package:university_management/pages/schedule/items/search_field.dart';
import 'package:university_management/provider/schedule/schedule_provider.dart';
import 'package:university_management/widgets/custom_text_field_widget.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final scheduleProvider = Provider.of<ScheduleProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "الجدول الدراسي",
              style: TextStyle(
                fontSize: 25,
                color: AppColors.blueWpuColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SearchField(),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: context.height - 200,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const TodayScheduleCard(
                  secondTitle: "اليوم :",
                  thirdTitle: "وقت المادة :",
                );
              },
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
