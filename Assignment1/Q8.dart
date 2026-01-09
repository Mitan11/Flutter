/**Create a Dart program to calculate salaries for different types of
employees.
● Define a base class Employee and derive two subclasses: PermanentEmployee ContractEmployee
● Override the calculateSalary() method in each subclass to compute salary according to the employee type. */

class Employee {
  double calculateSalary() {
    return 0.0;
  }
}

class PermanentEmployee extends Employee {
  double basicSalary;
  double hra; // House Rent Allowance
  double pf; // Provident Fund

  PermanentEmployee(this.basicSalary, this.hra, this.pf);

  @override
  double calculateSalary() {
    return basicSalary + hra - pf;
  }
}

class ContractEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;

  ContractEmployee(this.hourlyRate, this.hoursWorked);

  @override
  double calculateSalary() {
    return hourlyRate * hoursWorked;
  }
}

void main() {
  PermanentEmployee permEmp = PermanentEmployee(50000, 10000, 5000);
  ContractEmployee contractEmp = ContractEmployee(200, 160);

  print("Permanent Employee Salary: ₹${permEmp.calculateSalary()}");
  print("Contract Employee Salary: ₹${contractEmp.calculateSalary()}");
}
