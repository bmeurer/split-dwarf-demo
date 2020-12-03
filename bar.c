extern int foo(int);

int bar(int x, int y) {
  return foo(x) + foo(y);
}
