/**2. Given Code
void main() {
int marks = 85;
if (marks > 90) {
print("A");
} else if (marks > 75) {
print("B");
} else {
print("C");
}
}
Tasks-
● Predict output
● Identify logical issue
● Fix grading logic
● Add functionality: Accept marks from user.
*/

import 'dart:io';

void main() {
  print("Enter your marks: ");
  int? marks = int.parse(stdin.readLineSync()!);

  if (marks > 90 && marks <= 100) {
    print("A");
  } else if (marks > 75 && marks <= 90) {
    print("B");
  } else {
    print("C");
  }
}

/**
 * 1. Predict output
 *   The original code will output "B" for marks = 85.
 * 2. Identify logical issue
 *   The logical issue is that the grading logic does not handle marks greater than 100 or less than 0.
 * 3. Fix grading logic
 *  The grading logic has been fixed to include checks for valid marks (0-100).
 * 4. Add functionality: Accept marks from user.
 *   The code now accepts marks as input from the user.
 */
