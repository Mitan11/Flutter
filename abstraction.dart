// Abstraction in Dart
// Abstract Class: A class that cannot be instantiated directly.
// It can contain abstract methods (methods without implementation) that must be implemented by subclasses.
abstract class Shape {
  void area(); // Abstract method
}

class Circle extends Shape {
  // Constants & variables
  static const double PI = 3.14;
  final int r;

  // Constructor
  Circle(this.r);

  // Implement abstract method
  @override
  void area() {
    double result = PI * r * r;
    print(result.toStringAsFixed(2));
  }
}

void main(List<String> args) {
  // Shape s = Shape(); // ❌ Not allowed

  Circle c1 = Circle(3);
  c1.area();
}
