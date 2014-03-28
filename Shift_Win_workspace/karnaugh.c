#include <stdio.h>
#define n 4
struct kmap{
//	int n;
	int port[n+1][n*n];
	int karnaugh_main[n*n];
	};

main(){
	printf("\tEnter number of ports\n");
	int np,i,j;
	scanf("%d", &np);
	struct kmap kar;
//	kar.n = np;
	printf("Please enter port configuration");
	for(i=0; i<=(np*np)-1; ++i){
		for(j=1; j<=np+1; ++j){
			scanf("%d", &kar.port[j][i]);
			}
		}
	for(i=0; i<=(np*np)-1; ++i){
		printf("\n");
                for(j=1; j<=np+1; ++j){
                        printf("%d\t", kar.port[j][i]);
                        }
                }
}
