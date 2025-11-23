# API/prediction.py

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from fastapi.middleware.cors import CORSMiddleware
import pandas as pd
import pickle
import os

# -----------------------------
# Paths for model & scaler
# -----------------------------
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
MODEL_PATH = os.path.join(BASE_DIR, "../linear_regression/best_model.pkl")
SCALER_PATH = os.path.join(BASE_DIR, "../linear_regression/scaler.pkl")

# Load model and scaler
with open(MODEL_PATH, "rb") as f:
    model = pickle.load(f)

with open(SCALER_PATH, "rb") as f:
    scaler = pickle.load(f)

# -----------------------------
# Initialize FastAPI
# -----------------------------
app = FastAPI(title="Calories Prediction API")

# Enable CORS (allow access from Flutter or any frontend)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # allow all origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# -----------------------------
# Input data model
# -----------------------------
class InputData(BaseModel):
    Duration: float = Field(..., gt=0, description="Duration of exercise in minutes")
    HeartRate: float = Field(..., gt=0, description="Average heart rate")
    Age: float = Field(..., ge=0, le=120, description="Age of the person")
    Weight: float = Field(..., gt=0, description="Weight in kg")

# -----------------------------
# Prediction endpoint
# -----------------------------
@app.post("/predict")
def predict(data: InputData):
    try:
        # Convert input to DataFrame
        df = pd.DataFrame([data.dict()])
        # Scale features
        df_scaled = scaler.transform(df)
        # Predict calories
        prediction = model.predict(df_scaled)
        # Return as JSON
        return {"predicted_calories": float(prediction[0])}
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))