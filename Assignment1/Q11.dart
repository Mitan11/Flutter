/**3. Given Code -
class Product {
String name;
double price;
Product(this.name, this.price);
}
void main() {
Product p = Product("Laptop", -50000);
print(p.price);
}
Tasks -
● Is this logically correct?
● Add validation using exception handling
● Add functionality: Apply 10% discount if price > 30000 */

class Product {
  String? name;
  double? price = 0.0;

  Product(name, price) {
    if (price < 0) {
      throw Exception("Price cannot be negative");
    }
    this.name = name;
    this.price = price;
  }

  // Apply 10% discount if price > 30000
  void applyDiscount() {
    if (price! > 30000) {
      price = price! * 0.9;
    }
  }
}

void main() {
  try {
    Product p = Product("Laptop", 40000);
    p.applyDiscount();
    print(p.price);
  } catch (e) {
    print(e);
  }
}

/**
 * 1. Is this logically correct?
 *   The original code is not logically correct because it allows the creation of a Product with a negative price.
 * 2. Add validation using exception handling 
 *  The constructor has been modified to throw an exception if the price is negative.
 * 3. Add functionality: Apply 10% discount if price > 30000
 *   A method `applyDiscount` has been added to the Product class to apply a 10% discount if the price is greater than 30000.
 * */