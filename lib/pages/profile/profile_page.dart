import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/media_query_values.dart';
import 'package:university_management/pages/profile/profile_items/background_image.dart';
import 'package:university_management/pages/profile/profile_items/my_subject_list.dart';
import 'package:university_management/pages/profile/profile_items/profile_info_list_tile.dart';
import 'package:university_management/pages/profile/profile_items/profile_photo.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                            const FaIcon(
                              FontAwesomeIcons.four,
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_square,
                            color: AppColors.blueWpuColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const ProfileInfoListTile(
                      icon: ProfilePhoto(
                        iconsize: 18,
                        radius: 14,
                      ),
                      subTitle: "الاسم",
                      title: "Noor",
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
                      title: "201910608",
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
                      title: "هندسة حاسوب",
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        ": موادي",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Expanded(child: MySubjectList())
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50),
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
