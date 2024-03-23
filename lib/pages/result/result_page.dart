import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/other/max_led_lighting_calculator.dart';
import 'package:project_1/models/max_led_lighting_model.dart';
import 'package:project_1/pages/dp_table/dp_table_page.dart';
import 'package:project_1/util/colors.dart';
import 'package:project_1/util/text_style.dart';
import 'package:project_1/pages/result/widget/custom_arrow_container.dart';
import 'package:widget_arrows/widget_arrows.dart';

class ResultPage extends StatefulWidget {
  final List<int> data;
  const ResultPage({Key? key, required this.data}) : super(key: key);

  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: MyTextStyles.text_28L.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<MaxLedLightingModel>(
        future: MaxLedLightingCalculator.maxLedLightingCalculate(widget.data),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyColors.primaryColor,
              ),
            );
          } else {
            MaxLedLightingModel maxLedModel = snapshot.data!;
            return ArrowContainer(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          child: Card(
                            color: MyColors.primaryColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "The maximum number of LEDs are lighted : ${maxLedModel.result.length}",
                                    style: MyTextStyles.text_18L,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "The numbers of LEDs that lighted : ${maxLedModel.result.map((e) => e)}",
                                    style: MyTextStyles.text_18L,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.table,
                                color: MyColors.lightColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "DP Table",
                                style: MyTextStyles.text_18L,
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DPTablePage(
                                maxLedLighting: maxLedModel,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    CustomArrowContainer(
                      s2: maxLedModel.numbers,
                      res: maxLedModel.result,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
