#include "header.h"

int is_in(const char *str, const char *pattern) {
	int times = 0;
	int str_len = strlen(str);
	int pat_len = strlen(pattern);
	
	if ( str_len < pat_len )
		return 0;
	
	for (int i = 0; i < str_len - pat_len; i++) {
		if (memcmp(str+i, pattern, pat_len) == 0)
			times++;
	}
	return times;
}

int calc_new_length(const char *str, const char *subs, const char *new) {
	int times = is_in(str, subs);
 	return times? strlen(str) - strlen(subs) * times + strlen(new) * times : 0;
}

void substitute(const char *str, const char *subs, const char *new_subs, char *buffer) {
	int start = strstr(str, subs) - str;
	int sub_len = strlen(subs);
	int end = start + sub_len;
	int new_subs_len = strlen(new_subs)+1;
	
	memcpy(buffer, str, start);
	memcpy(buffer+start, new_subs, new_subs_len);
	strcat(buffer, str+end);
}
