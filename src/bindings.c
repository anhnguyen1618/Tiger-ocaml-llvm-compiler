#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int yield_seed = 0;

extern void tig_print(const char *s)
{
   puts(s);
}

extern int tig_random(const int upper)
{
  /* Intializes random number generator */
  if(yield_seed == 0) {
    srand(time(NULL));
    yield_seed = 1;
  }

  return rand() % upper;
}


extern void tig_print_int(const int i)
{
   printf("%d\n", i);
}

extern void tig_flush(void)
{
   fflush(stdout);
}

extern char *tig_getchar(void)
{
   char *s = malloc(sizeof(char) * 2);
   s[0] = getchar();
   s[1] = '\0';
   return s;
}

extern int tig_ord(const char *s)
{
   return *s;
}

extern char *tig_chr(const int i)
{
   char* s = malloc(sizeof(char) * 2);
   s[0] = i;
   s[1] = '\0';
   return s;
}

extern int tig_nillable(const char *s)
{
  return s == NULL;
}

extern int tig_array_length(const char *s)
{
  return s[0];
}

extern void print_arr_int_ele(const int s)
{
  printf("%d, ", s);
}

extern int tig_size(const char *s)
{
   return strlen(s);
}

extern int tig_string_cmp(const char *a, const char *b)
{
  return strcmp (a, b) == 0;
}

extern char *tig_substring(const char *s, const int start, const int len)
{
   char *sub = malloc(sizeof(char) * (len + 1));
   strncpy(sub, s + start, len);
   sub[len] = '\0';
   return sub;
}

extern char *tig_concat(const char *s1, const char *s2)
{
   const int len1 = strlen(s1);
   const int len2 = strlen(s2);
   char *s = malloc(sizeof(char) * (len1 + len2 + 1));
   strcpy(s, s1);
   strcpy(s + len1, s2);
   s[len1 + len2] = '\0';
   return s;
}

extern int tig_not(const int i)
{
   return !i;
}

extern void tig_exit(const int i)
{
   exit(i);
}

extern int *tig_init_array(int size, int init)
{
  int i;
  int *a = (int *)malloc(size*sizeof(int));
  
  int n = a[0];
  for(i=0;i<size;i++) a[i]=init;
  return a;
}

extern int *tig_init_record (int size)
{
  int i;
  int *a = (int *)malloc(size*sizeof(int));
  return a;
}
