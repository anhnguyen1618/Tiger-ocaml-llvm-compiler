#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern void tig_print(const char *s)
{
   puts(s);
}

extern void tig_print_int(const int i)
{
   printf("%d\n", i);
}

extern void tig_flush(void)
{
   fflush(stdout);
}

extern char tig_getchar(void)
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

extern char tig_chr(const int i)
{
   char* s = malloc(sizeof(char) * 2);
   s[0] = i;
   s[1] = '\0';
   return s;
}

extern int tig_size(const char *s)
{
   return strlen(s);
}

extern char tig_substring(const char *s, const int start, const int len)
{
   char *sub = malloc(sizeof(char) * (len + 1));
   strncpy(sub, s + start, len);
   sub[len] = '\0';
   return sub;
}

extern char tig_concat(const char *s1, const char *s2)
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
