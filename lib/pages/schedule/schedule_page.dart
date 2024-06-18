import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/pages/home/home_items/today_schedule_card.dart';
import 'package:university_management/pages/schedule/items/schedule_card.dart';
import 'package:university_management/pages/schedule/items/search_field.dart';
import 'package:university_management/provider/schedule/schedule_provider.dart';
import 'package:university_management/widgets/custom_text_field_widget.dart';
import 'package:university_management/widgets/filter_row.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({
    super.key,
    required this.scheduleProvider,
  });
  final ScheduleProvider scheduleProvider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
            SearchField(
              onChanged: (value) {
                scheduleProvider.runFilter(value);
              },
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: FilterRow(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: context.height / 3.2,
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: ListView(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "الكل",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Radio(
                                        value: null,
                                        groupValue: scheduleProvider.year,
                                        onChanged: (value) {
                                          scheduleProvider
                                              .changeSelectedValue(value);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                ...AppLists.years.map((e) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "السنة : $e",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Radio(
                                            value: e,
                                            groupValue: scheduleProvider.year,
                                            onChanged: (value) {
                                              scheduleProvider
                                                  .changeSelectedValue(value);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: context.height - 200,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ScheduleCard(
                    scheduleModel:
                        scheduleProvider.filtterdScheduleByName[index],
                  );
                },
                itemCount: scheduleProvider.filtterdScheduleByName.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
