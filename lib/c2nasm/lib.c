#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef long int64_t;
typedef char* pointer_t;

/*
	library_print;
	library_println;
	library_getString;
	library_getInt;
	library_toString;
	library_string_length;
	library_string_substring;
	library_string_parseInt;
	library_string_ord;
	library_stringConcate;
	library_stringCompare
*/

extern int __init();

int main() {
    return __init();
}

#define Mod 107
#define N 210

int64_t __real_addr[Mod] = {0};
int64_t __has[Mod][N] = {0};
int64_t __value[Mod][N] = {0};

int64_t __hasValue(int64_t addr, int64_t n) {
    int64_t key = addr % Mod;
  //  printf("hasValue(%ld, %ld) ", addr, n);
    if(__real_addr[key] == addr && 0 <= n && n < N) {
 //       printf("YES\n");
        return __has[key][n];
    }
//    printf("NO\n");
    return 0;
}

int64_t __getValue(int64_t addr, int64_t n) {
    return __value[addr % Mod][n];
}

int64_t __setValue(int64_t addr, int64_t n, int64_t val) {
    if(n < 0 || n >= N) return;
    int64_t key = addr % Mod;
    if(__real_addr[key] != addr) {
        if(__real_addr[key] == 0)
            __real_addr[key] = addr;
        else {
			int i;
            for(i = 0; i < N; i++)
                __has[key][i] = 0;
        }
    }
    __has[key][n] = 1;
    __value[key][n] = val;
    return val;
}

void __print(pointer_t str) {
	printf("%s", str + 8);
}
void __println(pointer_t str) {
	puts(str + 8);
}
pointer_t  __getString() {
	static char __buffer[1024 * 1024];	//	1MB buffer
	scanf("%s", __buffer);
	int length = strlen(__buffer);
	pointer_t ret = malloc(length + 8);
	*((int64_t*)ret) = length;
	strcpy(ret + 8, __buffer);
	return ret;
}
int64_t __getInt() {
	int64_t ret;
	scanf("%ld", &ret);
	return ret;
}
pointer_t __toString(int64_t a) {
	pointer_t ret = malloc(8 + 24);
	*((int64_t*)ret) = sprintf(ret + 8, "%ld", a);
	return ret;
}
int64_t __string_length(pointer_t ptr) {
	return *((int64_t*)ptr);
}
pointer_t __string_substring(pointer_t ptr, int left, int right) {
	int length = right - left + 1;
	pointer_t ret = malloc(8 + length + 1);
	*((int64_t*)ret) = length;
	int i;
	for(i = 0; i < length; i++) 
		ret[8 + i] = ptr[8 + left + i];
	ret[8 + length] = 0;
	return ret;
}

int64_t __string_parseInt(pointer_t ptr) {
	int64_t value = 0;
	int neg = 0;
	ptr += 8;
	if(*ptr == '-') {
		neg = 1;
		ptr++;
	}
	while('0' <= *ptr && *ptr <= '9') {
		value = value * 10 + (*ptr - '0');
		ptr++;
	}
	return neg ? -value : value;
}

int64_t __string_ord(pointer_t ptr, int64_t pos) {
	return ptr[8 + pos];
}

pointer_t __stringConcate(pointer_t sa, pointer_t sb) {
	int64_t la = *((int64_t*)sa);
	int64_t lb = *((int64_t*)sb);
	pointer_t ret = malloc(la + lb + 1 + 8);
	*((int64_t*)ret) = la + lb;
	int i;
	for(i = 0; i < la; i++)
		ret[8 + i] = sa[8 + i];
	for(i = 0; i < lb; i++)
		ret[8 + la + i] = sb[8 + i];
	ret[8 + la + lb] = '\0';
	return ret;
}

int64_t __stringCompare(pointer_t sa, pointer_t sb) {
	return strcmp(sa+8, sb+8);
}

