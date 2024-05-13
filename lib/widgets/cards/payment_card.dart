import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../features/switching_themes/utils/colors.dart';
import '../../features/swipe_cards/bloc/swipe_cards_bloc.dart';

class PaymentCard extends StatelessWidget {

  PaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const RoundTitle(titleText: 'пошук піплов'),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 20),
                child: DottedBorder(
                  color: AppColor.blackColor,
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  dashPattern: const [8, 8],
                  radius: const Radius.circular(12),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'У вас не залишилось більше безкоштовних свайпів :(',
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Для користування додатком без обмежень оформіть підписку',
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 12),
                            decoration: BoxDecoration(
                              // color: AppColor.greenColor,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: AppColor.greenColor,
                              ),
                            ),
                            child: const Text(
                              '200 грн/місяць',
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
                          Expanded(child: Container()),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<SwipeCardsBloc>(context)
                                    .add(SwipeCardsPaymentEvent());
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  color: AppColor.pinkColor,
                                  borderRadius:
                                  BorderRadius.circular(40),
                                ),
                                child: const Text(
                                  'Оформити',
                                  style: TextStyle(
                                    color: AppColor.whiteColor,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
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
            ),
          ],
        ),
      ),
    );
  }
}
