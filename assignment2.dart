void main() {
  double bmi = BMICalculation(56, 1.6764);
  String finalBMI = bmi.toStringAsFixed(2);
  print("Your BMI is: $finalBMI");
  String category = getBMICategory(bmi);
  print("Category: $category");
}

double BMICalculation(double weight, double height) {
  double BMI = weight / (height * height);
  return BMI;
}

String getBMICategory(double bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    return "Normal";
  } else if (bmi >= 25 && bmi <= 29.9) {
    return "Overweight";
  } else
    return "Obese";
}