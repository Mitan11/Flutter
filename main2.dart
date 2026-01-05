import 'dart:io';
void main(List<String> args) {
  // ==================================================
  // 1 Taking Input from User
  // ==================================================

  print("Enter your name: ");
  String? name = stdin.readLineSync();
  print(name);


  // ==================================================
  // 3️⃣ String to int Conversion
  // ==================================================

  int num = int.parse(name!);   // ! assures non-null
  print(num);
  print(num.runtimeType);       // int

  // Type checking
  print(num is int);            // true
  print(num is! int);           // false


  // ==================================================
  // 4️⃣ Type Casting
  // ==================================================

  dynamic val = 'Hello';
  String str1 = val as String;  // Explicit cast
  print(str1);

// //let key word 
//   String ?a; // -> init null
//   late String str2;
//   str2 = "Hello";
//   print(str2);


  // ==================================================
  // 6️⃣ Functions
  // ==================================================

  print(add(12, 2));        // Normal function
  print(add1(12));          // Default argument
  print(sub(12, 2));        // Arrow function

  printHello('Hello', 'Hi');
  printHello1('Hello');

  // Named parameters
  add2(a: 10, b: 5);
  
  // ==================================================
  // 7️⃣ Anonymous Function (Lambda)
  // ==================================================

  var multiply = (int a, int b) {
    return a * b;
  };    
  
  print(multiply(5, 3));    // 15

}

// Normal function
int add(int num1, int num2) {
  return num1 + num2;
}

// Default parameter
int add1(int num1, [int num2 = 0]) {
  return num1 + num2;
}

// Function without type (dynamic parameters)
void printHello(str, str2) {
  print("$str $str2");
}

// Optional positional parameter
void printHello1(str, [String? str2]) {
  print("$str ${str2 ?? ''}");
}

// Arrow function
var sub = (int a, int b) => a - b;
// Optional positional parameter with arrow function
var sub1 = (int a ,[ int b=0])=>a-b;


// Named parameters (optional)
void add2({a, b}) {
  print(a + b);
} 

/*
// Recommended version (BEST PRACTICE)
void add2({required int a, required int b}) {
  print(a + b);
}
void add({required a, required b}) { 
  a & b are no longer optional
  print(a + b); 
}
*/
