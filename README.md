# linear_regression_model
Mobile App Regression Analysis
Here’s a **ready-to-use README.md** for your project based on the requirements:

---

````markdown
# Calories Prediction Mobile App

## Mission & Problem
This project predicts calories burned during exercise using a trained machine learning model.  
The goal is to provide quick, accurate estimates of calories based on user inputs like duration, heart rate, age, and weight.  
It addresses the need for personalized fitness tracking beyond generic approximations.  
The model uses Random Forest, Linear Regression, and Decision Tree algorithms for performance comparison.

## API Endpoint
The API is publicly available and can be tested using Swagger UI:  
**POST /predict** → `https://YOUR_RENDER_URL/predict`  
Input JSON example:
```json
{
  "Duration": 10,
  "HeartRate": 120,
  "Age": 25,
  "Weight": 70
}
````

Output example:

```json
{
  "predicted_calories": 250.5
}
```

## Video Demo

Watch a 5-minute demo showing the Flutter app, API, and model predictions:


## Running the Mobile App

1. Clone the repository:

```bash
git clone https://github.com/ulrichr7/linear_regression_model.git
```
2. Navigate to the Flutter app folder:

```bash
cd linear_regression/ml_project/flutter_app
```

3. Get Flutter dependencies:

```bash
flutter pub get
```

4. Run the app on Chrome (or another device):

```bash
flutter run -d chrome
```
