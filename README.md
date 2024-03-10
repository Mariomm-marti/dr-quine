<div align='center'>

# dr-quine
#### If code could write itself... it'd be a Quine!

[The concept](#the-concept) ~
[The problems](#the-problems) ~
[The solutions](#the-solutions) ~

[How to test them](#how-to-test-them) ~
[References](#references)

</div>

## The concept
A Quine in computing is a piece of software that accepts no input and when
executed will produce an identical copy of its own source code.

This project tackles an interesting concept that can be used to understand how
certain malwares work, and how to identify and mitigate them.

Quines are a direct consequence of the Kleene's recursion theorem which is,
at the same time, a natural possibility in any Turing-complete computational
system.

## The problems
In this project, three problems with their own criteria are explored. Each of
them is done in different programming languages (namely C, ASM and Python).

The three explored problems are:
1. **Simple:** two functions, two comments, one function calling the other one.
The output is simply printed to the `stdout`.
2. **Macro and file written:** three macros, one comment, no declared main.
The output is written to an opened file descriptor.
3. **Recursive recursion:** when executed with an initialised variable (by
default 5), all files from 5 to 0 will be generated and automatically executed.
Each containing the next step until reaching the 0 level. The execution of the
general program will then generate automatically `_5`, `_4`, `_3`, `_2`,
`_1`, `_0` without manual execution.

## The solutions
Each program (and in each language) has a very specific solution. All of them
use however the same mechanism which is described in
[the concept](#the-concept): using as the formatting string the string that is
used as formatting. Although it may look like a loop that is not possible to
break, the piece of the puzzle is understanding that you can use the same
string both as **formatting string**, and as **part of the string format**.

```c
char *str = "char *str = %c%s%c;";
printf(str, 0x22, str, 0x22);
```

Will produce as output:
```c
char *str = "char *str = %c%s%c";
```

## How to test them
Testing the implemented solutions is quite straightforward.
1. Clone the repository
2. What to your preferred language's folder (C / ASM / Python)
3. Execute `make` and it will generate `Colly` (1st problem),
`Grace` (2nd problem) and `Sully` (3rd problem)

* You can execute `make fclean` to clean objects and generated files
* You can build the individual binaries by their lowercase name

## References
This project was exclusively done by reading the
[Quine computing](https://en.wikipedia.org/wiki/Quine_(computing)) article
on Wikipedia and supporting it with the
[Kleene's Recursion Theorem](https://en.wikipedia.org/wiki/Kleene's_recursion_theorem)
article.
