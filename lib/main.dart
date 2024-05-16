import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  BMICalculatorState createState() => BMICalculatorState();
}

class BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmihasil = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Masukkan Tinggi Badan (m)'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Masukkan Berat Badan (Kg)'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                hitungBMI();
              },
              child: Text('Hitung BMI'),
            ),
            SizedBox(height: 32),
            Text(
              'BMI: ${bmihasil.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              getBMIStatus(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void hitungBMI() {
    double tinggi = double.parse(heightController.text);
    double berat = double.parse(weightController.text);

    if (tinggi > 0 && berat > 0) {
      double bmi = berat / (tinggi * tinggi);

      setState(() {
        bmihasil = bmi;
      });
    } else {
      setState(() {
        bmihasil = 0.0;
      });
    }
  }

  String getBMIStatus() {
    if (bmihasil == 0.0) {
      return 'Masukkan Tinggi dan Berat yang Valid';
    } else if (bmihasil < 18.5) {
      return 'Underweight';
    } else if (bmihasil >= 18.5 && bmihasil < 24.9) {
      return 'Normal/Ideal';
    } else if (bmihasil >= 25 && bmihasil < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
