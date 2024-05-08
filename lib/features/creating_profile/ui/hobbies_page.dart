import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../colors.dart';
import '../../../widgets/buttons/big_button.dart';
import '../../../widgets/round_copmonents/round_hobbies.dart';
import '../bloc/creating_profile_bloc.dart';

class HobbiesPage extends StatefulWidget {
  const HobbiesPage({
    super.key,
  });

  @override
  State<HobbiesPage> createState() => _HobbiesPageState();
}

class _HobbiesPageState extends State<HobbiesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<CreatingProfileBloc, CreatingProfileState>(
        listenWhen: (previous, current) =>
        current is CreatingProfileActionState,
        buildWhen: (previous, current) =>
        current is! CreatingProfileActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CreatingProfileLoading) {
            return Container(
              color: AppColor.whiteColor,
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 40, bottom: 30, left: 10, right: 10),
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
                    children: state.hobbies.map((hobby) {
                      final isSelected = state.selectedHobbies.contains(hobby);
                      return RoundHobbies(
                        hobby: hobby,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              BlocProvider.of<CreatingProfileBloc>(context).add(
                                HobbiesRemovedEvent(hobby),
                              );
                            } else {
                              BlocProvider.of<CreatingProfileBloc>(context).add(
                                HobbiesAddedEvent(hobby),
                              );
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                  BigButton(
                    buttonText: 'Готово',
                    onTap: () {
                      if(state.selectedHobbies.length < 3){
                        const snackBar = SnackBar(
                          content: Text('Оберіть від 3 до 5 пунктів'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Future.delayed(const Duration(seconds: 3), () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        });
                      }
                      else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
