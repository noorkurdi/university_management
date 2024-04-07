import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/provider/auth/login_provider.dart';
import 'package:university_management/widgets/custom_linear_button.dart';
import 'package:university_management/widgets/custom_text_field_widget.dart';
import 'package:university_management/widgets/show_password_icon.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.provider});

  final LoginProvider provider;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: AppKeys.loginKey,
      child: Column(
        children: [
          CustomTextField(
            validation: AppValidations.requiredValidation,
            isPassword: false,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(
                provider.passwordFocusNode,
              );
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode: provider.uniNumberFocusNode,
            inputController: provider.uniNumberController,
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
              isPassword: provider.isPasswordShow,
              keyboardType: TextInputType.text,
              focusNode: provider.passwordFocusNode,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) async {
                await provider.login();
              },
              inputController: provider.passwordController,
              hintText: "xxxxxxxxxx",
              primaryColor: Colors.black,
              labelText: "كلمة السر",
              suffixIcon: ShowPasswordIcon(
                isVisible: provider.isPasswordShow,
                onPressed: () {
                  provider.showPassword();
                },
              )),
          const SizedBox(
            height: 60,
          ),
          Center(
            child: CustomLinearButton(
              onTap: () async {
                await provider.login();
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
