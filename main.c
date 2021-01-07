#include <stdio.h>

__attribute__((weak)) int global = 1;

extern int bar(int, int);

int main(int argc, char** argv) {
  argc = bar(argc, argc) + global;
  printf("bar = %d\n", argc);
  return 0;
}
