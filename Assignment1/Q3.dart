/**Write a program that accepts a sentence and calculate the number of letters and digits.
Suppose the following input is supplied to the 
program: hello world! 123 Then, the output should be: LETTERS 10 DIGITS 3*/

import 'dart:io';

void main() {
  print("Enter a sentence:");
  String input = stdin.readLineSync()!;

  int letters = 0;
  int digits = 0;

  for (int i = 0; i < input.length; i++) {
    int code = input.codeUnitAt(i);

    // A–Z or a–z
    if ((code >= 65 && code <= 90) || (code >= 97 && code <= 122)) {
      letters++;
    }
    // 0–9
    else if (code >= 48 && code <= 57) {
      digits++;
    }
  }

  print("LETTERS $letters");
  print("DIGITS $digits");
}

/**Output : 
Enter a sentence:
hello world! 123
LETTERS 10
DIGITS 3
 */