/*
OOP Concepts:
1. Class
2. Object
3. Constructor
4. Methods
*/

class Person {
  // Data members (instance variables)
  // If a constructor initializes variables,
  // null (?) is NOT required.
  String name;
  int age;

  // If no constructor is used, then:
  // String? name;
  // int? age;

  //Method 1: Constructor
  // Person(name , age){
  //   this.name = name;
  //   this.age = age;
  // }

  //Method 2: Constructor (shorthand)
  Person(this.name, this.age);

  // Member function (method)
  display() {
    print("Name is $name and age is $age");
  }
}

void main() {
  // Object creation using 'new' keyword (optional in modern Dart) old way
  // Person p1 = new Person("Mitan" , 12);
  // Person p2 = new Person("Bob" , 22);

  // Object creation New keyword is optional in modern Dart
  Person p1 = Person("Mitan", 12);
  Person p2 = Person("Bob", 22);

  // Accessing data members
  print(p1.name);

  // Calling methods
  p1.display();
  p2.display();
}
