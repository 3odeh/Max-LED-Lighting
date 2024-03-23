import 'dart:async';

import 'package:project_1/models/max_led_lighting_model.dart';

class MaxLedLightingCalculator {
  static Future<MaxLedLightingModel> maxLedLightingCalculate(
      List<int> data) async {
    // initialize cost array
    List<List<int>> cost = List.generate(
      data.length + 1,
      (index) => List.generate(
        data.length + 1,
        (index) => 0,
      ),
    );
    // initialize best array defult arrow up
    List<List<bool?>> best = List.generate(
      data.length + 1,
      (index) => List.generate(
        data.length + 1,
        (index) => null,
      ),
    ); // true = up_left , false left , null = up

    // this for to calculate the dp table
    for (var i = 1; i < cost.length; i++) {
      for (var j = 1; j < cost[i].length; j++) {
        if (j == data[i - 1]) {
          cost[i][j] = cost[i - 1][j - 1] + 1;
          best[i][j] = true; // up_left,
        } else if (cost[i - 1][j] < cost[i][j - 1]) {
          cost[i][j] = cost[i][j - 1];
          best[i][j] = false; //left
        } else {
          cost[i][j] = cost[i - 1][j];
          best[i][j] = null; //up
        }
      }
    }

    // To find the result of table
    List<int> res = [];
    for (int i = best.length - 1, j = best[0].length - 1; i > 0 && j > 0;) {
      if (best[i][j] == null) {
        //up
        i--;
      } else if (!best[i][j]!) {
        //left
        j--;
      } else {
        //up_left
        res.insert(0, data[i - 1]);
        i--;
        j--;
      }
    }

    return MaxLedLightingModel(
        numbers: data, cost: cost, best: best, result: res);
  }
}
