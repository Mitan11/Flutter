/**Write a program to check if a number is a prime number.*/

is_prime(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i < number; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int number = 4;
  if (is_prime(number)) {
    print("$number is a prime number.");
  } else {
    print("$number is not a prime number.");
  }
}

/** output : 4 is not a prime number. */