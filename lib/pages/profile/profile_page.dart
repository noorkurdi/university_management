import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:university_management/core/enums/connection_enum.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/pages/add_subjects/add_subject_page.dart';
import 'package:university_management/pages/auth/login/login_page.dart';
import 'package:university_management/pages/profile/profile_items/background_image.dart';
import 'package:university_management/pages/profile/profile_items/my_subject_list.dart';
import 'package:university_management/pages/profile/profile_items/profile_info_list_tile.dart';
import 'package:university_management/pages/profile/profile_items/profile_photo.dart';
import 'package:university_management/provider/auth/change_email_provider.dart';
import 'package:university_management/provider/auth/change_password_provider.dart';
import 'package:university_management/provider/auth/my_details_provider.dart';
import 'package:university_management/provider/subjects/my_subjects_provider.dart';
import 'package:university_management/provider/subjects/not_my_subjects_provider.dart';
import 'package:university_management/widgets/circular_widget.dart';
import 'package:university_management/widgets/custom_text_field_widget.dart';
import 'package:university_management/widgets/show_password_icon.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.mySubjects,
  });
  final MySubjectsProvider mySubjects;
  @override
  Widget build(BuildContext context) {
    final myDetails = Provider.of<MyDetalisProvider>(context);
    final notMySubjectsProvider = Provider.of<NotMySubjectsProvider>(context);
    final changeEmail = Provider.of<ChangeEmailProvider>(context);
    final changePassword = Provider.of<ChangePasswordProvider>(context);
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BackGroundProfileImage(),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              width: context.width,
              height: context.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              AppMaps.yearIcons[myDetails.student!.year],
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              ": السنة الدراسية",
                              style: TextStyle(
                                color: AppColors.blueWpuColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                              ),
                              isScrollControlled: true,
                              useSafeArea: true,
                              builder: (context) {
                                return SizedBox(
                                  width: context.width,
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.blueWpuColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              changeEmail.fillEmailController(
                                                myDetails.student!.email,
                                              );
                                              Navigator.pop(context);
                                              showModalBottomSheet(
                                                context: context,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              10)),
                                                ),
                                                isScrollControlled: true,
                                                useSafeArea: true,
                                                builder: (context) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: SizedBox(
                                                        width: context.width,
                                                        height: 160,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Form(
                                                            key: AppKeys
                                                                .changeEmailKey,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                CustomTextField(
                                                                  isPassword:
                                                                      false,
                                                                  validation:
                                                                      AppValidations
                                                                          .emailValidation,
                                                                  suffixIcon:
                                                                      Icon(
                                                                    Icons.email,
                                                                    color: AppColors
                                                                        .blueWpuColor,
                                                                  ),
                                                                  inputController:
                                                                      changeEmail
                                                                          .emailController,
                                                                  hintText:
                                                                      "البريد الالكتروني",
                                                                ),
                                                                changeEmail.connectionEnum ==
                                                                        ConnectionEnum
                                                                            .connecting
                                                                    ? const Circular()
                                                                    : SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                AppColors.blueWpuColor,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                            await changeEmail.changeEmail(
                                                                              onSuccess: () async {
                                                                                await myDetails.getMyDetails();
                                                                                if (context.mounted) {
                                                                                  AppServices.successSnackBar(
                                                                                    context: context,
                                                                                    title: "تم تعديل البريد الالكتروني بنجاح",
                                                                                  );
                                                                                }
                                                                              },
                                                                              onError: () {
                                                                                AppServices.errorSncakBar(
                                                                                  context: context,
                                                                                  title: changeEmail.errorMessage,
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            "تعديل",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Text(
                                              "تعديل البريد الالكتروني",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.blueWpuColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              AppServices.clearEvent(
                                                  controller: [
                                                    changePassword
                                                        .newPasswordConfirmController,
                                                    changePassword
                                                        .newPasswordController,
                                                    changePassword
                                                        .oldPasswordController,
                                                  ]);
                                              Navigator.pop(context);
                                              showModalBottomSheet(
                                                context: context,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              10)),
                                                ),
                                                isScrollControlled: true,
                                                useSafeArea: true,
                                                builder: (context) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: SizedBox(
                                                        width: context.width,
                                                        height: 340,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Form(
                                                            key: AppKeys
                                                                .changePasswordKey,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                CustomTextField(
                                                                  isPassword:
                                                                      false,
                                                                  validation:
                                                                      AppValidations
                                                                          .requiredValidation,
                                                                  suffixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .password,
                                                                    color: AppColors
                                                                        .blueWpuColor,
                                                                  ),
                                                                  inputController:
                                                                      changePassword
                                                                          .oldPasswordController,
                                                                  hintText:
                                                                      "كلمة السر القديمة",
                                                                ),
                                                                CustomTextField(
                                                                  isPassword:
                                                                      false,
                                                                  validation:
                                                                      AppValidations
                                                                          .requiredValidation,
                                                                  suffixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .password,
                                                                    color: AppColors
                                                                        .blueWpuColor,
                                                                  ),
                                                                  inputController:
                                                                      changePassword
                                                                          .newPasswordController,
                                                                  hintText:
                                                                      "كلمة السر الجديدة",
                                                                ),
                                                                CustomTextField(
                                                                  isPassword:
                                                                      false,
                                                                  validation:
                                                                      (value) {
                                                                    return AppValidations.passwordConfirmationValidation(
                                                                        value,
                                                                        changePassword
                                                                            .newPasswordController
                                                                            .text);
                                                                  },
                                                                  suffixIcon:
                                                                      Icon(
                                                                    Icons
                                                                        .password,
                                                                    color: AppColors
                                                                        .blueWpuColor,
                                                                  ),
                                                                  inputController:
                                                                      changePassword
                                                                          .newPasswordConfirmController,
                                                                  hintText:
                                                                      "تأكيد كلمة السر",
                                                                ),
                                                                changePassword
                                                                            .connectionEnum ==
                                                                        ConnectionEnum
                                                                            .connecting
                                                                    ? const Circular()
                                                                    : SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                AppColors.blueWpuColor,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                            await changePassword.changePassword(
                                                                              onSuccess: () async {
                                                                                AppServices.successSnackBar(
                                                                                  context: context,
                                                                                  title: "تم تغيير كلمة السر",
                                                                                );
                                                                              },
                                                                              onError: () {
                                                                                AppServices.errorSncakBar(
                                                                                  context: context,
                                                                                  title: changePassword.errorMessage,
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            "تغيير كلمة السر",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Text(
                                              "تغيير كلمة السر",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.edit_square,
                            color: AppColors.blueWpuColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ProfileInfoListTile(
                      icon: const ProfilePhoto(
                        iconsize: 18,
                        radius: 14,
                      ),
                      subTitle: "الاسم",
                      title: myDetails.student!.name,
                    ),
                    ProfileInfoListTile(
                      icon: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.blueWpuColor,
                        child: SvgPicture.asset(
                          AppAssets.numbersIcon,
                          height: 16,
                          width: 16,
                        ),
                      ),
                      subTitle: "الرقم الجامعي",
                      title: myDetails.student!.uniNumber,
                    ),
                    ProfileInfoListTile(
                      icon: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.blueWpuColor,
                        child: SvgPicture.asset(
                          AppAssets.collageIcon,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                          height: 16,
                          width: 16,
                        ),
                      ),
                      subTitle: "الكلية",
                      title: myDetails.student!.collage.name,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddSubjectsPage(
                                    notMySubjects: notMySubjectsProvider,
                                  ),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          ": موادي",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                        child: MySubjectList(
                      mySubjectsProvider: mySubjects,
                    )),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                title: const Text(
                                  "هل تريد تسجيل الخروج؟",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: const Text(
                                        "تسجيل الخروج",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "لا",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        label: const Text(
                          "تسجيل الخروج",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: ProfilePhoto(
              iconsize: 60,
              radius: 50,
            ),
          )
        ],
      ),
    );
  }
}
