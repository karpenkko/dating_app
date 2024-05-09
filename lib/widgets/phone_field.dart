import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../colors.dart';

class PhoneField extends StatelessWidget {
  final FocusNode focusNode = FocusNode();

  PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      style: const TextStyle(
        fontFamily: 'Raleway',
        color: AppColor.blackColor,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      focusNode: focusNode,
      invalidNumberMessage: 'Недійсний номер',
      // showDropdownIcon: false,
      dropdownIcon: const Icon(
        Icons.arrow_drop_down,
        color: AppColor.whiteColor,
        size: 12,
      ),
      dropdownTextStyle: TextStyle(
        fontFamily: 'Raleway',
        color: AppColor.blackColor.withOpacity(0.8),
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        labelText: 'Номер телефону',
        hintStyle: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        errorStyle: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        helperStyle: const TextStyle(
          fontFamily: 'Raleway',
          color: AppColor.blackColor,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: TextStyle(
          fontFamily: 'Raleway',
          color: AppColor.blackColor.withOpacity(0.8),
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.blackColor.withOpacity(0.7),
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.blackColor,
            width: 1,
          ),
        ),
      ),
      initialCountryCode: 'UA',
      languageCode: "ua",
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
