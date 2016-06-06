#include "header.h"
#define FRASI "misc/frasi.txt"
#define AGGETTIVI "misc/aggettivi.txt"
#define SOGGETTI "misc/soggetti.txt"

int main() { 
	FILE *file_frasi = fopen(FRASI, "r");
	FILE *file_sog = fopen(SOGGETTI, "r");
	FILE *file_agg = fopen(AGGETTIVI, "r");
	char *frase_random = random_line(file_frasi);
	char *sog_random = random_line(file_sog);
	char *agg_random = random_line(file_agg);
	char buffer[ calc_new_length(frase_random, "SOG", sog_random) ];
	char buffer_def[ calc_new_length(frase_random, "AGG", agg_random) ];
	
	substitute(frase_random, "SOG", sog_random, buffer);
	substitute(buffer, "AGG", agg_random, buffer_def);
	
	if (islower(buffer_def[0]))
		buffer_def[0] = toupper(buffer_def[0]);
	
	puts(buffer_def);

	free(frase_random);
	free(sog_random);
	free(agg_random);
	
	return 0;
}
