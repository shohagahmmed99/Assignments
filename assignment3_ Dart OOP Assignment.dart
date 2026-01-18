void main() {
  Driver d1 = Driver(name: "Rahim", age: 25, vehicle: "Bike");
  print(d1.getInfo());

  printFare(BikeRide(), 25.25);
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

  String  getInfo() {
    return "Name: $_name, Age: $_age";
  }
}

//2.Inheritance & Method Overriding

class Driver extends Person {
  final String vehicle;

  Driver({required super.name, required super.age, required this.vehicle});
  @override
  String  getInfo() {
    return "Name: $name, Age: $age, Vehicle: $vehicle";
  }
}

// 3.Abstraction & Polymorphism
abstract class Ride {
  double calculateFare(double distance);
}

class BikeRide implements Ride {
  @override
  double calculateFare(double distance) {
    return 30 * distance;
  }
}

void printFare(Ride ride, double distance) {
  print("Toal fare of this ride as 30 tk per km: ${ride.calculateFare(distance)}");
}
