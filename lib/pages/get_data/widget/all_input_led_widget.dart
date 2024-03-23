import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import 'package:project_1/pages/get_data/widget/input_led_widget.dart';
import 'package:project_1/util/colors.dart';

class AllInputLedWidget extends StatelessWidget {
  final List<int>? data;
  final List<bool>? added;
  final bool checkValue;
  final Function(dynamic vale, int index) onChange;
  final List<SingleValueDropDownController>? controllers;

  const AllInputLedWidget({
    Key? key,
    required this.data,
    required this.added,
    this.checkValue = false,
    required this.onChange,
    required this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data?.length ?? 5,
          itemBuilder: (c, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 250,
              height: 200,
              child: (data == null || controllers == null || added == null)
                  ? Container(
                      color: MyColors.unselectedColor,
                    )
                  : InputLedWidget(
                      controller: controllers![index],
                      textError: validator(
                          controllers![index].dropDownValue!.name, index),
                      onChange: (value) {
                        onChange(value, index);
                      },
                      dropList: suggestionsList(),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  List<DropDownValueModel> suggestionsList() {
    List<DropDownValueModel> suggestions = [];
    for (var i = 0; i < added!.length; i++) {
      if (!added![i]) {
        suggestions.add(
            DropDownValueModel(name: (i + 1).toString(), value: 'value$i'));
      }
    }
    return suggestions;
  }

  String? validator(String value, int index) {
    if (!checkValue) {
      return null;
    }
    if (value.isEmpty) {
      return "Please enter the number";
    }
    try {
      int num = int.parse(value);
      if (num > data!.length || num < 1) {
        return "$value is not valid, the number must be from 1 to ${data!.length}";
      }
      if (data![index] != num && added![num - 1]) {
        return "The number $value is already added";
      }
    } catch (e) {
      return "$value is not valid, the number must be from 1 to ${data!.length}";
    }
    return null;
  }
}
