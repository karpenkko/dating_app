import 'package:dating_app/widgets/round_copmonents/round_categories.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/switching_themes/utils/colors.dart';
import '../../features/user_profile/models/user_model.dart';

class ConnectCard extends StatelessWidget {
  final UserModel user;

  const ConnectCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Theme.of(context).primaryColor,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      dashPattern: const [8, 8],
      radius: const Radius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: MemoryImage(user.photo!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      '${user.age}, ${user.city}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 140,
                      child: Text(
                        'шукає: ${user.searchPurpose}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          height: 1.2,
                        ),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: user.hobbies!.map((hobby) {
                return RoundCategories(
                  hobby: hobby,
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri(
                  scheme: 'tel',
                  path: '${user.phone}',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('cannot launch this url');
                }
              },
              child: Container(
                width: 240,
                // width: 320,
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: AppColor.greenColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Зателефонувати',
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
