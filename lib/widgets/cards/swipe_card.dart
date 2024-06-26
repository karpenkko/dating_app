import 'package:dating_app/widgets/round_copmonents/round_categories.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/user_profile/models/user_model.dart';

class SwipeCard extends StatelessWidget {
  final UserModel user;
  final bool showDottedBorder;

  const SwipeCard({
    super.key,
    required this.user,
    required this.showDottedBorder,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: showDottedBorder
          ? Theme.of(context).primaryColor
          : Colors.transparent,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      dashPattern: const [8, 8],
      radius: const Radius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: MemoryImage(user.photo!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(width: 8),
                Text(
                  '~ ${user.age} ~',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${user.city}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'шукає: ${user.searchPurpose}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
