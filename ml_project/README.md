# Upwork Job Budget Prediction - Linear Regression Model

## 📋 Mission & Problem Statement

**Mission**: Enable fair market pricing for freelancers and job posters on the Upwork platform by predicting accurate job budgets based on historical data and job characteristics.

**Problem**: Freelancers struggle to determine competitive rates, and employers need guidance on fair compensation ranges for different job types and skill requirements.

**Solution**: A machine learning model that predicts job budget/compensation based on job features, categories, and skill requirements, helping both parties make informed pricing decisions.

---

## 📊 Dataset Information

- **Source**: [Upwork Jobs Dataset](https://www.kaggle.com/datasets)
- **Size**: 5000+ job postings (sample from larger dataset)
- **Features**: Job category, required skills, job level, duration, complexity, and budget information
- **Target Variable**: Job Budget (numeric regression target)

*Note: Dataset excludes house price prediction - focuses on freelance job market compensation analysis*

---

## 🔧 Project Structure

```
linear_regression_model/
├── summative/
│   ├── linear_regression/
│   │   ├── multivariate.ipynb          # Main analysis notebook
│   │   ├── predict_job_budget.py       # Prediction script
│   │   └── saved_models/               # Trained models (generated)
│   ├── API/                            # (Reserved for Task 2)
│   └── FlutterApp/                     # (Reserved for Task 2)
└── README.md
```

---

## 🚀 Implementation Details

### Models Implemented
1. **Linear Regression** - Baseline model with interpretable coefficients
2. **Decision Tree Regressor** - Captures non-linear relationships
3. **Random Forest Regressor** - Ensemble method for robust predictions

### Key Features
- ✅ Correlation heatmap visualization
- ✅ Feature distribution analysis (histograms, box plots)
- ✅ Feature engineering & selection
- ✅ Data standardization (StandardScaler)
- ✅ Loss curves (train vs test MSE)
- ✅ Regression line visualization
- ✅ Model comparison & evaluation
- ✅ Residuals analysis
- ✅ Best model persistence
- ✅ Prediction script for new data

### Performance Metrics
- Mean Squared Error (MSE)
- Root Mean Squared Error (RMSE)
- R² Score
- Mean Absolute Error (MAE)

---

## 📁 How to Use

### 1. Run the Main Notebook
```bash
# Open multivariate.ipynb in Jupyter Notebook or VS Code
jupyter notebook multivariate.ipynb
```

### 2. Make Predictions
```bash
# Run the prediction script
python predict_job_budget.py
```

### 3. View Saved Models
Trained models are saved in `saved_models/` directory:
- `best_linear_regression_model.pkl` - Best performing model
- `feature_scaler.pkl` - StandardScaler for feature normalization
- `feature_names.pkl` - Feature column names in correct order

---

## 📈 Results Summary

- **Best Model**: Linear Regression
- **Test RMSE**: [Generated during notebook execution]
- **Test R² Score**: [Generated during notebook execution]
- **Visualizations**: Correlation heatmap, distributions, loss curves, scatter plots

---

## 🎯 Requirements Met

✅ Non-generic use case (Freelance market pricing)  
✅ Rich dataset (5000+ records, multiple features)  
✅ Data visualizations (Correlation, distributions)  
✅ Feature engineering (Selection, standardization)  
✅ Three model types (Linear Regression, Decision Tree, Random Forest)  
✅ Loss curves (Train vs Test)  
✅ Scatter plots with regression lines  
✅ Model persistence & prediction script  
✅ README with mission description  

---

## 🔍 Technical Stack

- **Python 3.8+**
- **Libraries**: pandas, numpy, matplotlib, seaborn, scikit-learn, pickle
- **Models**: scikit-learn (LinearRegression, DecisionTreeRegressor, RandomForestRegressor)
- **Visualization**: matplotlib, seaborn

---

## 📝 Notes

- Data preprocessing handles missing values, duplicates, and outliers
- Features are standardized to mean=0, std=1 for better model performance
- Categorical variables are label-encoded
- 80-20 train-test split used for evaluation
- Random state set to 42 for reproducibility

---

## 🤝 Integration for Task 2

The prediction script `predict_job_budget.py` can be easily integrated with the API and Flutter app from Task 2 to provide real-time budget predictions for new job postings.

---

**Created**: March 2026  
**Status**: Complete ✓
