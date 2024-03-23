import 'package:flutter/material.dart';
import 'package:project_1/pages/result/widget/led_widget.dart';
import 'package:project_1/pages/result/widget/power_widget.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

class CustomArrowContainer extends StatelessWidget {
  final List<int> s2;
  final List<int> res;

  const CustomArrowContainer({Key? key, required this.s2, required this.res})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int indextRes1 = 0;
    int indextRes2 = 0;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: s2.length,
                itemBuilder: (BuildContext context, int index) {
                  String? targetId;
                  if (res[indextRes1] == index + 1) {
                    targetId = 'target ${index + 1}';
                    if (indextRes1 < res.length - 1) {
                      indextRes1++;
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: (targetId == null)
                          ? PowerWidget(
                              isOn: false,
                              number: index + 1,
                            )
                          : ArrowElement(
                              id: 'source ${index + 1}',
                              targetId: targetId,
                              arcDirection: ArcDirection.Auto,
                              targetAnchor: const Alignment(0.0, -0.63),
                              sourceAnchor: const Alignment(0.0, 0.63),
                              color: Colors.red,
                              stretch: 0,
                              width: 2.5,
                              tipLength: 2,
                              doubleSided: true,
                              bow: 0,
                              child: Ink(
                                child: PowerWidget(
                                  isOn: true,
                                  number: index + 1,
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: s2.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  String? targetId;
                  if (res[indextRes2] == s2[index]) {
                    targetId = 'target ${s2[index]}';
                    if (indextRes2 < res.length - 1) {
                      indextRes2++;
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: (targetId == null)
                          ? LedWidget(
                              isOn: false,
                              number: s2[index],
                            )
                          : ArrowElement(
                              id: 'target ${s2[index]}',
                              child: Ink(
                                child: LedWidget(
                                  isOn: true,
                                  number: s2[index],
                                ),
                              ),
                            ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
