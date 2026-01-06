// Single Inheritance Example in Dart

// Parent class
class Animal {
  void eat() {
    print("Animal eats");
  }
}

// Child class
class Dog extends Animal {
  void bark() {
    print("Dog barks");
  }
}

void main() {
  Dog d = Dog();
  d.eat();
  d.bark();
}
