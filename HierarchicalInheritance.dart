// Hierarchical Inheritance Example in Dart 

// Grandparent class
class Shape {
  void draw() {
    print("Drawing shape");
  }
}

// Child classes
class Circle extends Shape {
  void circle() {
    print("Circle");
  }
}

// Another child class
class Square extends Shape {
  void square() {
    print("Square");
  }
}

void main() {
  Circle c = Circle();
  Square s = Square();

  c.draw();
  s.draw();
}
