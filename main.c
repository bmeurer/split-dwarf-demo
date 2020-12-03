#include <stdio.h>

extern int bar(int, int);

int main(int argc, char** argv) {
  argc = bar(argc, argc);
  printf("bar = %d\n", argc);
  return 0;
}
