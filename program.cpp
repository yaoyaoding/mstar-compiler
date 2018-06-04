int p(int n) {return n % (n - 1)% (n - 2) % (n - 3) % (n - 4) % (n - 5) % (n - 6) % (n - 7) % (n - 8) % (n - 9) % (n - 10) % (n - 11) % (n - 12) % (n - 13) % (n - 14) % (n - 15) % (n - 16) % (n - 17) % (n - 18) % (n - 19) % (n - 20);}

int main() {
    int i;
	for(i = 1; i <= 30000000; ++i) {//int 2int i;

		int tt = p(100);
		if(i % 3000000 == 0) println(toString(tt));
	}
    return 0;
}

/*!! metadata:
=== comment ===
林虹灏 Test for register allocate, inline ,common sub expression elimination and constant folding // 516030910579
=== is_public ===
True
=== assert ===
output
=== timeout ===
8.0
=== input ===
350
=== phase ===
optim extended
=== output ===
2929506
1
1
1
1
1
1
1
1
1
1
=== exitcode ===
0

!!*/

