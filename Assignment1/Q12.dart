/**4. Given Code -
class Person {
String name;
Person(this.name);
}
void main() {
Person p1 = Person("Amit");
Person p2 = Person("Amit");
print(p1 == p2);
}
Tasks-
● Predict output
● Explain why
● Override equality operator
● Add functionality: compare by name */

class Person {
  String name;
  Person(this.name);
}

void main() {
  Person p1 = Person("Amit");
  Person p2 = Person("Amit");
  print(p1 == p2);
  // Override equality operator
  bool areEqual = p1.name == p2.name;
  print(areEqual);

  // Add functionality: compare by name
  if (p1.name == p2.name) {
    print("Both persons have the same name.");
  } else {
    print("Persons have different names.");
  }
}

/**
 * 1. Predict output
 *   The output will be `false`.
 * 2. Explain why
 *  In Dart, the `==` operator checks for reference equality by default, meaning it checks whether both references point to the same object in memory. Since `p1` and `p2` are two different instances of the `Person` class, even though they have the same name, they are not the same object, hence the output is `false`.
 *
 */
