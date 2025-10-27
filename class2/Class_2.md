Class 2 - data types, data loading, data manipulation
================
Szymon Drobniak
10/27/25

<div>

> **Before you start…**
>
> Make sure you have the following set and ready:
>
> - Folder you want touse as your working directory exists on your HDD
> - Set this folder as working directory (using a menu or
>   `setwd("YOUR_PATH)`)
> - Relevant data (if provided) is in your working directory

</div>

**In the below instructions…**

**EXERCISE X:** are bits of code to execute/practice pieces to do, often
with only hints on how to perform them.

**Output** indicates the typical output you should expect from a given
instruction.

## Paths in R

Paths in R can be relative or absolute. For example, in my environment
my current working directory is

    [1] "/Users/szymek/Library/CloudStorage/Dropbox/#SCIENCE/ANALYSES/_dydaktyka/2411XX_R_Essentials/class2"

Which is very long and hard to rememeber/type in. However, once set I
can refer to files in this folder using *relative* paths (skipping the
part leading TO the root directory). E.g. for the `class2` folder I can
just write `"class2"` or `"./class2"`.

**EXERCISE 1:** explore the `here` package - try to install it and see
what it does? Why it can be helpful? See what happens after executing
its main function `here()`. Compare it with running `getwd()`.

■

**EXERCISE 2:** Using the `here` package, create a path to the `class2`
folder.

**Output**

    [1] "/Users/szymek/Library/CloudStorage/Dropbox/#SCIENCE/ANALYSES/_dydaktyka/2411XX_R_Essentials/class2"

■

**EXERCISE 3:** Explore the `pacman` package. What does it do? How can
it be helpful? What are the main functions? Try executing it on some
package you have not installed before: `pacman::p_load("castor")`. What
happened? Afterwards, use `pacman::p_loaded()` to see what packages are
loaded and if the `castor` package is active in your workspace.

<div>

> **A thing on function arguments**
>
> Before running code in this block, make sure to run `set.seed(123)` to
> ensure reproducibility of results.
>
> Try the following code snippets on your computer:
>
> ``` r
> set.seed(123)
> rnorm(5, 0, 1)
> ```
>
>     [1] -0.56047565 -0.23017749  1.55870831  0.07050839  0.12928774
>
> ``` r
> set.seed(123)
> rnorm(n = 5, mean = 0, sd = 1)
> ```
>
>     [1] -0.56047565 -0.23017749  1.55870831  0.07050839  0.12928774
>
> ``` r
> set.seed(123)
> rnorm(n = 5, sd = 0, 1)
> ```
>
>     [1] 1 1 1 1 1
>
> ``` r
> set.seed(123)
> rnorm(5, 1, 0)
> ```
>
>     [1] 1 1 1 1 1
>
> ``` r
> set.seed(123)
> rnorm(n = 5, me = 0, sd = 1)
> ```
>
>     [1] -0.56047565 -0.23017749  1.55870831  0.07050839  0.12928774
>
> What general rules about function argument naming we can deduce from
> those?

</div>

## R is just a huge calculator

**Excersie 4:** Try to calculate the following expressions:

- sum of 2 and 3
- product of 11 and 345
- logarithm of 1000 (based on the result, what base of logarithm have
  you used?)
- square root of 144

**Output**

    [1] 5

    [1] 3795

    [1] 6.907755

    [1] 12

■

**EXERCISE 5:** Execute `20 %% 3` and `20 %/% 3`. What do these
operators do?

**Output**

    [1] 2

    [1] 6

■

**EXERCISE 6:** Compute the following expressions:

- `2+3/5+2^3`
- `2+3/(5+2)^3`
- `2+3/(5+2^3)`
- `2+3/(5+2)^3*2`
- `2+3/(5+2)^(3*2)`

Is the order of operations in R the same as in mathematics?

**Output**

    [1] 10.6

    [1] 2.008746

    [1] 2.230769

    [1] 2.017493

    [1] 2.000025

■

Results of mathematical operations can be assigned to named variables
and subsequently used in mathematical calculations.

**EXERCISE 7:** Create variables `d` and `h` describing the diameter and
height of a cylinder that is 12 cm wide and 20 cm high. Calculate the
volume of this cylinder and assign it to a variable `V`. Calculate
another variable `V2` ccontaining a volume larger by 22% than `V`. What
is `V2`?

**Output**

    [1] 2759.575

## Data types in R

### Vectors

The most basic data type in R is a vector. It can be of different types,
e.g. numeric, character, logical, etc. There are several ways of
creating them, the simplest being by suing the concatenating function
`c()`.

**EXERCISE 8:** Create a vector `v` containing numbers 1, 2, 3, 4, 5, 6,
7, 8, 9, 10. Assign it to a new variable `mynumbers`. What is the
variable type of `mynumbers`? (Hint: check out the `class()` and
`mode()` functions.)

**Output**

    [1] "numeric"

■

**EXERCISE 9:** Create a vector `v` containing the letters of your first
name. Assign it to a new variable `myname`. What is the variable type of
`myname`? What is the length of this vector?

**Output**

    [1] "character"

    [1] 6

■

**EXERCISE 10:** Creating sequences of numbers is made easier by the `:`
operator. It can be also achieved via two helper functions: `seq()` and
`rep()`. Have a look at these functions, and the, using any method other
than typing the numbers manually, create the following vectors (you may
or not assign them to new variables):

- a sequence of numbers from 1 to 27
- a sequence of numbers from 1 to 27 with a step of 2
- a sequence of numbers from 2 to 8.8, with 17 numbers in the sequence
  in total (in this sequence - what is the first and last generated
  element? Assign this sequence to a variable `seq1` and try to extract
  only its first and last element using the `[]` operator.
- a sequence of numbers from 1 to 5, repeated 3 times

**Output**

     [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
    [26] 26 27

     [1]  1  3  5  7  9 11 13 15 17 19 21 23 25 27

     [1] 2.000 2.425 2.850 3.275 3.700 4.125 4.550 4.975 5.400 5.825 6.250 6.675
    [13] 7.100 7.525 7.950 8.375 8.800

    [1] 2

    [1] 8.8

     [1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5

■

Vectors can sometimes behave unpredictably when used in arithmetic
operations.

**EXERCISE 11:** Create two variables `x <- c(1, 2, 3)` and
`y <- c(4, 5, 6)`. Try to add them together. What is the result? What
happens if you try to multiply them? What if you try to multiply `x` by
2? Now, create `z <- c(2, 4, 6, 8, 10)` and try adding `x + z`. What is
the result?

**Output**

    [1] 5 7 9

    [1]  4 10 18

    [1] 2 4 6

    [1]  3  6  9  9 12

<div>

> **Problems in R**
>
> What do you think is a difference between `warning` and `error` in R?

</div>

**EXERCISE 12:** Using any of the previosuly created vectors (or having
created a new one) explore the following functions designed to
manipulate the vector-type variables. What happens if you try to apply
them to a vector of characters?

- `sum()`
- `mean()`
- `length()`
- `max()`
- `min()`
- `sort()`
- `prod()`
- `unique()`
- `median()`
- `range()`
- `quantile()`

■

### Indexing

Elements of a vector (a 1-dimensional data structure) can be accessed
via indices, provided using the index operator `[]`. The index can be a
single number, a vector of numbers, or a logical vector. Vectors can
have named elements, in which case the index can also be a character
string.

A built-in vector `LETTERS` contains all the uppercase letters of the
English alphabet:

``` r
LETTERS
```

     [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S"
    [20] "T" "U" "V" "W" "X" "Y" "Z"

**EXERCISE 13:** Extract, from the full `LETTERS` vector, the following
items:

- the first element
- letters from 5th to 11th
- letters no. 4, 17, 3, 19 - in this order
- all letters ithout the 18th one

**Output**

    [1] "A"

    [1] "E" "F" "G" "H" "I" "J" "K"

    [1] "D" "Q" "C" "S"

     [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "S" "T"
    [20] "U" "V" "W" "X" "Y" "Z"

■

**EXERCISE 14:** Create a vector `LETT` containing the first 4 letters
of alphabet. Using the `name()` function name them as alfa, beta, gamma,
delta. Now, see if you can extract the third one using its name?

**Output**

    gamma 
      "C" 

■

**EXERCISE 15:** Can a vector contain numbers and characters? What
happens if you try to produce a vector with numbers and letters? And
what if you try do it with numbers and logicals (`TRUE` and `FALSE`)?

**Output**

    [1] "1" "2" "a" "b"

    [1] 1 2 1 0

<div>

> **Booleans**
>
> In R, `TRUE` and `FALSE` are the logical values. They can be used in
> arithmetic operations, where `TRUE` is treated as 1 and `FALSE` as 0.
> They can also be used in logical operations, where they can be
> combined using the `&` (AND), `|` (OR), and `!` (NOT) operators. The
> `==` operator is used to compare two values, and the `!=` operator is
> used to check if two values are different. `TRUE` can be abbreviated
> as `T` and `FALSE` as `F`.

</div>

**EXERCISE 16:** Try forming the following vector:
`c(1,2,4,7,NA,NaN,6,Inf)`. Why aren’t letters treated as characters?

**Output**

    [1]   1   2   4   7  NA NaN   6 Inf

■

**EXERCISE 17:** What happens if you try to calculate the mean of the
vectopr from Ex 16? What is you fiorst wrap the vector by putting it
inside of a `na.omit()` function?

**Output**

    [1] NA

    [1] Inf

<div>

> **Code indentations**
>
> Compare the following two code examples:
>
> ``` r
> mean(na.omit(c(1,2,4,7,NA,NaN,6,Inf)))
> ```
>
> ``` r
> mean(
>   na.omit(
>     c(1,2,4,7,NA,NaN,6,Inf)
>   )
> )
> ```
>
> Which one is easier to read?

</div>

■

<div>

> **Lists**
>
> If you want to put together data of different types in R, you can use
> lists. Lists can be nested (have multiple levels), can contain
> elements of different types, and can have named elements. Accessing
> elements of a list is achieved by using names or the `$` operator.
>
> ``` r
> mylist <- list(
>   species = c("blue tit", "great tit"),
>   study_years = c(200, 2001, 2005, 2010),
>   populations = "Gotland"
> )
>
> mylist[[1]]
> ```
>
>     [1] "blue tit"  "great tit"
>
> ``` r
> mylist[[1]][2]
> ```
>
>     [1] "great tit"
>
> ``` r
> mylist$populations
> ```
>
>     [1] "Gotland"

</div>

## External data

### Loading data

External data can be loaded into R from various sources, including Excel
spreadsheets, text files (`*.txt`, `*.csv`, etc.) The important thing to
consider is to know a few things about your data:

- is it a separated file and if yes - what separates columns
  (variables)?
- does the first row contain variable names?
- what is the decimal separator (R assumes it is `.`)?
- how do we want to treat any text variables?

In most cases we will use data separated by commas (e.g., CSV file) or
Tabs (`\t`).

<div>

> **CSV**
>
> Polish MS Excel saves CSV files with `;` and not `'` as variable
> separators! Always make sure you use the correct separating character.

</div>

Loading data to R can be achieved using the `read.table()` function.
It’s key arguments are `header` (whether the first row contains variable
names), `sep` (what is the separating character), and `dec` (what is the
decimal separator). Look into the help files of this function - what is
the purpose of `stringsAsFactors` argument?

**EXERCISE 18:** Load the `BTdata.csv` file from the `data` folder (you
can move it to your working directory). Before doing this, check the
file structure. Assign this loaded dataset to a `mydata` variable and
check it’s class after loading the data. What variable type it is?

**Output**

    [1] "data.frame"

■

<div>

> **Saving data tables**
>
> If you have an object containing some dataframe, you can use the
> `write.table()` function to save it into a text file on your drive.

</div>

### Indexing data tables

Data-frames are actually lists, with list elements being the variables
included in the data. You can create a dataframe manually using the
`data.frame()` function - usually it is not needed (you will ususally
use external data anyway).

**EXERCISE 19:** Knowing a dataframe is a list, extract the variable
`tarsus` from it (hint: what operator was used to extract named list
elements?)

**Output**

      [1] 13.55 15.07 14.99 14.69 14.46 13.93 13.93 15.45 14.31 14.46 14.99 14.08
     [13] 14.77 13.63 16.81 14.24 14.92 14.46 15.37 13.40 14.08 13.93 13.86 14.92
     [25] 15.22 13.63 14.61 14.84 14.31 14.92 13.93 14.61 14.16 14.69 14.69 14.92
     [37] 14.69 14.77 14.24 14.69 14.39 13.02 14.61 14.54 14.77 14.77 14.54 14.99
     [49] 14.61 14.54 13.93 14.61 14.69 13.93 14.61 14.46 14.08 15.37 14.69 14.54
     [61] 15.22 14.77 14.08 14.46 14.69 14.88 15.30 14.08 14.46 14.69 14.61 14.46
     [73] 13.71 14.61 14.24 14.77 15.11 13.93 14.39 13.86 14.77 15.30 14.39 14.61
     [85] 14.01 14.39 13.86 13.86 13.86 14.54 14.54 14.54 14.08 14.77 15.30 14.24
     [97] 14.77 14.12 14.01 15.37 14.46 13.71 13.93 14.16 14.46 15.07 13.93 14.84
    [109] 14.69 15.07 15.22 13.10 14.61 13.71 14.77 13.18 14.84 14.77 14.31 14.77
    [121] 12.57 14.69 13.93 14.77 15.22 14.77 14.46 14.46 14.08 14.46 14.16 14.69
    [133] 14.77 14.61 14.54 15.52 14.31 15.37 13.78 15.45 14.46 14.77 14.24 14.69
    [145] 14.16 14.92 14.08 15.14 14.08 14.69 14.39 14.16 15.30 15.45 14.24 14.31
    [157] 13.93 14.61 13.40 14.54 14.01 15.14 14.54 14.69 14.46 14.08 14.01 14.77
    [169] 14.46 14.54 14.46 14.39 14.77 14.77 14.46 14.69 15.14 15.30 14.69 13.78
    [181] 14.92 14.61 13.86 13.86 14.69 15.37 13.86 14.61 14.84 14.08 14.61 14.08
    [193] 14.54 14.77 14.54 15.52 14.61 13.33 14.77 14.16 15.07 14.69 14.08 15.07
    [205] 15.37 15.52 13.86 14.24 14.69 13.55 14.69 14.69 14.16 14.46 13.71 14.24
    [217] 14.61 14.54 14.46 14.46 15.14 14.84 14.77 15.22 14.16 14.31 14.77 15.07
    [229] 14.54 14.77 14.69 14.54 14.54 14.84 14.54 15.45 14.08 14.92 14.77 13.40
    [241] 14.69 14.99 15.07 14.39 13.86 14.99 14.01 14.08 14.39 14.01 14.99 15.37
    [253] 14.54 14.84 14.54 14.61 13.93 14.01 14.77 14.92 14.39 13.86 14.31 13.48
    [265] 14.08 13.78 14.24 13.10 15.14 14.54 14.31 14.54 14.08 13.93 14.54 14.61
    [277] 13.86 13.93 14.54 14.01 14.08 14.61 15.14 14.46 14.46 13.71 14.61 15.45
    [289] 14.54 14.35 14.54 15.18 14.16 14.77 14.69 14.24 14.61 14.69 14.16 14.24
    [301] 14.61 13.63 14.84 15.37 14.08 15.37 14.08 14.92 14.31 14.54 14.54 14.46
    [313] 14.69 15.22 14.84 15.45 13.86 14.54 14.69 14.61 14.84 14.08 14.99 14.54
    [325] 14.01 14.69 14.69 15.14 14.92 14.61 13.78 15.37 14.31 13.93 14.69 13.86
    [337] 15.14 14.77 13.33 14.61 14.69 14.54 14.54 14.92 14.16 14.69 14.24 14.46
    [349] 14.77 14.99 14.84 14.69 14.31 14.61 14.54 14.61 14.84 14.92 13.93 15.07
    [361] 14.61 14.69 14.24 14.08 14.92 14.54 14.84 14.61 14.61 13.93 14.61 14.61
    [373] 14.16 13.78 14.54 13.71 14.77 14.54 15.03 14.46 14.77 13.93 13.93 14.08
    [385] 14.46 13.78 13.48 14.31 14.84 14.39 15.22 14.16 15.30 14.69 14.61 14.39
    [397] 13.93 14.54 13.86 14.24 13.93 14.01 14.31 15.07 15.45 14.77 14.61 14.46
    [409] 14.46 14.24 14.46 14.84 15.07 14.61 14.77 14.39 14.61 14.46 13.25 13.25
    [421] 14.77 14.01 14.01 14.69 14.16 13.63 13.93 14.99 13.78 14.92 14.99 14.54
    [433] 13.86 14.54 15.52 14.39 13.10 14.99 15.22 13.93 14.99 13.86 14.61 14.46
    [445] 14.69 14.69 14.92 14.69 13.33 14.08 14.54 14.54 15.07 14.99 13.63 15.14
    [457] 14.46 15.30 14.99 14.46 13.78 14.08 14.99 14.92 14.54 14.61 14.35 14.01
    [469] 14.31 14.39 14.39 14.84 13.93 14.69 13.93 13.86 13.25 13.63 14.08 14.16
    [481] 14.73 13.93 14.01 14.39 14.69 14.16 13.93 14.54 14.24 14.39 14.69 14.54
    [493] 14.77 14.92 14.99 14.84 14.39 14.77 13.25 14.31 14.16 14.77 14.46 15.07
    [505] 13.40 13.93 13.93 14.95 14.92 14.46 14.01 14.69 14.46 14.54 14.46 14.08
    [517] 15.07 14.46 15.07 14.54 14.24 14.39 15.30 15.07 14.69 15.45 14.77 14.01
    [529] 14.46 14.54 13.78 14.46 13.86 14.77 14.61 15.37 14.39 14.16 15.07 14.46
    [541] 14.31 14.54 13.25 14.24 14.39 14.69 14.61 14.46 14.39 14.69 14.01 13.71
    [553] 14.01 15.07 14.77 14.46 13.40 14.39 14.99 13.93 14.54 13.86 15.07 14.39
    [565] 14.54 14.61 15.37 14.84 13.93 14.27 13.93 14.77 14.99 14.08 14.84 14.61
    [577] 14.77 14.69 13.10 14.54 14.61 14.84 14.54 13.71 13.63 14.24 14.99 14.39
    [589] 14.61 14.77 14.39 13.86 14.77 12.95 13.86 14.61 14.92 14.61 14.69 13.86
    [601] 15.07 14.54 14.54 14.84 13.86 14.77 14.54 14.77 13.25 14.99 15.37 14.99
    [613] 15.07 14.61 14.46 14.61 14.16 13.93 13.48 14.54 15.07 15.07 14.77 14.69
    [625] 14.54 14.46 14.08 14.61 14.77 14.77 14.61 14.69 15.22 14.24 14.46 14.54
    [637] 14.16 14.39 14.69 14.08 14.01 14.77 14.31 14.69 14.46 13.40 14.69 15.37
    [649] 14.54 14.84 13.86 14.54 14.92 15.22 14.61 14.69 14.16 14.46 13.86 15.30
    [661] 14.54 14.84 14.69 14.31 15.37 15.30 14.31 13.10 14.08 14.61 15.22 14.46
    [673] 13.86 14.61 14.54 14.69 14.54 13.93 15.45 14.01 15.30 14.92 13.93 14.92
    [685] 15.30 14.16 14.69 15.22 15.14 14.92 15.30 14.39 14.24 14.54 15.30 14.46
    [697] 14.61 14.54 13.93 15.22 15.37 15.37 13.93 14.69 13.86 13.63 14.69 14.08
    [709] 14.16 13.33 14.92 14.92 15.30 14.69 14.39 14.46 14.54 15.30 14.61 14.92
    [721] 14.16 14.92 14.92 14.69 14.77 14.69 13.86 14.61 14.01 15.14 14.69 13.93
    [733] 14.24 14.39 13.86 15.07 14.16 13.25 14.77 14.24 14.24 13.93 14.39 14.31
    [745] 15.98 14.46 13.86 14.84 14.99 14.61 13.78 14.92 15.37 14.92 14.31 14.99
    [757] 13.71 14.69 14.54 14.24 14.84 14.54 14.39 14.92 14.69 14.77 14.01 14.08
    [769] 14.31 14.92 14.08 14.24 15.07 14.84 14.46 14.01 14.39 14.46 15.64 14.39
    [781] 15.14 14.77 14.54 14.08 13.86 14.61 14.39 14.84 14.69 13.93 15.07 14.61
    [793] 14.46 15.60 14.77 14.31 14.61 15.22 14.61 14.69 15.07 13.78 14.92 13.93
    [805] 14.16 14.77 14.01 14.99 14.84 14.84 15.67 14.92 14.77 14.01 14.39 14.54
    [817] 14.77 14.24 14.92 14.69 13.33 14.16 15.45 14.61 14.61 13.93 15.30 14.92

■

Another way of extracting data from dataframes is by providing their
indices. Dataframes are 2-dimensional (they have rows - cases and
columns - variables). We need 2 indioces to extract data from them. By
conventio, we always provide the row index first and then the column
index.

**EXERCISE 20:** Extract the value of the `tarsus` variable for the 5th
bird in the dataset using 3 different approaches. Also, try extracting
cases 4 to 17 from the dataset and save them to new object `subdata`. Is
the new object of the same type?

**Output**

    [1] 14.46

    [1] 14.46

    [1] 14.46

    [1] "data.frame"

Try pulling out one column (e.g., the second) and one row (e.g., the
second) from the dataset. Which of the two is a vector? Why one IS a
vector and the other isn’t?

■

**EXERCISE 21:** Generate a summary of your dataset (`summary()`) and
check its structure (`str()`). What is the type of variables that were
coded as text in the dataset?

**Output**

         tarsus           back           dam             fosternest       
     Min.   :12.57   Min.   :546.7   Length:828         Length:828        
     1st Qu.:14.16   1st Qu.:549.2   Class :character   Class :character  
     Median :14.54   Median :549.9   Mode  :character   Mode  :character  
     Mean   :14.50   Mean   :550.0                                        
     3rd Qu.:14.77   3rd Qu.:550.8                                        
     Max.   :16.81   Max.   :554.2                                        
       hatchdate        sex                weight         habitat         
     Min.   :44.0   Length:828         Min.   : 8.600   Length:828        
     1st Qu.:47.0   Class :character   1st Qu.: 9.500   Class :character  
     Median :48.0   Mode  :character   Median : 9.800   Mode  :character  
     Mean   :48.4                      Mean   : 9.789                     
     3rd Qu.:50.0                      3rd Qu.:10.000                     
     Max.   :55.0                      Max.   :11.400                     
      bill_length      bill_depth    
     Min.   :10.07   Min.   :0.5130  
     1st Qu.:11.32   1st Qu.:0.6130  
     Median :11.64   Median :0.6380  
     Mean   :11.60   Mean   :0.6375  
     3rd Qu.:11.84   3rd Qu.:0.6650  
     Max.   :13.40   Max.   :0.7970  

    'data.frame':   828 obs. of  10 variables:
     $ tarsus     : num  13.6 15.1 15 14.7 14.5 ...
     $ back       : num  551 549 550 550 550 ...
     $ dam        : chr  "R187557" "R187559" "R187568" "R187518" ...
     $ fosternest : chr  "F2102" "F1902" "A602" "A1302" ...
     $ hatchdate  : int  47 47 47 45 45 49 47 46 44 46 ...
     $ sex        : chr  "Fem" "Male" "Male" "Male" ...
     $ weight     : num  8.9 10.5 9.9 9.7 9.7 9.3 9.3 10.2 9.5 9.6 ...
     $ habitat    : chr  "park" "forest" "forest" "forest" ...
     $ bill_length: num  10.9 12.1 12 11.7 11.6 ...
     $ bill_depth : num  0.597 0.682 0.673 0.639 0.631 0.626 0.591 0.675 0.629 0.609 ...

■

**EXERCISE 22:** Reload the data - now setting
`stringsAsFactors = TRUE`. What has changed in the structure of the
dataset?

**Output**

    'data.frame':   828 obs. of  10 variables:
     $ tarsus     : num  13.6 15.1 15 14.7 14.5 ...
     $ back       : num  551 549 550 550 550 ...
     $ dam        : Factor w/ 106 levels "Fem2","Fem20",..: 56 57 61 38 43 94 3 23 37 40 ...
     $ fosternest : Factor w/ 104 levels "A1002","A102",..: 74 72 16 4 12 38 35 34 42 28 ...
     $ hatchdate  : int  47 47 47 45 45 49 47 46 44 46 ...
     $ sex        : Factor w/ 3 levels "Fem","Male","UNK": 1 2 2 2 1 1 2 1 1 1 ...
     $ weight     : num  8.9 10.5 9.9 9.7 9.7 9.3 9.3 10.2 9.5 9.6 ...
     $ habitat    : Factor w/ 2 levels "forest","park": 2 1 1 1 1 1 2 1 2 1 ...
     $ bill_length: num  10.9 12.1 12 11.7 11.6 ...
     $ bill_depth : num  0.597 0.682 0.673 0.639 0.631 0.626 0.591 0.675 0.629 0.609 ...

■

**EXERCISE 23:** By using the `$` operator, create a new variable in the
dataset called `tars_mass` and fill it iwth the ration of tarsus length
to body mass. Use the `head()` function to verify the new variable was
added to the table.

**Output**

      tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1  13.55 551.3757 R187557      F2102        47  Fem    8.9    park      10.885
    2  15.07 549.0884 R187559      F1902        47 Male   10.5  forest      12.056
    3  14.99 550.1739 R187568       A602        47 Male    9.9  forest      12.000
    4  14.69 550.3067 R187518      A1302        45 Male    9.7  forest      11.733
    5  14.46 549.6392 R187528      A2602        45  Fem    9.7  forest      11.565
    6  13.93 551.8693 R187945      C2302        49  Fem    9.3  forest      11.165
      bill_depth tars_mass
    1      0.597  1.522472
    2      0.682  1.435238
    3      0.673  1.514141
    4      0.639  1.514433
    5      0.631  1.490722
    6      0.626  1.497849

■

**EXERCISE 24:** Explore the work of several helper functions used to
manipulate datasets: `names`, `nrow`, `ncol`, `dim`, `colnames`,
`rownames`, `head`, `tail`. What happens when you run `View(mydata)`?

**Output**

     [1] "tarsus"      "back"        "dam"         "fosternest"  "hatchdate"  
     [6] "sex"         "weight"      "habitat"     "bill_length" "bill_depth" 
    [11] "tars_mass"  

    [1] 828

    [1] 11

    [1] 828  11

     [1] "tarsus"      "back"        "dam"         "fosternest"  "hatchdate"  
     [6] "sex"         "weight"      "habitat"     "bill_length" "bill_depth" 
    [11] "tars_mass"  

      [1] "1"   "2"   "3"   "4"   "5"   "6"   "7"   "8"   "9"   "10"  "11"  "12" 
     [13] "13"  "14"  "15"  "16"  "17"  "18"  "19"  "20"  "21"  "22"  "23"  "24" 
     [25] "25"  "26"  "27"  "28"  "29"  "30"  "31"  "32"  "33"  "34"  "35"  "36" 
     [37] "37"  "38"  "39"  "40"  "41"  "42"  "43"  "44"  "45"  "46"  "47"  "48" 
     [49] "49"  "50"  "51"  "52"  "53"  "54"  "55"  "56"  "57"  "58"  "59"  "60" 
     [61] "61"  "62"  "63"  "64"  "65"  "66"  "67"  "68"  "69"  "70"  "71"  "72" 
     [73] "73"  "74"  "75"  "76"  "77"  "78"  "79"  "80"  "81"  "82"  "83"  "84" 
     [85] "85"  "86"  "87"  "88"  "89"  "90"  "91"  "92"  "93"  "94"  "95"  "96" 
     [97] "97"  "98"  "99"  "100" "101" "102" "103" "104" "105" "106" "107" "108"
    [109] "109" "110" "111" "112" "113" "114" "115" "116" "117" "118" "119" "120"
    [121] "121" "122" "123" "124" "125" "126" "127" "128" "129" "130" "131" "132"
    [133] "133" "134" "135" "136" "137" "138" "139" "140" "141" "142" "143" "144"
    [145] "145" "146" "147" "148" "149" "150" "151" "152" "153" "154" "155" "156"
    [157] "157" "158" "159" "160" "161" "162" "163" "164" "165" "166" "167" "168"
    [169] "169" "170" "171" "172" "173" "174" "175" "176" "177" "178" "179" "180"
    [181] "181" "182" "183" "184" "185" "186" "187" "188" "189" "190" "191" "192"
    [193] "193" "194" "195" "196" "197" "198" "199" "200" "201" "202" "203" "204"
    [205] "205" "206" "207" "208" "209" "210" "211" "212" "213" "214" "215" "216"
    [217] "217" "218" "219" "220" "221" "222" "223" "224" "225" "226" "227" "228"
    [229] "229" "230" "231" "232" "233" "234" "235" "236" "237" "238" "239" "240"
    [241] "241" "242" "243" "244" "245" "246" "247" "248" "249" "250" "251" "252"
    [253] "253" "254" "255" "256" "257" "258" "259" "260" "261" "262" "263" "264"
    [265] "265" "266" "267" "268" "269" "270" "271" "272" "273" "274" "275" "276"
    [277] "277" "278" "279" "280" "281" "282" "283" "284" "285" "286" "287" "288"
    [289] "289" "290" "291" "292" "293" "294" "295" "296" "297" "298" "299" "300"
    [301] "301" "302" "303" "304" "305" "306" "307" "308" "309" "310" "311" "312"
    [313] "313" "314" "315" "316" "317" "318" "319" "320" "321" "322" "323" "324"
    [325] "325" "326" "327" "328" "329" "330" "331" "332" "333" "334" "335" "336"
    [337] "337" "338" "339" "340" "341" "342" "343" "344" "345" "346" "347" "348"
    [349] "349" "350" "351" "352" "353" "354" "355" "356" "357" "358" "359" "360"
    [361] "361" "362" "363" "364" "365" "366" "367" "368" "369" "370" "371" "372"
    [373] "373" "374" "375" "376" "377" "378" "379" "380" "381" "382" "383" "384"
    [385] "385" "386" "387" "388" "389" "390" "391" "392" "393" "394" "395" "396"
    [397] "397" "398" "399" "400" "401" "402" "403" "404" "405" "406" "407" "408"
    [409] "409" "410" "411" "412" "413" "414" "415" "416" "417" "418" "419" "420"
    [421] "421" "422" "423" "424" "425" "426" "427" "428" "429" "430" "431" "432"
    [433] "433" "434" "435" "436" "437" "438" "439" "440" "441" "442" "443" "444"
    [445] "445" "446" "447" "448" "449" "450" "451" "452" "453" "454" "455" "456"
    [457] "457" "458" "459" "460" "461" "462" "463" "464" "465" "466" "467" "468"
    [469] "469" "470" "471" "472" "473" "474" "475" "476" "477" "478" "479" "480"
    [481] "481" "482" "483" "484" "485" "486" "487" "488" "489" "490" "491" "492"
    [493] "493" "494" "495" "496" "497" "498" "499" "500" "501" "502" "503" "504"
    [505] "505" "506" "507" "508" "509" "510" "511" "512" "513" "514" "515" "516"
    [517] "517" "518" "519" "520" "521" "522" "523" "524" "525" "526" "527" "528"
    [529] "529" "530" "531" "532" "533" "534" "535" "536" "537" "538" "539" "540"
    [541] "541" "542" "543" "544" "545" "546" "547" "548" "549" "550" "551" "552"
    [553] "553" "554" "555" "556" "557" "558" "559" "560" "561" "562" "563" "564"
    [565] "565" "566" "567" "568" "569" "570" "571" "572" "573" "574" "575" "576"
    [577] "577" "578" "579" "580" "581" "582" "583" "584" "585" "586" "587" "588"
    [589] "589" "590" "591" "592" "593" "594" "595" "596" "597" "598" "599" "600"
    [601] "601" "602" "603" "604" "605" "606" "607" "608" "609" "610" "611" "612"
    [613] "613" "614" "615" "616" "617" "618" "619" "620" "621" "622" "623" "624"
    [625] "625" "626" "627" "628" "629" "630" "631" "632" "633" "634" "635" "636"
    [637] "637" "638" "639" "640" "641" "642" "643" "644" "645" "646" "647" "648"
    [649] "649" "650" "651" "652" "653" "654" "655" "656" "657" "658" "659" "660"
    [661] "661" "662" "663" "664" "665" "666" "667" "668" "669" "670" "671" "672"
    [673] "673" "674" "675" "676" "677" "678" "679" "680" "681" "682" "683" "684"
    [685] "685" "686" "687" "688" "689" "690" "691" "692" "693" "694" "695" "696"
    [697] "697" "698" "699" "700" "701" "702" "703" "704" "705" "706" "707" "708"
    [709] "709" "710" "711" "712" "713" "714" "715" "716" "717" "718" "719" "720"
    [721] "721" "722" "723" "724" "725" "726" "727" "728" "729" "730" "731" "732"
    [733] "733" "734" "735" "736" "737" "738" "739" "740" "741" "742" "743" "744"
    [745] "745" "746" "747" "748" "749" "750" "751" "752" "753" "754" "755" "756"
    [757] "757" "758" "759" "760" "761" "762" "763" "764" "765" "766" "767" "768"
    [769] "769" "770" "771" "772" "773" "774" "775" "776" "777" "778" "779" "780"
    [781] "781" "782" "783" "784" "785" "786" "787" "788" "789" "790" "791" "792"
    [793] "793" "794" "795" "796" "797" "798" "799" "800" "801" "802" "803" "804"
    [805] "805" "806" "807" "808" "809" "810" "811" "812" "813" "814" "815" "816"
    [817] "817" "818" "819" "820" "821" "822" "823" "824" "825" "826" "827" "828"

      tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1  13.55 551.3757 R187557      F2102        47  Fem    8.9    park      10.885
    2  15.07 549.0884 R187559      F1902        47 Male   10.5  forest      12.056
    3  14.99 550.1739 R187568       A602        47 Male    9.9  forest      12.000
    4  14.69 550.3067 R187518      A1302        45 Male    9.7  forest      11.733
    5  14.46 549.6392 R187528      A2602        45  Fem    9.7  forest      11.565
    6  13.93 551.8693 R187945      C2302        49  Fem    9.3  forest      11.165
      bill_depth tars_mass
    1      0.597  1.522472
    2      0.682  1.435238
    3      0.673  1.514141
    4      0.639  1.514433
    5      0.631  1.490722
    6      0.626  1.497849

        tarsus     back     dam fosternest hatchdate  sex weight habitat
    823  15.45 547.8379   Fem20      H1302        48 Male   10.8    park
    824  14.61 549.8749 K983388      H1102        48 Male    9.8  forest
    825  14.61 551.0963 R186903       H702        53 Male   10.0    park
    826  13.93 548.4764 R187535       H502        47  Fem    9.5  forest
    827  15.30 549.5736 R186911       H302        53 Male   10.2    park
    828  14.92 548.2735 R187001       H102        46 Male   10.2    park
        bill_length bill_depth tars_mass
    823      12.389      0.728  1.430556
    824      11.712      0.578  1.490816
    825      11.704      0.638  1.461000
    826      11.120      0.640  1.466316
    827      12.286      0.663  1.500000
    828      11.926      0.652  1.462745

■

**EXERCISE 25:** The basic types of variables in R are `numeric`,
`factor` and `character`. Knowing, that functions beginning with `is.`
check if variable is of given type - what would you expect from running
`is.factor(mydata$sex)`? What about `is.character(mydata$dam)`? A
cmpatible set of functions has names starting with `as.` they can be
used to transform different types of variables into each other. What
would you expect from running `as.character(mydata$sex)`? And
`as.numeric(mydata$sex)`? What code would be used to replace the `dam`
variable with its text (character) version?
