// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String promptedString = "";
  double? bmiIndex;
  String bmiClass = "";
  bool _isCalculated = false; // Flag to control visibility


  TextEditingController _controllerWeight = TextEditingController();
  TextEditingController _controllerHeight = TextEditingController();

  void calculateBMI() {
    double weight = double.parse(_controllerWeight.text);
    double height = double.parse(_controllerHeight.text);

    setState(() {
      bmiIndex = weight / (height / 100) / (height / 100);
      if (bmiIndex != null) {
        if (bmiIndex! < 18.5) {
          bmiClass = "Underweight";
        } else if (bmiIndex! >= 18.5 && bmiIndex! < 24.9) {
          bmiClass = "Normal Weight";
        } else if (bmiIndex! >= 25 && bmiIndex! < 29.9) {
          bmiClass = "Overweight";
        } else if (bmiIndex! > 30) {
          bmiClass = "Obesity";
        }
      }
      _isCalculated = true; // Set flag to true to show the text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controllerHeight,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "Enter Your Height in cm",
                icon: Icon(Icons.height_outlined)),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
              controller: _controllerWeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter Your Weight in kg",
                  icon: Icon(Icons.person_3))),
          SizedBox(
            height: 40,
          ),
          if(_isCalculated)
          Text(
            "Your BMI index: ${bmiIndex?.toStringAsFixed(2)}\nBMI class:$bmiClass",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: calculateBMI,
              child: Text("Calculate"),
              style: ElevatedButton.styleFrom(shape: CircleBorder(), padding: EdgeInsets.all(25)))
        ],
      ),
    );
  }
}
