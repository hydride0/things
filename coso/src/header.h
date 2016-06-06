#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <unistd.h>

char *random_line(FILE *file);
int is_in(const char *str, const char *pattern);
int calc_new_length(const char *str, const char *subs, const char *new);
void substitute(const char *str, const char *subs, const char *new_subs, char *buffer);
