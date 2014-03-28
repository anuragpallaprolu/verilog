#include<stdio.h>
#include<conio.h>
#include<math.h>
void main()
{
  float x[10],y[10],temp=1,f[10],sum,p;
  int i,n,j,k=0,c;
  clrscr();
  printf("\nhow many record you will be enter: ");
  scanf("%d",&n);
  for(i=0; i<n; i++)
  {
   printf("\n\nenter the value of x%d: ",i);
   scanf("%f",&x[i]);
   printf("\n\nenter the value of f(x%d): ",i);
   scanf("%f",&y[i]);
  }
  printf("\n\nEnter X for finding f(x): ");
  scanf("%f",&p);

  for(i=0;i<n;i++)
  {
    temp = 1;
    k = i;
    for(j=0;j<n;j++)
    {
      if(k==j)
      {
        continue;
      }
      else
      {
        temp = temp * ((p-x[j])/(x[k]-x[j]));
      }
    }
    f[i]=y[i]*temp;
  }

  for(i=0;i<n;i++)
  {
     sum = sum + f[i];
  }
  printf("\n\n f(%.1f) = %f ",p,sum);
  getch();
}
