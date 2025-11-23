import 'package:flutter/material.dart';
import '../widgets/prediction_card.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _durationController = TextEditingController();
  final _heartrateController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();

  String? _predictionResult;
  bool _isLoading = false;

  void _predictCalories() async {
    setState(() {
      _isLoading = true;
      _predictionResult = null;
    });

    try {
      final duration = double.parse(_durationController.text);
      final heartrate = double.parse(_heartrateController.text);
      final age = double.parse(_ageController.text);
      final weight = double.parse(_weightController.text);

      final result = await ApiService.predictCalories({
        "Duration": duration,
        "HeartRate": heartrate,
        "Age": age,
        "Weight": weight,
      });

      setState(() {
        _predictionResult = "Predicted Calories: ${result.toStringAsFixed(2)}";
      });
    } catch (e) {
      setState(() {
        _predictionResult = "Error: Please enter valid numeric values.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _durationController.dispose();
    _heartrateController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calories Predictor"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Duration (minutes)"),
            ),
            TextField(
              controller: _heartrateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Heart Rate (bpm)"),
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Weight (kg)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _predictCalories,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Predict"),
            ),
            const SizedBox(height: 20),
            if (_predictionResult != null)
              PredictionCard(resultText: _predictionResult!),
          ],
        ),
      ),
    );
  }
}