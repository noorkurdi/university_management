import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/pages/root_page.dart';
import 'package:university_management/provider/auth/login_provider.dart';
import 'package:university_management/provider/auth/my_details_provider.dart';
import 'package:university_management/provider/other/navigation_bar_provider.dart';
import 'package:university_management/provider/schedule/today_schedule_provider.dart';
import 'package:university_management/widgets/custom_linear_button.dart';
import 'package:university_management/widgets/custom_text_field_widget.dart';
import 'package:university_management/widgets/show_password_icon.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.loginProvider});

  final LoginProvider loginProvider;
  @override
  Widget build(BuildContext context) {
    final myDetails = Provider.of<MyDetalisProvider>(context);
    final todaySchedule = Provider.of<TodayScheduleProvider>(context);
    final navigationBarProvider = Provider.of<NavigationBarProvider>(context);
    return Form(
      key: AppKeys.loginKey,
      child: Column(
        children: [
          CustomTextField(
            validation: AppValidations.requiredValidation,
            isPassword: false,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(
                loginProvider.passwordFocusNode,
              );
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode: loginProvider.uniNumberFocusNode,
            inputController: loginProvider.uniNumberController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(9) // Specify the maximum length
            ],
            hintText: "201921534",
            primaryColor: Colors.black,
            labelText: "الرقم الجامعي",
            suffixIcon: Icon(
              Icons.numbers,
              color: AppColors.yelloWpuColor,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            validation: AppValidations.requiredValidation,
            isPassword: loginProvider.isPasswordShow,
            keyboardType: TextInputType.visiblePassword,
            focusNode: loginProvider.passwordFocusNode,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) async {
              await loginProvider.login(
                onSuccess: () async {
                  navigationBarProvider.currentHomeIndex = 3;
                  AppServices.clearEvent(controller: [
                    loginProvider.passwordController,
                    loginProvider.uniNumberController,
                  ]);
                  await myDetails.getMyDetails();
                  await todaySchedule.getTodaySchedule();
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ),
                        (route) => false);
                    AppServices.successSnackBar(
                        context: context, title: 'أهلاً وسهلاً بك');
                  }
                },
                onError: () {
                  AppServices.errorSncakBar(
                      context: context,
                      title: "حدث خطأ, الرجاء المحاولة مجدداً");
                },
              );
            },
            inputController: loginProvider.passwordController,
            hintText: "xxxxxxxxxx",
            primaryColor: Colors.black,
            labelText: "كلمة السر",
            suffixIcon: ShowPasswordIcon(
              isVisible: loginProvider.isPasswordShow,
              onPressed: () {
                loginProvider.showPassword();
              },
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Center(
            child: CustomLinearButton(
              onTap: () async {
                await loginProvider.login(
                  onSuccess: () async {
                    navigationBarProvider.currentHomeIndex = 3;
                    AppServices.clearEvent(controller: [
                      loginProvider.passwordController,
                      loginProvider.uniNumberController,
                    ]);
                    await myDetails.getMyDetails();
                    await todaySchedule.getTodaySchedule();
                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RootPage(),
                          ),
                          (route) => false);
                      AppServices.successSnackBar(
                          context: context, title: 'أهلاً وسهلاً بك');
                    }
                  },
                  onError: () {
                    AppServices.errorSncakBar(
                        context: context,
                        title: "حدث خطأ, الرجاء المحاولة مجدداً");
                  },
                );
              },
              colors: [
                AppColors.blueWpuColor,
                const Color.fromARGB(255, 2, 46, 94)
              ],
              child: Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppServices.getResponsiveFontSize(
                      context,
                      fontSize: 18,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
