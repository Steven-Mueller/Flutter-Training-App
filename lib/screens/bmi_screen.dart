import 'package:flutter/material.dart';
import '../shared/menu_bottom.dart';
import '../shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  String heightMessage = '';
  String weightMessage = '';
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height; // ? means variable can be null
  double? weight;
  late List<bool> isSelected; // late means we are assigning the variables later

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ${isMetric ? 'meters' : 'inches'}';
    weightMessage =
        'Please insert your weight in ${isMetric ? 'kilos' : 'pounds'}';
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: MenuBottom(),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              isSelected: isSelected,
              onPressed: toggleMeasure,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child:
                        Text('Metric', style: TextStyle(fontSize: fontSize))),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child:
                        Text('Imperial', style: TextStyle(fontSize: fontSize))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage)),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMessage)),
            ),
            ElevatedButton(
                onPressed: findBMI,
                child: Text('Calculate BMI',
                    style: TextStyle(fontSize: fontSize))),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height =
        double.tryParse(txtHeight.text) ?? 0; // ?? checks if value is null
    double weight =
        double.tryParse(txtWeight.text) ?? 0; // ?? checks if value is null

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }
}
