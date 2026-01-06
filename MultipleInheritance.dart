// Multiple Inheritance Example in Dart
// Using interfaces to achieve multiple inheritance 

// // Interface 1
// class A {
//   void funA() {}
// }

// // Interface 2
// class B {
//   void funB() {}
// }

// // Class implementing multiple interfaces
// class C implements A, B {
//   @override
//   void funA() {
//     print("funA");
//   }

//   @override
//   void funB() {
//     print("funB");
//   }
// }

// void main() {
//   C obj = C();
//   obj.funA();
//   obj.funB();
// }


// Using mixins to achieve multiple inheritance

// Mixins
mixin Fly {
  void fly() => print("Flying");
}

// Another mixin
mixin Swim {
  void swim() => print("Swimming");
}

// Class using mixins
class Bird with Fly, Swim {}

void main() {
  Bird b = Bird();
  b.fly();
  b.swim();
}
