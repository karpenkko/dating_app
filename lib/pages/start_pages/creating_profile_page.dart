import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter_svg/svg.dart';

import '../../blocks/create_profile_block/creating_profile_bloc.dart';
import '../../colors.dart';
import '../../widgets/buttons/big_button.dart';
import '../../widgets/buttons/icon_button.dart';
import '../../widgets/dropdown_search.dart';
import '../../widgets/login_field.dart';
import 'hobbies_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Gender { male, female }

class CreatingProfilePage extends StatefulWidget {
  const CreatingProfilePage({super.key});

  @override
  State<CreatingProfilePage> createState() => _CreatingProfilePageState();
}

class _CreatingProfilePageState extends State<CreatingProfilePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  // final CreatingProfileBloc creatingProfileBloc = CreatingProfileBloc();

  @override
  void initState() {
    BlocProvider.of<CreatingProfileBloc>(context).add(
      CreatingProfileFetchEvent(),
    );

    // creatingProfileBloc.add(CreatingProfileFetchEvent());
    super.initState();
  }

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

  late String name;
  late int? age;
  Gender? selectedGender;

  String? _selectedItem;
  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: BlocConsumer<CreatingProfileBloc, CreatingProfileState>(
        // bloc: creatingProfileBloc,
        listenWhen: (previous, current) =>
            current is CreatingProfileActionState,
        buildWhen: (previous, current) =>
            current is! CreatingProfileActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CreatingProfileInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CreatingProfileLoading) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                      const SizedBox(height: 20),

                      //GENDER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = Gender.male;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                // width: 320,
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 16),
                                decoration: BoxDecoration(
                                  color: selectedGender == Gender.male
                                      ? AppColor.pinkColor
                                      : null,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: selectedGender == Gender.male
                                        ? AppColor.pinkColor
                                        : AppColor.blackColor,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  'чоловік',
                                  style: TextStyle(
                                    color: selectedGender == Gender.male
                                        ? AppColor.whiteColor
                                        : AppColor.blackColor.withOpacity(0.8),
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGender = Gender.female;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                // width: 320,
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 16),
                                decoration: BoxDecoration(
                                  color: selectedGender == Gender.female
                                      ? AppColor.pinkColor
                                      : null,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: selectedGender == Gender.female
                                        ? AppColor.pinkColor
                                        : AppColor.blackColor,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  'жінка',
                                  style: TextStyle(
                                    color: selectedGender == Gender.female
                                        ? AppColor.whiteColor
                                        : AppColor.blackColor.withOpacity(0.8),
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      //the purpose of the search
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColor.blackColor,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: AppColor.blackColor,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 25),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/dropdown.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColor.blackColor, BlendMode.srcIn),
                          height: 8,
                        ),
                        isExpanded: true,
                        hint: Text(
                          'Оберіть щось',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: AppColor.blackColor.withOpacity(0.8),
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        value: _selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                        items: _options
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontFamily: 'Raleway',
                                      color: AppColor.blackColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        // underline: Container(),
                      ),
                      const SizedBox(height: 20),

                      //SEARCH REGION
                      // DropdownSearch<String>(
                      //   items: state.regions,
                      //   dropdownButtonProps: DropdownButtonProps(
                      //     padding: const EdgeInsets.only(left: 25, right: 25),
                      //     icon: SvgPicture.asset(
                      //       'assets/icons/dropdown.svg',
                      //       colorFilter: const ColorFilter.mode(
                      //           AppColor.blackColor, BlendMode.srcIn),
                      //       height: 8,
                      //     ),
                      //   ),
                      //   dropdownDecoratorProps: DropDownDecoratorProps(
                      //     baseStyle: const TextStyle(
                      //       fontFamily: 'Raleway',
                      //       color: AppColor.blackColor,
                      //       fontSize: 16.0,
                      //       fontWeight: FontWeight.normal,
                      //     ),
                      //     textAlignVertical: TextAlignVertical.center,
                      //     dropdownSearchDecoration: InputDecoration(
                      //       contentPadding: EdgeInsets.symmetric(
                      //           horizontal: 25, vertical: 16),
                      //       hintText: 'Оберіть область',
                      //       hintStyle: TextStyle(
                      //         fontFamily: 'Raleway',
                      //         color: AppColor.blackColor.withOpacity(0.8),
                      //         fontSize: 16.0,
                      //         fontWeight: FontWeight.normal,
                      //       ),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: const BorderSide(
                      //           color: AppColor.blackColor,
                      //           width: 1,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   popupProps: const PopupProps.menu(
                      //     showSearchBox: true,
                      //   ),
                      //   onChanged: (selectedValue) {
                      //     if (selectedValue != null) {
                      //       BlocProvider.of<CreatingProfileBloc>(context).add(
                      //         RegionDropdownValueChangedEvent(selectedValue),
                      //       );
                      //     }
                      //   },
                      // ),
                      CustomDropdownSearch(
                        isEnable: true,
                        items: state.regions,
                        title: 'Оберіть область',
                        onChanged: (selectedValue) {
                          if (selectedValue != null) {
                            BlocProvider.of<CreatingProfileBloc>(context).add(
                              RegionDropdownValueChangedEvent(selectedValue),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomDropdownSearch(
                        isEnable: state.communities.isNotEmpty,
                        items: state.communities,
                        title: 'Оберіть громаду',
                        onChanged: (selectedValue) {
                          if (selectedValue != null) {
                            BlocProvider.of<CreatingProfileBloc>(context).add(
                              CommunityDropdownValueChangedEvent(selectedValue),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomDropdownSearch(
                        isEnable: state.cities.isNotEmpty,
                        items: state.cities,
                        title: 'Оберіть населений пункт',
                        onChanged: (selectedValue) {
                          if (selectedValue != null) {
                            BlocProvider.of<CreatingProfileBloc>(context).add(
                              CityDropdownValueChangedEvent(selectedValue),
                            );
                          }
                        },
                      ),


                      //ІНТЕРЕСИ
                      // const SizedBox(height: 60),
                      // const Text(
                      //   'інтереси',
                      //   style: TextStyle(
                      //     color: AppColor.blackColor,
                      //     fontFamily: 'Raleway',
                      //     fontSize: 18,
                      //     height: 1.2,
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
                      // GestureDetector(
                      //   onTap: () => _displayBottomSheet(),
                      //   child: DottedBorder(
                      //     color: AppColor.blackColor,
                      //     strokeCap: StrokeCap.round,
                      //     borderType: BorderType.RRect,
                      //     dashPattern: const [8, 8],
                      //     radius: const Radius.circular(10),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(56),
                      //       child: Column(
                      //         children: [
                      //           Text(
                      //             'оберіть від 3 до 5 пунктів',
                      //             style: TextStyle(
                      //               color: AppColor.blackColor.withOpacity(0.8),
                      //               fontFamily: 'Raleway',
                      //               fontSize: 16,
                      //               height: 1.2,
                      //             ),
                      //           ),
                      //           const SizedBox(height: 15),
                      //           const RoundIconButton(path: 'assets/icons/plus.svg'),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 60),
                      BigButton(
                        buttonText: 'Розпочати',
                        onTap: () {
                          name = nameController.text.trim();
                          age = int.tryParse(ageController.text.trim());
                          print('Name - $name');
                          print('Age - $age');
                          print('Sex - $selectedGender');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
