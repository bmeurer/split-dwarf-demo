__attribute__((weak)) int global = 1;

int foo(int x) {
  return x + global;
}
