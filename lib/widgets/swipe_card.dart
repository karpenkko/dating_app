import 'package:dating_app/widgets/round_copmonents/round_categories.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class SwipeCard extends StatelessWidget {
  final String buttonText;

  const SwipeCard({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> hobbies = [
      'фотографія',
      'кулінарія',
      'книги',
      'психологія',
      'спорт'
    ];

    return DottedBorder(
      color: AppColor.blackColor,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      dashPattern: const [8, 8],
      radius: const Radius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/woman.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: const TextStyle(
                    color: AppColor.blackColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '23',
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: hobbies.map((hobby) {
                return RoundCategories(
                  hobby: hobby,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
