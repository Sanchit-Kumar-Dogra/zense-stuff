#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct information {               //Making a struct to hold variables for all the inputs
    char name[21];
    int id;
    float marks;
};

void sort(struct information info[],int n){         //Making a function to help us sort the array of stuctures
	for(int i=0;i<n-1;i++)
	{
		for(int j=i+1;j<n;j++)
		{
			if(info[j].id<info[i].id)
			{
				struct information temp=info[i];
				info[i]=info[j];
				info[j]=temp;
			}
		}
	}
}

int main(){
    int n;
    // scanf("%d",&n);
    struct information *ptr;

    FILE *fptr;                                     //File input is taken from input_file
    fptr = fopen("input_file","r");
    fscanf(fptr,"%d",&n);
    struct information info[n];
    for(int i = 0; i < n; ++i){
        fscanf(fptr,"%s %d %f", (info[i]).name, &(info[i]).id, &((info[i]).marks));
    }
    sort(info,n);                           //Sorting the array of structures
    
    fclose(fptr);   

    FILE *ffptr;                            //File output is given to output_file.txt
    ffptr=fopen("output_file", "w");
    for(int j = 0; j < n; ++j){
        fprintf(ffptr,"%s %d %g\n", (info[j]).name, (info[j]).id, ((info[j]).marks));
    }
    fclose(ffptr);
}
