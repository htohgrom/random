// Some number crunching, so trying C instead of Ruby.

#include <stdio.h>

// Common day 15 parameters
#define FACT_A 16807
#define FACT_B 48271
#define DIV    2147483647
#define N      40000000UL
#define N2     5000000UL

// Input
#define START_A 679
#define START_B 771

// Example input values
#define _START_A 65
#define _START_B 8921

#define MULT_OF_4(x) (((x) & 0x3) == 0)
#define MULT_OF_8(x) (((x) & 0x7) == 0)

int main(int argc, char *argv[])
{
  // Values from the previous run
  unsigned long prev_a = START_A;
  unsigned long prev_b = START_B;
  // Values in the current run
  unsigned long new_a = 0;
  unsigned long new_b = 0;
  
  unsigned long matches = 0;
  unsigned long i = 0;
  
  for (i = 0; i < N; ++i)
  {
    // Why does it work? (potential overflow before modulo, max value
    // = 4611686009837453316 = (DIV-1)^2)
    // Note: DIV == (2^31)-1
    new_a = (prev_a * FACT_A) % DIV;
    new_b = (prev_b * FACT_B) % DIV;
    prev_a = new_a;
    prev_b = new_b;

    if ((new_a & 0xffff) == (new_b & 0xffff))
    {
      ++matches;
    }
  }

  printf("part1: %ld matches\n", matches);

  matches = 0;
  prev_a = START_A;
  prev_b = START_B;
  new_a = new_b = 0;
  
  for (i = 0; i < N2; ++i)
  {
    do
    {
      new_a = (prev_a * FACT_A) % DIV;
      prev_a = new_a;
    } while (!MULT_OF_4(new_a));

    do
    {
      new_b = (prev_b * FACT_B) % DIV;
      prev_b = new_b;
    } while (!MULT_OF_8(new_b));

    if ((new_a & 0xffff) == (new_b & 0xffff))
    {
      ++matches;
    }
  }

  printf("part2: %ld matches\n", matches);
  
  return 0;
}

/* $ gcc -Wall --pedantic -O3 15.c -o 15 */
/* $ time ./15 */
/* part1: 626 matches */
/* part2: 306 matches */

/* real	0m0,907s */
/* user	0m0,577s */
/* sys	0m0,000s */
