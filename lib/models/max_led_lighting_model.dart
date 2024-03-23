class MaxLedLightingModel {
  final List<int> numbers;
  final List<List<int>> cost;
  final List<List<bool?>> best;
  final List<int> result;

  MaxLedLightingModel({
    required this.numbers,
    required this.cost,
    required this.best,
    required this.result,
  });

  void printAll() {
    String res = '';
    for (var i = 0; i < cost.length; i++) {
      for (var j = 0; j < cost[i].length; j++) {
        res = '$res ${cost[i][j]}';
      }
      print(res);
      res = '';
    }

    print('');
    res = '';
    for (var i = 0; i < best.length; i++) {
      for (var j = 0; j < best[i].length; j++) {
        String data = (best[i][j] == null)
            ? '|'
            : (!best[i][j]!)
                ? '-'
                : '\\';
        res = '$res $data';
      }
      print(res);
      res = '';
    }

    print(result);

    print('');
    for (var i = 0; i < cost.length; i++) {
      print('${cost[i]}');
    }
    print('');
    for (var i = 0; i < cost.length; i++) {
      print('${best[i]}');
    }
  }
}
