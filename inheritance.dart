// inheritance in dart
// Single Inheritance	✅ Yes
// Multilevel Inheritance	✅ Yes
// Multiple Inheritance	❌ No (Use mixins)
// Multiple via Interface	✅ Using implements
// Hierarchical Inheritance	✅ Yes

// parent class
class Person {
  // Private data member
  String _name;
  int age;

  // Parent constructor
  Person(this._name, this.age);

  // Getter
  String get name => _name;

  // Setter
  set name(String val) {
    _name = val;
  }

  // Method
  void display() {
    print("Name: $_name, Age: $age");
  }
}

// Child class
// Employee inherits from Person
class Employee extends Person {
  int eId;

  // --------------------------------
  // 1️⃣ Child constructor calling parent
  // --------------------------------
  Employee(this.eId, String name, int age) : super(name, age);

  // --------------------------------
  // 2️⃣ Child constructor with fixed parent values
  // --------------------------------
  // Employee(this.eId) : super("XYZ", 1);

  /*
    creating child constructor and
    calling parent class constructor
    
    Employee(this.eId) : super("Hello" , 11){
    print("You are inside Child constructor!!");
  }
  */

  // --------------------------------
  // Method Overriding
  // --------------------------------
  @override
  void display() {
    print("Employee ID: $eId");
    super.display(); // call parent method
  }
}

void main(List<String> args) {
  // Creating Employee object
  Employee emp1 = Employee(101, "Mitan", 21);
  emp1.display();

  print("-----");

  // ==============================
  // Polymorphism method overriding is also a example of runtime polymorphism
  // ==============================
  Person p = Employee(102, "Lucky", 25);
  p.display(); // Calls overridden method
}
