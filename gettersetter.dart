class Person {
  // Private Data Member
  String _name; // private variable
  int age;

  // Constructor
  Person(this._name, this.age);

  // Getter
  String get name => this._name;

  // Setter
  set name(val) {
    this._name = val;
  }

  // Member function
  display() {
    print("Name is ${_name} and age is ${age}");
  }
}

void main() {
  // Object creation ('new' is optional)
  Person p1 = Person("Mitan", 12);

  // Using getter
  print(p1.name);

  // Calling method
  p1.display();

  // Using setter
  p1.name = "Lucky";
  p1.display();
}
