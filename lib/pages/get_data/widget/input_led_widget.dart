import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:project_1/util/colors.dart';
import 'package:project_1/util/text_style.dart';

class InputLedWidget extends StatelessWidget {
  final List<DropDownValueModel> dropList;
  final SingleValueDropDownController controller;
  final String? textError;
  final Function(dynamic value) onChange;
  const InputLedWidget({
    Key? key,
    required this.dropList,
    required this.controller,
    this.textError,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/led.png',
            height: 60,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: DropDownTextField(
              enableSearch: true,
              clearOption: true,
              controller: controller,
              textFieldDecoration: InputDecoration(
                hintText: "Select Number",
                alignLabelWithHint: true,
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
                errorText: textError != null ? '' : null,
                errorStyle: const TextStyle(fontSize: 0),
              ),
              dropDownItemCount: 5,
              dropdownRadius: 12,
              searchDecoration: const InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(
                    Icons.search,
                  )),
              validator: (v) {
                return textError == null ? null : '';
              },
              dropDownList: dropList,
              onChanged: onChange,
            ),
          ),
          if (textError != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                textError!,
                style: MyTextStyles.errorText_12
                    .copyWith(overflow: TextOverflow.visible),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
