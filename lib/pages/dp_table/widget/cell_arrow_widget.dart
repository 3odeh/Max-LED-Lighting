import 'package:flutter/cupertino.dart';

class CellArrowWidget extends StatelessWidget {
  final int cost;
  final bool? best;
  const CellArrowWidget({
    Key? key,
    required this.cost,
    this.best,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // true = up_left , false left , null = up
    if (best == null) {
      // up
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            CupertinoIcons.arrow_up,
            size: 25,
          ),
          Text(
            '$cost',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
    } else if (best!) {
      // up_left
      return Column(
        children: [
          const Row(
            children: [
              Icon(
                CupertinoIcons.arrow_up_left,
                size: 25,
              ),
            ],
          ),
          Text(
            '$cost',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
    } else {
      // left
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            CupertinoIcons.arrow_left,
            size: 25,
          ),
          Text(
            '$cost',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      );
    }
  }
}
