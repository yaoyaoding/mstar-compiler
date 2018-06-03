int N;
int head;
int startx;
int starty;
int targetx;
int targety;
int x;
int y;
int[] xlist = new int[12000];
int[] ylist = new int[12000];
int tail;
int ok;
int now;
int[][] step;
int i;
int j;

void origin(int N)
{
	step = new int[N][];
    for (i = 0; i < N; i ++ ) {
		step[i] = new int[N];
        for (j = 0; j < N; j ++ )
        step[i][j] = 0;
    }
}

bool check(int a, int N) {
    return ((a < N) && (a >= 0));
}

void addList(int x, int y) {
    if (check(x, N) && check(y, N) && step[x][y] == -1) {
        tail = tail + 1;
        xlist[tail] = x;
        ylist[tail] = y;
        step[x][y] = now + 1;
        if ((x == targetx) && (y == targety)) ok = 1;
    }
}

int main() {
	origin(106);
    N = getInt();
    targety  = N - 1;
    targetx = targety;
    for (i = 0; i < N; i ++)
        for (j = 0; j < N; j ++)
        step[i][j] = -1;
    while (head <= tail) {
        x = xlist[head];
        y = ylist[head];
        now = step[x][y];
        addList(x-1, y-2);
        addList(x-1, y+2);
        addList(x+1, y-2);
        addList(x+1, y+2);
        addList(x-2, y-1);
        addList(x-2, y+1);
        addList(x+2, y-1);
        addList(x+2, y+1);
        if (ok == 1) break;
        head = head + 1;
    }
    if (ok == 1) println(toString(step[targetx][targety]));
    else print("no solution!\n");
    return 0;
}



/*!! metadata:
=== comment ===
horse-5100309153-yanghuan.mx
=== input ===
101
=== assert ===
output
=== timeout ===
0.3
=== output ===
67
=== phase ===
codegen pretest
=== is_public ===
True

!!*/

