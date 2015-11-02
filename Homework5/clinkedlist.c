/*/
Michael Shershin
200-49-739
CMPT 422L 111
/*/

#include <stdio.h>
#include <stdlib.h>

int listsort(const void *ptr1, const void *ptr2);

struct linklist
{
  /* pointer to the link before the current char */
  struct linklist *before;
  /* pointer to the link after the current char */
  struct linklist *after;
  /* pointer to the link before the sort char */
  struct linklist *sortbefore;
  /* pointer to the link after the sort char */
  struct linklist *sortafter;
  /*actual char */
  int charVal;
};

struct ptrlist
{
  struct linklist *val;
};

int main()
{
  int error = 0;
  int done = 0;
  int nbrChar = 0;
  int i = 0;
  struct linklist *first = NULL;
  struct linklist *last  = NULL;
  struct linklist *current = NULL;
  struct linklist *sortfirst = NULL;
  struct linklist *sortlast = NULL;
  struct ptrlist *sortlist = NULL;
  struct ptrlist *currentsort = NULL;
  printf("Please enter a string: \n");
  do{
      /* allocating space for the linklist in the heap */
      current = (struct linklist *) malloc (sizeof(struct linklist));
      if (current == NULL){
        /* print message if there is an error */
        printf("Unable to obtain heap. Please try again later.\n");
        error = 1;
      } else {
        /* read in the char */
        current->charVal = getchar();
        if ((current->charVal != '\0') &&
            (current->charVal != '\n')){
          nbrChar++;
          current->sortbefore = NULL;
          current->sortafter = NULL;
          /* setting up the chains */
          if (first == NULL){
            /* inserting the first heap entry */
            first = current;
            last = current;
            current->before = NULL;
            current->after = NULL;
          } else {
            /* inserting after the first */
            last->after = current;
            current->after = NULL;
            last = current;
          }
        }else{
          done = 1;
          if (first == NULL){
            /* print error if no string is entered */
            printf("No string found.\n");
            error = 1;
          }
        }
      }
    }while((done == 0) && (error == 0));
  if (error == 0){
    sortlist = (struct ptrlist *) malloc (nbrChar*sizeof(struct ptrlist));
    if(sortlist == NULL){
      printf("Unable to obtain heap for sorting.\n");
    }else{
      current = first;
      currentsort = sortlist;
      for(i = 0; (i < nbrChar) && (current != NULL); i++){
        currentsort->val = current;
        current = current->after;
        currentsort++;
      }
      qsort(sortlist,nbrChar,sizeof(struct ptrlist),(*listsort));
      currentsort = sortlist;
      for(i = 0; i < nbrChar; i++){
        if (sortfirst == NULL){
          /* inserting the first sort heap entry */
          sortfirst = currentsort->val;
          sortlast = currentsort->val;
          currentsort->val->sortbefore = NULL;
          currentsort->val->sortafter = NULL;
        } else {
          /* inserting after the first sort */
          sortlast->sortafter = currentsort->val;
          currentsort->val->sortafter = NULL;
          sortlast = currentsort->val;
        }
        currentsort++;
      }
      current = sortfirst;
      for(i = 0; (i < nbrChar) && (current != NULL); i++){
        printf("%c\n",current->charVal);
        current = current->sortafter;
      }
    }
  }
  return 0;
}

/* function to sort */
int listsort(const void *ptr1, const void *ptr2)
{
  struct ptrlist *ptr1t;
  struct ptrlist *ptr2t;

  ptr1t = (struct ptrlist *)ptr1;
  ptr2t = (struct ptrlist *)ptr2;

  int rc = 0;
  if (ptr1t->val->charVal > ptr2t->val->charVal){
    rc = 1;
  } else if (ptr1t->val->charVal < ptr2t->val->charVal){
    rc = -1;
  }
  return rc;
};
