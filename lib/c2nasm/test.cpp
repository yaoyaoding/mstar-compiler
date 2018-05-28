#include <stdlib.h>

int main() {
	int a = 1;
	int b = 2;
	int c = 3;
	int d = 4;
	int e = 5;
	int f = 6;
	int g = 7;
	int h = 8;
	int i = a + b;
	int j = i * c;
	int k = i + j + d + e + f + g + h;
	int *arr = (int*)malloc(k * sizeof(int));
}

