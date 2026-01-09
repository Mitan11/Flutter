/**Write a program to calculate squares of even numbers between a
given range (like 1 to 30) */

import 'dart:io';

void main() {
  print("Enter the range (start and end):");
  int start = int.parse(stdin.readLineSync()!);
  int end = int.parse(stdin.readLineSync()!);

  for (int i = start; i < end; i++) {
    if (i % 2 == 0) {
      print("${i * i}");
    }
  }
}

/** Output:
Enter the range (start and end):
1
5
4
16
*/