void main() {
  print("Hello World");

  // ==================================================
  // 1️⃣ Variables & Data Types
  // ==================================================

  // Explicit type
  int a = 10;

  // 🔹 var → Type is inferred at compile time
  var b = 10; // b is int
  // b = "Hello";   // ❌ Not allowed
  b = 100; // ✅ Allowed

  // 🔹 dynamic → Type decided at runtime
  dynamic c = 10;
  c = "Hello"; // ✅ Allowed
  print(c);
  print(c.runtimeType);

  // ==================================================
  // 2️⃣ Null Safety
  // ==================================================

  // ❌ Null not allowed without ?
  // String s1 = null;

  // ✅ Nullable variable
  //   Main Null-Aware Operators:
  // ? → Nullable type
  // ?? → Null-coalescing operator
  // ?. → Null-aware access
  // ! → Null-assertion operator
  // 1️⃣ Nullable variable using ?
  String? name; // can be null
  print(name); // prints: null

  // 2️⃣ ?? (null-coalescing operator)
  // If name is null, "Guest" will be used
  print("Welcome ${name ?? "Guest"}");

  // 3️⃣ ?. (null-aware access)
  // Safely access length, returns null if name is null
  print("Length of name: ${name?.length}");

  // Assign value later
  name = "Mitan";

  // ?? now returns actual value
  print("Welcome ${name ?? "Guest"}");

  // ?. safely accesses length
  print("Length of name: ${name.length}");

  // 4️⃣ ! (null-assertion operator)
  // We are sure name is NOT null here
  print("Length using ! : ${name.length}");

  // type checking using is & is!

  dynamic value = "Hello Dart";

  // is → checks if value is String
  print(value is String); // true

  // is! → checks if value is NOT int
  print(value is! int); // true

  // Using is with condition
  if (value is String) {
    print("Length of string: ${value.length}");
  }

  // as → type casting
  dynamic str = "hello";
  String txt = str as String;
  print(txt.runtimeType);

  // ==================================================
  // 3️⃣ final & const
  // ==================================================

  // 🔹 const → Compile-time constant
  const double PI = 3.14;
  // PI = 3.12;     // ❌ Not allowed

  // 🔹 final → Runtime constant
  final int x = 13;
  // x = 14;        // ❌ Not allowed

  // ==================================================
  // 4️⃣ const vs final with List
  // ==================================================

  // ❌ const List → Cannot be modified
  const List<int> list1 = [4, 5];
  // list1.add(6);  // ❌ Error

  // ✅ final List → Can modify elements
  final List<int> list2 = [4, 5];
  list2.add(6);
  print(list2);

  // ==================================================
  // 5️⃣ late keyword
  // ==================================================

  // late → initialized later but non-null
  late String msg;
  msg = "Hello Dart";
  print(msg);

  // ==================================================
  // 6️⃣ List in Dart
  // ==================================================

  List<int> lst = [1, 2, 3, 4, 5, 6];

  // Access elements
  print(lst[2]); // 3

  // Loop (index-based)
  for (var i = 0; i < lst.length; i++) {
    print(lst[i]);
  }

  // Loop (for-in)
  for (var item in lst) {
    print(item);
  }

  // ==================================================
  // 7️⃣ List Operations
  // ==================================================

  lst.add(7); // Add one element
  lst.addAll([8, 9, 10]); // Add multiple

  lst.remove(6); // Remove by value
  lst.removeAt(2); // Remove by index
  lst.removeLast(); // Remove last

  lst.insert(2, 99); // Insert at index
  lst.insertAll(1, [23, 12]); // Insert multiple

  print(lst.first); // First element
  print(lst.last); // Last element
  print(lst.isEmpty); // Check empty
  print(lst.contains(3)); // Check value

  // Reverse list
  print(lst.reversed.toList());

  // Sorting
  lst.sort(); // Ascending
  lst.sort((a, b) => a.compareTo(b)); // Ascending
  lst.sort((a, b) => b.compareTo(a)); // Descending

  print(lst);
}
