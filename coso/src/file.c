#include "header.h"
#define LINE_LEN 200

char *random_line(FILE *file) {
	char buffer[LINE_LEN];
	int lines = 1;
	char *random = malloc(sizeof(char) * LINE_LEN);
	
	fgets(buffer, LINE_LEN, file);
	int max_len = strlen(buffer)+1;
	
	while(fgets(buffer, LINE_LEN, file) != NULL) {
		if (max_len < strlen(buffer)+1 )
			max_len = strlen(buffer)+1;
		lines++;
	}
	srand(time(NULL));
	int ran_line = rand() % lines;	
	rewind(file);
	
	for (int i = 0; i <= ran_line; i++)
		fgets(random, LINE_LEN, file);

	fclose(file);
	strtok(random, "\n");
	return random;
}
