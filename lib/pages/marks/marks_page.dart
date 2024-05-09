import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/pages/marks/marks_items/custom_table_cell.dart';
import 'package:university_management/pages/marks/marks_items/custom_table_info_text.dart';

class MarksPage extends StatelessWidget {
  const MarksPage({super.key});

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
          SingleChildScrollView(
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
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(
                          CustomTableInfoText(text: "تطبيقات ويب"),
                        ),
                        DataCell(
                          CustomTableInfoText(
                            text: "3",
                          ),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "17 من 30"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "20 من 30"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "37 من 50"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "-"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: ""),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "0.00"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: ""),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          CustomTableInfoText(text: "نظم موزعة"),
                        ),
                        DataCell(
                          CustomTableInfoText(
                            text: "3",
                          ),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "17 من 30"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "20 من 30"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "37 من 50"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "-"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: ""),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "0.00"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: ""),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          CustomTableInfoText(
                            text: "بروتوكولات الشبكات الحاسوبية",
                          ),
                        ),
                        DataCell(
                          CustomTableInfoText(
                            text: "3",
                          ),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "17 من 30"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "20 من 30"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "37 من 50"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "-"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: ""),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "0.00"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: ""),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          CustomTableInfoText(
                            text: "خوارزميات البحث الذكي",
                          ),
                        ),
                        DataCell(
                          CustomTableInfoText(
                            text: "2",
                          ),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "17 من 30"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "20 من 30"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "37 من 50"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "-"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: ""),
                        ),
                        DataCell(
                          CustomTableInfoText(text: "0.00"),
                        ),
                        DataCell(
                          CustomTableInfoText(text: ""),
                        ),
                      ],
                    ),
                    // DataRow(cells: [
                    //   DataCell(Text("نظم موزعة")),
                    // ]),
                    // DataRow(cells: [
                    //   DataCell(Text("خوارزميات البحث الذكي")),
                    // ]),
                    // DataRow(cells: [
                    //   DataCell(Text("مهارات كتابة علمية")),
                    // ]),
                    // DataRow(cells: [
                    //   DataCell(Text("بروتوكولات الشبكات الحاسوبية"))
                    // ]),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
