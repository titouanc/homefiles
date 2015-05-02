#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>

typedef int (*get_next_char)(void);

void urldecode(get_next_char next)
{
    char buf[3] = {0, 0, 0};
    int c;
    long int val;
    char *endptr;

    while ((c = next()) != EOF){
        if (c == '%'){
            if ((c = next()) == EOF){
                printf("%%");
                return;
            }
            buf[0] = c;

            if ((c = next()) == EOF){
                printf("%%%c", buf[0]);
                return;
            }
            buf[1] = c;

            val = strtol(buf, &endptr, 16);
            if (endptr != buf+2){
                printf("%%%c%c", buf[0], buf[1]);
            } else {
                printf("%c", (int) val);
            }
        } else {
            printf("%c", c);
        }
    }
}

int get_next_from_stdin(void)
{
    return fgetc(stdin);
}

static const char *str = NULL;
int get_next_from_string()
{
    int res = 0;
    assert(str != NULL);

    if (*str == '\0'){
        res = EOF;
    } else {
        res = *str;
        str++;
    }

    return res;
}

#define streq(s1,s2) (strcmp((s1),(s2)) == 0)

int main(int argc, const char **argv)
{
    int i;

    if (argc == 1){
        urldecode(get_next_from_stdin);
    } else if (streq(argv[1], "-h") || streq(argv[1], "--help")) {
        printf(
            "USAGE: %s [ string ... ]\n"
            "  Convert url encoded chars (like %%20 -> ' ')\n"
            "  If no argument supplied, convert from stdin\n",
            argv[0]
        );
    } else {
        for (i=1; i<argc; i++){
            str = argv[i];
            urldecode(get_next_from_string);
            printf(" ");
        }
        printf("\n");
    }

    return 0;
}
