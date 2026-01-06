
// Custom Exception Class
class MyException implements Exception {

  // Custom error message
  String errMsg() => "Custom exception occurred!";
}

// Function that throws exception
void check(int val) {
  if (val < 0) {
    throw MyException();   // Throw custom exception
  }
}

// Main Function
void main() {
  try {
    check(-1);
  }
  catch (e) {
    if (e is MyException) {
      print(e.errMsg());
    }
  }
}
