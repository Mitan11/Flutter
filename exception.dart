// void main() {
//   // Example of exception handling in Dart
//   List<dynamic> l1 = ["ers", 11, 3.6, true];
//   // Accessing an invalid index to trigger an exception
//   try {
//     print(l1[6]); // Index out of range
//   } catch (e) {
//     print("Error occurred: $e");
//   }
// }

void main() {
  List<dynamic> l1 = ["ers", 11, 3.6, true];
  int a = 10, b = 0, res;

  try {
    // print(l1[6]);      // RangeError
    res = a ~/ b; // IntegerDivisionByZeroException
    print(res);
  } on RangeError {
    print("Range Error occurred");
  } on IntegerDivisionByZeroException {
    print("Cannot divide by zero");
  } catch (e) {
    print(e);
  }
}
