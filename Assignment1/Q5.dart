/**Write a Dart program to accept age input from the user.
If the entered age is less than 18, throw a custom exception.
Properly handle both FormatException (invalid input) and the
custom exception using try-catch. */

import 'dart:io';

void main() {
  try {
    int age;
    print("Enter your age:");
    age = int.parse(stdin.readLineSync()!);

    if (age < 18) {
      throw AgeException('Age is less than 18');
    } else {
      print("You are eligible.");
    }
  } on FormatException {
    print("Invalid input! Please enter a valid number.");
  } on AgeException catch (e) {
    print(e);
  }
}

class AgeException implements Exception {
  String message;

  AgeException(this.message);

  @override
  String toString() {
    return "AgeException: $message";
  }
}

/**
 * Output 1:
Enter your age:
17
AgeException: Age is less than 18

Output 2:
Enter your age:
abc
Invalid input! Please enter a valid number.
 */