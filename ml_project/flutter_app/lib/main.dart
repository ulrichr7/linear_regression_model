import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PredictionScreen(),
    );
  }
}

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final durationController = TextEditingController();
  final heartRateController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();

  String result = "";

  // CHANGE THIS to your local IP or online URL
  final String apiUrl = "http://192.168.1.5:8000/predict"; 
  // OR for deployed API: https://your-api-name.onrender.com/predict

  Future<void> predictCalories() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "Duration": double.parse(durationController.text),
          "HeartRate": double.parse(heartRateController.text),
          "Age": double.parse(ageController.text),
          "Weight": double.parse(weightController.text),
        }),
      );

      if (response.statusCode == 200) {
        setState(() {
          // FIX: parse correct key from API response
          result =
              "Predicted Calories: ${jsonDecode(response.body)["predicted_calories"].toStringAsFixed(2)}";
        });
      } else {
        setState(() {
          result = "Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calorie Prediction")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Duration (mins)"),
            ),
            TextField(
              controller: heartRateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Heart Rate"),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Age"),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Weight"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: predictCalories,
              child: Text("Predict"),
            ),
            SizedBox(height: 20),
            Text(result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}