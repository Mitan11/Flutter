/**Develop a Dart program to simulate basic bank account
operations.
Create a BankAccount class that uses encapsulation to protect
account balance.
Implement the following methods:
● deposit() to add amount to the balance
● withdraw() to deduct amount (handle insufficient balance condition)
● checkBalance() to display the current balance
● Ensure the balance variable is declared as private. */

import 'dart:io';

class BankAccount {
  // encapsulated private balance variable
  double _balance = 0.0; // private variable

  // Method to check current balance
  void checkBalance() {
    print("Current Balance: ₹${_balance}");
  }

  // Method to deposit amount
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: ₹${amount}");
      checkBalance();
    } else {
      print("Deposit amount must be positive.");
    }
  }

  // Method to withdraw amount
  void withdraw(double amount) {
    if (amount > 0) {
      if (amount <= _balance) {
        _balance -= amount;
        print("Withdrawn: ₹${amount}");
        checkBalance();
      } else {
        print("Insufficient balance.");
      }
    } else {
      print("Withdrawal amount must be positive.");
    }
  }
}

void main() {
  BankAccount account = BankAccount();

  while (true) {
    print("Bank Account Operations:");
    print("1. Deposit");
    print("2. Withdraw");
    print("3. Check Balance");
    print("4. Exit");

    print("Enter your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print("Enter amount to deposit: ");
        double depositAmount = double.parse(stdin.readLineSync()!);
        account.deposit(depositAmount);
        break;
      case 2:
        print("Enter amount to withdraw: ");
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        account.withdraw(withdrawAmount);
        break;
      case 3:
        account.checkBalance();
        break;
      case 4:
        exit(0);
      default:
        print("Invalid choice.");
    }
  }
}
