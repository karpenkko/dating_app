import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../widgets/buttons/big_button.dart';
import '../../widgets/round_copmonents/round_hobbies.dart';

class HobbiesPage extends StatefulWidget {
  const HobbiesPage({
    super.key,
  });

  @override
  State<HobbiesPage> createState() => _HobbiesPageState();
}

class _HobbiesPageState extends State<HobbiesPage> {
  final List<String> hobbies = [
    'фотографія',
    'кулінарія',
    'книги',
    'психологія',
    'спорт'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40, bottom: 30, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'оберіть від 3 до 5 пунктів',
            style: TextStyle(
              color: AppColor.blackColor,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.normal,
              fontSize: 16,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: hobbies.map((hobby) {
              return GestureDetector(
                onTap: () {
                  print('Було натиснуто на елемент з текстом $hobby');
                },
                child: RoundHobbies(
                  hobby: hobby,
                ),
              );
            }).toList(),
          ),
          Expanded(child: Container()),
          BigButton(
            buttonText: 'Готово',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
