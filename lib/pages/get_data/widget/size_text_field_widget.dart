import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_1/util/colors.dart';
import 'package:project_1/util/text_style.dart';

class SizeTextFieldWidget extends StatelessWidget {
  final TextEditingController numberTF;
  final Function(String value) onChanged;
  const SizeTextFieldWidget({
    Key? key,
    required this.numberTF,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: numberTF,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        FilteringTextInputFormatter.deny(RegExp(r'^0'))
      ],
      onChanged: onChanged,
      style: MyTextStyles.text_18D,
      textAlign: TextAlign.center,
      cursorColor: MyColors.primaryColor,
      decoration: InputDecoration(
          counterText: "",
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.primaryColor),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.primaryColor),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.errorColor),
            borderRadius: BorderRadius.circular(12),
          ),
          error: null,
          errorStyle: const TextStyle(fontSize: 0)),
    );
  }
}
