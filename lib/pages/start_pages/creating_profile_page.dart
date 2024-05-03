import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter_svg/svg.dart';

import '../../colors.dart';
import '../../widgets/buttons/big_button.dart';
import '../../widgets/buttons/icon_button.dart';
import '../../widgets/login_button.dart';
import '../../widgets/login_field.dart';
import 'hobbies_page.dart';

class CreatingProfilePage extends StatefulWidget {
  const CreatingProfilePage({super.key});

  @override
  State<CreatingProfilePage> createState() => _CreatingProfilePageState();
}

class _CreatingProfilePageState extends State<CreatingProfilePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void _displayBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const HobbiesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: [
                const RoundTitle(titleText: 'заповнення профілю'),
                const SizedBox(height: 60),
                DottedBorder(
                  color: AppColor.blackColor,
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  dashPattern: const [8, 8],
                  radius: const Radius.circular(10),
                  child: const Padding(
                    padding: EdgeInsets.all(34.0),
                    child: RoundIconButton(path: 'assets/icons/plus.svg'),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'аватар',
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontFamily: 'Raleway',
                    fontSize: 18,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 40),
                LoginField(
                  controller: nameController,
                  hintText: 'ім\'я',
                  length: 16.0,
                ),
                const SizedBox(height: 20),
                LoginField(
                  controller: ageController,
                  hintText: 'вік',
                  length: 16.0,
                ),
                const SizedBox(height: 60),
                const Text(
                  'інтереси',
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontFamily: 'Raleway',
                    fontSize: 18,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _displayBottomSheet(),
                  child: DottedBorder(
                    color: AppColor.blackColor,
                    strokeCap: StrokeCap.round,
                    borderType: BorderType.RRect,
                    dashPattern: const [8, 8],
                    radius: const Radius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(56),
                      child: Column(
                        children: [
                          Text(
                            'оберіть від 3 до 5 пунктів',
                            style: TextStyle(
                              color: AppColor.blackColor.withOpacity(0.8),
                              fontFamily: 'Raleway',
                              fontSize: 16,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 15),
                          const RoundIconButton(path: 'assets/icons/plus.svg'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                BigButton(buttonText: 'Розпочати',   onTap: () {},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
