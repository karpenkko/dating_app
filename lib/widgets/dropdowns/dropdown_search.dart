import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDropdownSearch extends StatelessWidget {
  final bool isEnable;
  final List<String> items;
  final String title;
  final Function(String?)? onChanged;

  const CustomDropdownSearch({
    super.key,
    required this.isEnable,
    required this.items,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      enabled: isEnable,
      items: items,
      dropdownButtonProps: DropdownButtonProps(
        padding: const EdgeInsets.only(left: 25, right: 25),
        icon: SvgPicture.asset(
          'assets/icons/dropdown.svg',
          colorFilter:
              ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
          height: 8,
        ),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(
          fontFamily: 'Raleway',
          color: Theme.of(context).primaryColor,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        textAlignVertical: TextAlignVertical.center,
        dropdownSearchDecoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
          hintText: title,
          hintStyle: TextStyle(
            fontFamily: 'Raleway',
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
        ),
      ),
      popupProps: const PopupProps.menu(
        showSearchBox: true,
      ),
      onChanged: onChanged,
    );
  }
}
