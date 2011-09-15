#include<iostream>

using namespace std;

void reverse(char* str)
{
    char *low = str,  *high = str;
    while (*high != '\0') {
        high++;
    }
    high--;
    while (low < high){
        char tmp = *low;
        *low++ = *high;
        *high-- = tmp;
    }
}

int main() {
    char s[] = "hello";
    reverse(s);
    cout << s;
    return 0;
}
