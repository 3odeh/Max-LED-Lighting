import 'package:flutter/material.dart';
import 'package:project_1/util/colors.dart';
import 'package:project_1/util/text_style.dart';

class LedWidget extends StatelessWidget {
  final bool isOn;
  final int number;

  const LedWidget({
    Key? key,
    required this.isOn,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            size: 15,
            color: (isOn) ? MyColors.onColor : MyColors.offColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            number.toString(),
            style: MyTextStyles.text_18D.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/led_${(isOn) ? "on" : "off"}.png',
            height: 50,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
