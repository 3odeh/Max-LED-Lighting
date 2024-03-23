import 'package:flutter/material.dart';
import 'package:project_1/models/max_led_lighting_model.dart';
import 'package:project_1/util/colors.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class CellNumberWidget extends StatelessWidget {
  final TableVicinity vicinity;
  final MaxLedLightingModel maxLedLighting;
  const CellNumberWidget({
    Key? key,
    required this.vicinity,
    required this.maxLedLighting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = '';
    // this for first cell
    if (vicinity.column == 0 && vicinity.row == 0) {
      text = '';
      // this for first data row (all zero)
    } else if (vicinity.column == 0 && vicinity.row == 1) {
      text = '0';
      // this for first data column (all zero)
    } else if (vicinity.column == 1 && vicinity.row == 0) {
      text = '0';
    } else if (vicinity.column == 0) {
      text =
          '${(vicinity.row == 0) ? 0 : maxLedLighting.numbers[vicinity.row - 2]}';
    } else if (vicinity.row == 0) {
      text = '${vicinity.column - 1}';
    }
    return Container(
      color: MyColors.cellPinnedColor,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
