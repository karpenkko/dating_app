import 'dart:typed_data';

import 'package:dating_app/utils/select_img.dart';
import 'package:dating_app/widgets/buttons/gender_button.dart';
import 'package:dating_app/widgets/round_copmonents/round_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/phone_field.dart';
import '../bloc/creating_profile_bloc.dart';
import '../../switching_themes/utils/colors.dart';
import '../../../widgets/buttons/big_button.dart';
import '../../../widgets/buttons/icon_button.dart';
import '../../../widgets/dropdown_search.dart';
import '../../../widgets/login_field.dart';
import '../../../widgets/dropdown_menu.dart';
import '../../../widgets/round_copmonents/round_hobbies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void initState() {
    BlocProvider.of<CreatingProfileBloc>(context).add(
      CreatingProfileFetchEvent(),
    );
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImg(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  late String name;
  late int? age;
  String? selectedGender;


  String? selectedItem;
  final List<String> options = [
    'Партнера (дівчину)',
    'Партнера (хлопця)',
    'Друзів',
    'Колег',
    'Когось аби випити кави'
  ];

  void _displayBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => HobbiesPage(),
    );
  }

  bool _validateFields() {
    var finalRegion = BlocProvider.of<CreatingProfileBloc>(context).region;
    var finalCommunity =
        BlocProvider.of<CreatingProfileBloc>(context).community;
    var finalCity = BlocProvider.of<CreatingProfileBloc>(context).city;
    var finalHobbies =
        BlocProvider.of<CreatingProfileBloc>(context).selectedHobbies;
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        selectedGender == null ||
        finalRegion == null ||
        finalCommunity == null ||
        finalCity == null ||
        finalHobbies.length < 3) {
      const snackBar = SnackBar(
        content: Text('Заповніть всі поля'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Future.delayed(const Duration(seconds: 3), () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      GestureDetector(
                        onTap: selectImage,
                        child: DottedBorder(
                          color: Theme.of(context).primaryColor,
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          dashPattern: const [8, 8],
                          radius: const Radius.circular(10),
                          child: _image != null
                              ? Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: MemoryImage(_image!),
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(34.0),
                                  child: RoundIconButton(
                                      path: 'assets/icons/plus.svg'),
                                ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'аватар',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 40),

                      //NAME AND AGE
                      LoginField(
                        controller: nameController,
                        hintText: 'Ім\'я',
                        length: 16.0,
                      ),
                      const SizedBox(height: 20),
                      LoginField(
                        controller: ageController,
                        hintText: 'Вік',
                        length: 16.0,
                      ),
                      const SizedBox(height: 20),

                      //GENDER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GenderButton(
                            selectedGender: selectedGender,
                            gender: "Чоловік",
                            buttonText: 'Чоловік',
                            onTap: () {
                              setState(() {
                                selectedGender = "Чоловік";
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          GenderButton(
                            selectedGender: selectedGender,
                            gender: "Жінка",
                            buttonText: 'Жінка',
                            onTap: () {
                              setState(() {
                                selectedGender = "Жінка";
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      PhoneField(),
                      //PHONE NUMBER
                      const SizedBox(height: 20),

                      //THE PURPOSE OF THE SEARCH
                      CustomDropdownMenu(
                        selectedItem: selectedItem,
                        options: options,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedItem = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 20),

                      //SEARCH REGION
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

                      //HOBBIES
                      const SizedBox(height: 60),
                      Text(
                        'інтереси',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => _displayBottomSheet(),
                        child: SizedBox(
                          width: double.infinity,
                          child: DottedBorder(
                            color: Theme.of(context).primaryColor,
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            dashPattern: const [8, 8],
                            radius: const Radius.circular(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 40, horizontal: 20),
                                child: state.selectedHobbies.isEmpty
                                    ? Column(
                                        children: [
                                          const SizedBox(height: 5),
                                          Text(
                                            'оберіть від 3 до 5 пунктів',
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColor
                                                  .withOpacity(0.8),
                                              fontFamily: 'Raleway',
                                              fontSize: 16,
                                              height: 1.2,
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          const RoundIconButton(
                                              path: 'assets/icons/plus.svg'),
                                        ],
                                      )
                                    : Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 10.0,
                                        runSpacing: 10.0,
                                        children:
                                            state.selectedHobbies.map((hobby) {
                                          return RoundHobbies(
                                            hobby: hobby,
                                            isSelected: true,
                                            onTap: () {},
                                          );
                                        }).toList(),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      BigButton(
                        buttonText: 'Розпочати',
                        onTap: () {
                          if (_validateFields()) {
                            print('good');
                          }
                        },
                      ),
                    ],
                  ),
                ),
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
