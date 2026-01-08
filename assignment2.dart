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

/*
 Part A: BMI Calculation Function (40 Marks)

Create a function named calculateBMI that:

Takes two parameters:

weight (double, in kg)

height (double, in meters)

Calculates BMI using the formula:

BMI = weight / (height × height)

Returns the BMI value as double
*/
/* 
Create another function named getBMICategory that:

Takes BMI value as parameter

Returns BMI category as String

BMI Range Category

Less than 18.5 Underweight

18.5 – 24.9 Normal

25 – 29.9 Overweight

30 or more Obese
*/
/* 
In the main() function:

Call both functions

Print BMI value (up to 2 decimal places)

Print BMI category
*/
