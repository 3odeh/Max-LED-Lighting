import 'dart:io';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/pages/get_data/widget/size_text_field_widget.dart';
import 'package:project_1/pages/result/result_page.dart';
import 'package:project_1/util/colors.dart';
import 'package:project_1/util/text_style.dart';
import 'package:project_1/pages/get_data/widget/all_input_led_widget.dart';

class GetDataPage extends StatefulWidget {
  const GetDataPage({Key? key}) : super(key: key);

  @override
  GetDataPageState createState() => GetDataPageState();
}

class GetDataPageState extends State<GetDataPage> {
  final TextEditingController numberTF = TextEditingController();

  List<int>? data;
  List<bool>? added;
  bool putValues = false;
  bool showMyDialog = false;
  bool isLoading = true;
  List<SingleValueDropDownController>? controllers;
  String? errorInputMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Max LED Lighting",
          style: MyTextStyles.text_28L.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    "Please enter the number of power or upload the file",
                    style: MyTextStyles.text_22D.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Please enter the number of lights",
                              style: MyTextStyles.text_20D,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: SizeTextFieldWidget(
                                numberTF: numberTF,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor:
                                    MyColors.unselectedColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: (numberTF.text.isEmpty ||
                                      ((data != null &&
                                          numberTF.text ==
                                              data!.length.toString())))
                                  ? null
                                  : () {
                                      if (data != null) {
                                        showMyCustonDialog().then((value) {
                                          if (value!) {
                                            setState(() {
                                              int size =
                                                  int.parse(numberTF.text);
                                              makeNewLists(size: size);
                                            });
                                          }
                                        });
                                      } else {
                                        setState(() {
                                          int size = int.parse(numberTF.text);
                                          makeNewLists(size: size);
                                        });
                                      }
                                    },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Genarate",
                                  style: MyTextStyles.text_18L,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: VerticalDivider(
                        color: MyColors.primaryColor,
                        thickness: 1,
                        width: 0,
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(25.0),
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Please select the file",
                              style: MyTextStyles.text_20D,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor:
                                    MyColors.unselectedColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                if (data != null &&
                                    added!.any((element) => element)) {
                                  showMyCustonDialog().then((value) {
                                    if (value!) {
                                      readFile();
                                    }
                                  });
                                } else {
                                  readFile();
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Select file",
                                  style: MyTextStyles.text_18L,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Divider(
                    color: MyColors.primaryColor,
                    height: 0,
                    thickness: 1,
                  ),
                ),
                Column(
                  children: [
                    AllInputLedWidget(
                      data: data,
                      added: added,
                      checkValue: putValues,
                      onChange: (value, index) {
                        if (value is DropDownValueModel) {
                          setState(() {
                            int input = int.parse(value.name);
                            data![index] = input;
                            added![data![index] - 1] = true;
                          });
                        } else {
                          if ((data![index] - 1) < data!.length &&
                              (data![index] - 1) >= 0) {
                            setState(() {
                              added![data![index] - 1] = false;
                              data![index] = 0;
                              controllers![index].setDropDown(
                                  const DropDownValueModel(
                                      name: '', value: ''));
                            });
                          }
                        }
                      },
                      controllers: controllers,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: MyColors.unselectedColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: (controllers == null ||
                                  !added!.any((element) => element))
                              ? null
                              : () {
                                  showMyCustonDialog().then((value) {
                                    if (value!) {
                                      setState(() {
                                        resetAll();
                                      });
                                    }
                                  });
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  CupertinoIcons.trash,
                                  color: MyColors.lightColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Reset Numbers",
                                  style: MyTextStyles.text_18L,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: MyColors.unselectedColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ((data == null || data!.contains(0)))
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                        data: data!,
                                      ),
                                    ),
                                  );
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  CupertinoIcons.lightbulb,
                                  color: MyColors.lightColor,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Calculate Max",
                                  style: MyTextStyles.text_18L,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (showMyDialog)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: MyColors.loadingBackgroundColor,
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 6,
                  child: Card(
                    child: Center(
                      child: (isLoading)
                          ? CircularProgressIndicator(
                              color: MyColors.primaryColor,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  (errorInputMessage != null)
                                      ? Icons.error_rounded
                                      : Icons.check_circle,
                                  size: 70,
                                  color: ((errorInputMessage != null))
                                      ? MyColors.errorColor
                                      : MyColors.completeIconColor,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  errorInputMessage ?? "Read data complete",
                                  style: MyTextStyles.text_16D,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showMyDialog = false;
                                      isLoading = false;
                                      errorInputMessage = null;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    disabledBackgroundColor:
                                        MyColors.unselectedColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    (errorInputMessage != null)
                                        ? "Back"
                                        : "Next",
                                    style: MyTextStyles.text_18L,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void readFile() {
    setState(() {
      showMyDialog = true;
      isLoading = true;
    });
    FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    ).then((result) {
      if (result != null) {
        File file = File(result.files.single.path!);
        file.readAsLines().then((lines) {
          int size = 0;
          for (var line in lines) {
            String tmp = line.trim();
            if (line.isNotEmpty) {
              if (size == 0) {
                try {
                  int input = int.parse(tmp);
                  if (input < 1) {
                    setState(() {
                      errorInputMessage = 'The size cant be less than 1';
                      isLoading = false;
                    });
                    return;
                  } else {
                    size = input;
                  }
                } catch (e) {
                  setState(() {
                    errorInputMessage = 'The size must be number';
                    isLoading = false;
                  });

                  return;
                }
              } else {
                List<String> inputData = tmp.split(' ');
                setState(() {
                  isLoading = false;
                  makeInputLists(size: size, inputData: inputData);
                });
                return;
              }
            }
          }
          setState(() {
            makeNewLists(size: size);
            isLoading = false;
          });
        });
      } else {
        setState(() {
          errorInputMessage = "UnSelected file";
          isLoading = false;
        });
      }
    });
  }

  void resetAll() {
    for (var i = 0; i < data!.length; i++) {
      data![i] = 0;
      added![i] = false;
      controllers![i]
          .setDropDown(const DropDownValueModel(name: '', value: ''));
    }
    putValues = false;
  }

  void makeInputLists({
    required int size,
    required List<String> inputData,
  }) {
    makeNewLists(size: size);
    for (var i = 0; i < size; i++) {
      if (inputData.length > i) {
        String tmpString = inputData[i].trim();
        try {
          int tmpInt = int.parse(tmpString);
          if (isValid(value: tmpString, size: size)) {
            data![i] = tmpInt;
            controllers![i].setDropDown(DropDownValueModel(
                name: '${data![i]}', value: 'value${data![i]}'));
            added![data![i] - 1] = true;
          } else {
            controllers![i].setDropDown(
                DropDownValueModel(name: '$tmpInt', value: 'value$tmpInt'));
          }
        } catch (e) {
          controllers![i].setDropDown(
              DropDownValueModel(name: tmpString, value: 'value$tmpString'));
        }
      } else {
        controllers![i]
            .setDropDown(const DropDownValueModel(name: '', value: ''));
      }
    }
    putValues = true;
  }

  bool isValid({
    required String value,
    required int size,
  }) {
    try {
      if (value.isEmpty) {
        return false;
      }
      int num = int.parse(value);
      if (num > size || num < 1 || added![num - 1]) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  void makeNewLists({
    required int size,
  }) {
    data = [];
    added = [];
    controllers = [];
    for (var i = 0; i < size; i++) {
      data!.add(0);
      added!.add(false);
      controllers!.add(SingleValueDropDownController(
          data: const DropDownValueModel(name: '', value: '')));
    }
    putValues = false;
  }

  Future<bool?> showMyCustonDialog() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('the current data will clear!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Next'),
                ),
              ],
            ));
  }
}
