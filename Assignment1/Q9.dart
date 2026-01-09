/**Given Code
class Student {
int id;
String name;
Student(int id, String name) {
id = id;
name = name;
}
}
void main() {
Student s = Student(1, "Rahul");
print(s.name);
}
Tasks -
● Does the code produce output or error?
● If error → identify and rectify it
● Add functionality to:
○ Display both id and name
○ Add a method display() */

class Student {
  int? id;
  String? name;

  Student(int id, String name) {
    this.id = id;
    this.name = name;
  }

  void display() {
    print("ID: $id, Name: $name");
  }
}

void main() {
  Student s = Student(1, "Rahul");
  print(s.name);
  s.display();
}

/**
 * 1. Does the code produce output or error?
 *   The original code produces an error because the constructor parameters `id` and `name` are shadowing the instance variables. As a result, the instance variables are not being initialized properly.
 * 
 * 2. If error → identify and rectify it
 *  The error can be rectified by using `this` keyword to refer to the instance variables inside the constructor.
 * 
 * 3. Add functionality to:
 *   - Display both id and name
 *   - Add a method display()
 */