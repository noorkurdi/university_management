import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/pages/home/home_items/today_schedule_list.dart';
import 'package:university_management/provider/schedule/today_schedule_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.todaySchedule,
  });
  final TodayScheduleProvider todaySchedule;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: Image.asset(
                  AppAssets.wpuLogo,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            DateFormat('yyyy/MM/dd').format(DateTime.now()),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            AppMaps.date[DateTime.now().weekday].toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: context.width * .25,
                      ),
                      const Text(
                        ": محاضرات اليوم",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
               TodayScheduleList(
                todaySchedule: todaySchedule,
               )
            ],
          ),
        ),
      ),
    );
  }
}
