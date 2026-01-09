/**Given Code -
void main() {
int day = 1;
switch (day) {
case 1:
print("Monday");
case 2:
print("Tuesday");
break;
}
}
Tasks -
● Predict output
● Explain Dart switch behavior
● Fix the logic
● Add functionality: handle all weekdays */

void main() {
  int day = 1;
  print("1.Monday");
  print("2.Tuesday");
  print("3.Wednesday");
  print("4.Thursday");
  print("5.Friday");
  print("6.Saturday");
  print("7.Sunday");
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day");
  }
}

/**
 * 1. Predict output
 *   The output will be:
 *    Monday
 *    Tuesday
 * 2. Explain Dart switch behavior
 * In Dart, the switch statement does not have implicit fall-through behavior like some other languages (e.g., C, Java). However, if there is no `break` statement at the end of a case, the execution will continue to the next case. In this example, since there is no `break` after case 1, it falls through to case 2 and prints both "Monday" and "Tuesday".
 * 3. Fix the logic
 *  To fix the logic, a `break` statement has been added after the print statement in case 1 to prevent fall-through.
 * 4. Add functionality: handle all weekdays
 *   The switch statement can be extended to include cases for all weekdays (1 to 7
 */
