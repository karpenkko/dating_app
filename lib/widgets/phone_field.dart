import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  final FocusNode focusNode = FocusNode();
  final Function(String) onPhoneNumberChanged;

  PhoneField({super.key, required this.onPhoneNumberChanged});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      style: TextStyle(
        fontFamily: 'Raleway',
        color: Theme.of(context).primaryColor,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      focusNode: focusNode,
      invalidNumberMessage: 'Недійсний номер',
      // showDropdownIcon: false,
      dropdownIcon: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).scaffoldBackgroundColor,
        size: 12,
      ),
      dropdownTextStyle: TextStyle(
        fontFamily: 'Raleway',
        color: Theme.of(context).primaryColor.withOpacity(0.8),
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
        helperStyle: TextStyle(
          fontFamily: 'Raleway',
          color: Theme.of(context).primaryColor,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: TextStyle(
          fontFamily: 'Raleway',
          color: Theme.of(context).primaryColor.withOpacity(0.8),
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
      initialCountryCode: 'UA',
      languageCode: "ua",
      onChanged: (phone) {
        onPhoneNumberChanged(phone.completeNumber);
        print(phone.completeNumber);
      },
    );
  }
}
