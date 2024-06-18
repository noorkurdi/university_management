import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/models/subjects/not_my_subject_model.dart';
import 'package:university_management/pages/add_subjects/items/not_my_subject_list.dart';
import 'package:university_management/provider/subjects/add_subjects_provider.dart';
import 'package:university_management/provider/subjects/my_subjects_provider.dart';
import 'package:university_management/provider/subjects/not_my_subjects_provider.dart';
import 'package:university_management/widgets/custom_linear_button.dart';

class AddSubjectsPage extends StatelessWidget {
  const AddSubjectsPage({
    super.key,
    required this.notMySubjects,
  });
  final NotMySubjectsProvider notMySubjects;
  @override
  Widget build(BuildContext context) {
    final addSubjects = Provider.of<AddSubjectsProvider>(context);
    final mySubjectsProvider = Provider.of<MySubjectsProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () async {
              await mySubjectsProvider.getMySubjects();
              addSubjects.data.clear();
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
          title: const Text(
            "إضافة مواد",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: AppColors.blueWpuColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                NotMySubjectsList(
                  notMySubjects: notMySubjects,
                  addSubjects: addSubjects,
                ),
                addSubjects.connectionEnum == ConnectionEnum.connecting
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.blueWpuColor,
                        ),
                      )
                    : Visibility(
                        visible: addSubjects.data.isNotEmpty,
                        child: CustomLinearButton(
                          onTap: addSubjects.data.isEmpty
                              ? null
                              : () async {
                                  await addSubjects.addSubjects(
                                    onSuccess: () async {
                                      AppServices.successSnackBar(
                                        context: context,
                                        title: "تم إضافة المواد بنجاح",
                                      );
                                    },
                                    onError: () {
                                      AppServices.errorSncakBar(
                                        context: context,
                                        title:
                                            "حدث خطأ, الرجاء المحاولة مجدداً",
                                      );
                                    },
                                  );
                                },
                          colors: [
                            AppColors.blueWpuColor,
                            const Color.fromARGB(255, 2, 46, 94)
                          ],
                          child: const Center(
                            child: Text(
                              "إضافة",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
