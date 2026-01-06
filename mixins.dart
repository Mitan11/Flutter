// using mixin we can achieve multiple inheritance
// Mixins

mixin Mixin1 {
  void fun1() {
    print("Mixin1 fun1 called");
  }
}

mixin Mixin2 {
  void fun2() {
    print("Mixin2 fun2 called");
  }
}

mixin Mixin3 {
  void fun3() {
    print("Mixin3 fun3 called");
  }
}

// Class using mixins
class Demo with Mixin1, Mixin2 {
  // Can use fun1() and fun2()
}

void main() {
  Demo d1 = Demo();
  d1.fun1();
  d1.fun2();
}
