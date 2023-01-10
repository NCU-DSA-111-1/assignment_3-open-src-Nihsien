#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int main(){
	char k;
	srand(time(NULL));

	FILE *fptr1,*fptr2,*fptr3,*fptr4,*fptr5;
	fptr1=fopen("200000.csv","w+");
	fptr2=fopen("400000.csv","w+");
	fptr3=fopen("600000.csv","w+");
	fptr4=fopen("800000.csv","w+");
	fptr5=fopen("1000000.csv","w+");
	for(int i=0;i<10000000;i++){
		k=rand()%26;
		if(i<200000) fprintf(fptr1,"%c",k+'A');
		if(i<400000) fprintf(fptr2,"%c",k+'A');
		if(i<600000) fprintf(fptr3,"%c",k+'A');
		if(i<800000)fprintf(fptr4,"%c",k+'A');
		if(i<1000000) fprintf(fptr5,"%c",k+'A');
	}
	fclose(fptr1);
	fclose(fptr2);
	fclose(fptr3);
	fclose(fptr4);
	fclose(fptr5);
	return 0;
	}
