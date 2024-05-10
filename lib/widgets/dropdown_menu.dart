import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../features/switching_themes/utils/colors.dart';

class CustomDropdownMenu extends StatelessWidget {
  final String? selectedItem;
  final List<String> options;
  final Function(String?)? onChanged;


  const CustomDropdownMenu({
    super.key,
    required this.selectedItem,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 25,
        ),
      ),
      icon: SvgPicture.asset(
        'assets/icons/dropdown.svg',
        colorFilter: ColorFilter.mode(
          Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
        height: 8,
      ),
      isExpanded: true,
      hint: Text(
        'Кого шукаєте',
        style: TextStyle(
          fontFamily: 'Raleway',
          color: Theme.of(context).primaryColor.withOpacity(0.8),
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      value: selectedItem,
      onChanged: onChanged,
      items: options
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Theme.of(context).primaryColor,
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
    );
  }
}
