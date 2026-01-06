// Multilevel Inheritance Example in Dart

// Grandparent class
class Animal {
  void eat() {
    print("Eating");
  }
}

// Parent class
class Mammal extends Animal {
  void breathe() {
    print("Breathing");
  }
}

// Child class
class Dog extends Mammal {
  void bark() {
    print("Barking");
  }
}

// Main function
void main() {
  Dog d = Dog();
  d.eat();
  d.breathe();
  d.bark();
}
