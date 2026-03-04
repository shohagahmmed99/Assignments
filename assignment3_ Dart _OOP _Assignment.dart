import 'dart:io';

void main() {
  print("Enter your name:");
  String name = stdin.readLineSync()!;
  print("Enter your age:");
  int age = int.parse(stdin.readLineSync()!);
  print("Enter your Vehice type:");
  String vehicle = stdin.readLineSync()!;
  Driver d1 = Driver(name: name, age: age, vehicle: vehicle);

  print(d1.getInfo());
  print("\n Enter the Distance do you tarvel:");
  double distance = double.parse(stdin.readLineSync()!);
  print("\n Enter the fare per kilometer:");
  double fare = double.parse(stdin.readLineSync()!);

  printFare(BikeRide(), distance, fare);
}

//1.Class & Encapsulation

class Person {
  final String _name;
  final int _age;

  Person({required String name, required int age}) : _name = name, _age = age;

  String get name {
    return _name;
  }

  int get age {
    return _age;
  }

  String getInfo() {
    return "Name: $_name, Age: $_age";
  }
}

//2.Inheritance & Method Overriding

class Driver extends Person {
  final String vehicle;

  Driver({required super.name, required super.age, required this.vehicle});
  @override
  String getInfo() {
    return "Total info of a  person: \n Name: $name, Age: $age, Vehicle: $vehicle";
  }
}

// 3.Abstraction & Polymorphism
abstract class Ride {
  double calculateFare(double distance, double fare_per_km);
}

class BikeRide implements Ride {
  @override
  double calculateFare(double distance, double fare_per_km) {
    return fare_per_km * distance;
  }
}

void printFare(Ride ride, double distance, double fare_per_km) {
  print("\n Total fare of this ride : ${ride.calculateFare(distance, fare_per_km).toStringAsFixed(2)}");
}
