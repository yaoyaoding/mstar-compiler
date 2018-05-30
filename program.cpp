int a;
int b;
int c;
int s = 0;

void ua() {
    a = 3;
    s = s + a;
}
void ub() {
    b = 3;
    s = s + b;
}
void uc() {
    c = 3;
    s = s + c;
}
int main() {
    a = 0;
    b = 1;
    c = 2;
    ua();
    ub();
    uc();
}
