import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/pages/marks/marks_items/custom_table_cell.dart';
import 'package:university_management/pages/marks/marks_items/custom_table_info_text.dart';
import 'package:university_management/provider/subjects/my_subjects_provider.dart';

class MarksPage extends StatelessWidget {
  const MarksPage({
    super.key,
    required this.mySubjectsProvider,
  });
  final MySubjectsProvider mySubjectsProvider;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "علامات الفصل",
              style: TextStyle(
                fontSize: 25,
                color: AppColors.blueWpuColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          mySubjectsProvider.connectionEnum == ConnectionEnum.connecting
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.blueWpuColor,
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DataTable(
                      dataRowMaxHeight: 80,
                      columnSpacing: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      columns: const [
                        DataColumn(
                          label: CustomTableTitle(title: "اسم\nالمقرر"),
                        ),
                        DataColumn(
                          label: CustomTableTitle(title: "عدد\nالساعات"),
                        ),
                        DataColumn(
                          label: CustomTableTitle(title: "1"),
                        ),
                        DataColumn(
                          label: CustomTableTitle(title: "2"),
                        ),
                        DataColumn(
                          label: CustomTableTitle(title: "السعي الفصلي"),
                        ),
                        DataColumn(
                          label: CustomTableTitle(title: "الامتحان النهائي"),
                        ),
                        DataColumn(
                          label: CustomTableTitle(title: "المجموع"),
                        ),
                        DataColumn(
                          label: CustomTableTitle(title: "النقاط"),
                        ),
                        DataColumn(
                          label: CustomTableTitle(title: "التقدير"),
                        ),
                      ],
                      rows: mySubjectsProvider.mySubjects == null
                          ? []
                          : mySubjectsProvider.mySubjects!.map((e) {
                              return DataRow(cells: [
                                DataCell(CustomTableInfoText(
                                  text: e.subject.name,
                                )),
                                DataCell(CustomTableInfoText(
                                  text: e.subject.gpa.toString(),
                                )),
                                DataCell(CustomTableInfoText(
                                  text: e.firstQuiz != null
                                      ? "${e.firstQuiz} من 15"
                                      : "",
                                )),
                                DataCell(CustomTableInfoText(
                                  text: e.secondQuiz != null
                                      ? "${e.secondQuiz} من 15"
                                      : "",
                                )),
                                DataCell(CustomTableInfoText(
                                  text: e.practicalTest != null
                                      ? "${e.practicalTest} من 20"
                                      : "",
                                )),
                                DataCell(CustomTableInfoText(
                                  text: e.finalTest != null
                                      ? "${e.finalTest} من 50"
                                      : "",
                                )),
                                DataCell(CustomTableInfoText(
                                  text:
                                      e.total != null ? e.total.toString() : "",
                                )),
                                DataCell(CustomTableInfoText(
                                  text: e.points != null
                                      ? e.points.toString()
                                      : "0.00",
                                )),
                                DataCell(CustomTableInfoText(
                                  text:
                                      e.grade != null ? e.grade.toString() : "",
                                )),
                              ]);
                            }).toList(),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
