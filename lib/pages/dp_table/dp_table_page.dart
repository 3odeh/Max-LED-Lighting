import 'package:flutter/material.dart';
import 'package:project_1/models/max_led_lighting_model.dart';
import 'package:project_1/pages/dp_table/widget/cell_arrow_widget.dart';
import 'package:project_1/pages/dp_table/widget/cell_number_widget.dart';
import 'package:project_1/util/text_style.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class DPTablePage extends StatefulWidget {
  final MaxLedLightingModel maxLedLighting;
  const DPTablePage({
    super.key,
    required this.maxLedLighting,
  });

  @override
  State<DPTablePage> createState() => _DPTablePageState();
}

class _DPTablePageState extends State<DPTablePage> {
  final ScrollController _tableVerticalController = ScrollController();
  final ScrollController _tableHorizontalController = ScrollController();
  late final double tableSize;

  @override
  void initState() {
    super.initState();
    tableSize = (widget.maxLedLighting.cost.length + 1) * 70;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DP Table",
          style: MyTextStyles.text_28L.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isScrollHorizontal())
            SizedBox(
              width: getSizeSizedBox(),
            ),
          Expanded(
            child: TableView.builder(
              verticalDetails: ScrollableDetails.vertical(
                  controller: _tableVerticalController),
              horizontalDetails: ScrollableDetails.horizontal(
                  controller: _tableHorizontalController),
              pinnedRowCount:
                  (widget.maxLedLighting.cost.length + 1 > 5000) ? 0 : 1,
              pinnedColumnCount:
                  (widget.maxLedLighting.cost[0].length + 1 > 5000) ? 0 : 1,
              cellBuilder: _buildCell,
              columnCount: widget.maxLedLighting.cost[0].length + 1,
              columnBuilder: (index) => const TableSpan(
                foregroundDecoration: TableSpanDecoration(
                  border: TableSpanBorder(),
                ),
                padding: TableSpanPadding.all(0),
                extent: FixedTableSpanExtent(70),
              ),
              rowCount: widget.maxLedLighting.cost.length + 1,
              rowBuilder: (int index) => const TableSpan(
                backgroundDecoration: TableSpanDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: TableSpanBorder(),
                ),
                padding: TableSpanPadding.all(0),
                extent: FixedTableSpanExtent(70),
              ),
            ),
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: (!isScrollHorizontal() && !isScrollVirtical())
          ? null
          : <Widget>[
              if (isScrollHorizontal())
                ElevatedButton(
                  onPressed: () {
                    _tableHorizontalController.jumpTo(0);
                  },
                  child: Text(
                    'Jump to Left',
                    style: MyTextStyles.text_16L,
                  ),
                ),
              if (isScrollVirtical())
                ElevatedButton(
                  onPressed: () {
                    _tableVerticalController.jumpTo(0);
                  },
                  child: Text(
                    'Jump to Top',
                    style: MyTextStyles.text_16L,
                  ),
                ),
              if (isScrollVirtical())
                ElevatedButton(
                  onPressed: () {
                    _tableVerticalController.jumpTo(
                        _tableVerticalController.position.maxScrollExtent);
                  },
                  child: Text(
                    'Jump to Bottom',
                    style: MyTextStyles.text_16L,
                  ),
                ),
              if (isScrollHorizontal())
                ElevatedButton(
                  onPressed: () {
                    _tableHorizontalController.jumpTo(
                        _tableHorizontalController.position.maxScrollExtent);
                  },
                  child: Text(
                    'Jump to Right',
                    style: MyTextStyles.text_16L,
                  ),
                ),
            ],
    );
  }

  Widget _buildCell(BuildContext context, TableVicinity vicinity) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: (vicinity.column == 0 || vicinity.row == 0)
          ? CellNumberWidget(
              vicinity: vicinity,
              maxLedLighting: widget.maxLedLighting,
            )
          : (vicinity.column == 1 || vicinity.row == 1)
              ? Center(
                  child: Text(
                    '${widget.maxLedLighting.cost[vicinity.row - 1][vicinity.column - 1]}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              : CellArrowWidget(
                  cost: widget.maxLedLighting.cost[vicinity.row - 1]
                      [vicinity.column - 1],
                  best: widget.maxLedLighting.best[vicinity.row - 1]
                      [vicinity.column - 1],
                ),
    );
  }

  bool isScrollHorizontal() {
    return tableSize > MediaQuery.of(context).size.width;
  }

  bool isScrollVirtical() {
    return tableSize > MediaQuery.of(context).size.height;
  }

  double getSizeSizedBox() =>
      (MediaQuery.of(context).size.width - tableSize) / 2;
}
