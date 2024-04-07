import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/pages/auth/login/login_form.dart';
import 'package:university_management/provider/auth/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: context.width,
                child: Image.asset(
                  AppAssets.loginBackGroundPic,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'أهلاً وسهلاً',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppStrings.appFont,
                              fontWeight: FontWeight.bold,
                              fontSize: AppServices.getResponsiveFontSize(
                                  context,
                                  fontSize: 40),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'تسجيل الدخول \n الى حسابك',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppStrings.appFont,
                              fontWeight: FontWeight.bold,
                              fontSize: AppServices.getResponsiveFontSize(
                                  context,
                                  fontSize: 30),
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    LoginForm(
                      provider: provider,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
