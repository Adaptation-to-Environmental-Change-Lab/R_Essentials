Class 3 - data types, daa loading, data manipulation
================
Szymon Drobniak
11/25/24

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

## Data wrangling in R using built-in methods

### Filtering

Instead of using numerical indices, you can use logical expressions to
set conditions on data structures in R. To make use of them, you need to
understand, that applying a logical operator to a list of data values
results in a list of `TRUE` and `FALSE` values. They can be used
themselves as indices to subset data.

<div>

> **Logical operators**
>
> - `==` - equal to
> - `!=` - not equal to
> - `>` - greater than
> - `<` - less than
> - `>=` - greater or equal to
> - `<=` - less or equal to
> - `&` - and
> - `|` - or
> - `!` - not (negation, reverses the logical value)

</div>

``` r
toydata <- rpois(20, 5)
toydata >= 5
```

     [1]  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
    [13] FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE

``` r
toydata[toydata >= 5]
```

     [1]  6  5  5  6  7  7  8  6  6  6 11  5  6

``` r
indices <- toydata >= 5
toydata[indices]
```

     [1]  6  5  5  6  7  7  8  6  6  6 11  5  6

**EXCERCISE 1:** Using the `toydata` vector, display only the even
values. Hint: use the modulo operator `%%` to check for evenness.

**Output**

    [1] 6 4 6 8 6 4 6 6 6

■

Applying these rules to dataframes is straightforward. Let’s try several
such filterings on the `BTdata` dataset (load it if you haven’t done it
yet). We want to select rows of data based on specific values of one or
more variables. This means we will insert our logicval expressions in
the row’s (the first) index. To refer to specific variable in your
expression, you can use the `$` operator. E.g.,
`BTdata[BTdata$sex == "Male", ]` will return all rows where the `sex`
variable indicates male sex.

``` r
BTdata <- read.table(here("data", "BTdata.csv"),
    header = TRUE,
    sep = ",",
    dec = ".",
    stringsAsFactors = TRUE
)
```

**EXERCISE 2:** Display all rows of the `BTdata` that fulfill the
following conditions:

- All males (`sex`) heavier (`weight`) than 11 grams
- Birds that bred in parks (`habitat`) that were mother by female no.
  R187239
- All females (`sex`) heavier than 10.3 grams, or males specifically
  with tarsus below 14 mm (`tarsus`), selecting only the first 3 columns
  of data
- All birds that hatched in forests (`habitat`) before day 45 or after
  day 53 (`hatchdate`)

**Output**

        tarsus     back     dam fosternest hatchdate  sex weight habitat
    15   16.81 548.3708 R187545      D1002        47 Male   11.4    park
    794  15.60 550.4936 R187155      F2402        47 Male   11.2    park
        bill_length bill_depth
    15       13.399      0.797
    794      12.477      0.696

        tarsus     back     dam fosternest hatchdate  sex weight habitat
    60   14.54 549.1467 R187239       D802        48 Male    9.9    park
    220  14.46 547.3801 R187239       D802        48  Fem    9.8    park
    380  14.46 549.3456 R187239       B202        48  Fem    9.7    park
    395  14.61 548.3846 R187239       B202        48 Male   10.0    park
    583  14.54 548.7014 R187239       B202        48  Fem    9.8    park
        bill_length bill_depth
    60       11.654      0.585
    220      11.561      0.637
    380      11.541      0.653
    395      11.678      0.614
    583      11.639      0.668

        tarsus     back     dam
    7    13.93 549.4878    Fem3
    14   13.63 549.2743 R187582
    26   13.63 548.3054 R186912
    54   13.93 551.5280 R187932
    78   13.93 547.4217 R187575
    80   13.86 550.0156 R187930
    103  13.93 550.9829 R187562
    116  13.18 551.2618 R187523
    159  13.40 549.3648 R186912
    187  13.86 550.2283 R187343
    215  13.71 549.0843 R187947
    336  13.86 550.7034 R187575
    374  13.78 549.9704 R187562
    386  13.78 548.8985 R187562
    401  13.93 552.3951 R187166
    419  13.25 548.8692 R187562
    429  13.78 550.7965 R187595
    433  13.86 549.2055 R187398
    440  13.93 550.0406 R187545
    473  13.93 550.6763 R187001
    476  13.86 550.8435 R187343
    560  13.93 549.8085 R187569
    571  13.93 549.6092 R187936
    585  13.63 550.1892 R187548
    605  13.86 550.1148 R188000
    609  13.25 550.9402 R187557
    673  13.86 548.5331 R187944
    678  13.93 549.1474 R187540
    683  13.93 550.3340 R187930
    742  13.93 550.9249 R187568
    747  13.86 550.5226 R187595
    749  14.99 550.3093 R187517
    757  13.71 550.3453 R187942
    790  13.93 548.3812 R187541
    802  13.78 551.3046 R187902
    812  14.92 548.0275 R187571

        tarsus     back     dam fosternest hatchdate  sex weight habitat
    26   13.63 548.3054 R186912       F102        54 Male    9.5  forest
    159  13.40 549.3648 R186912       F102        54 Male    9.1  forest
    197  14.61 550.2081 R187517       C602        44  Fem    9.5  forest
    198  13.33 551.8849 R046109       C402        44  Fem    9.2  forest
    210  13.55 549.6995 R187902      B1102        54  UNK    9.0  forest
    247  14.01 549.1963 R186912       F102        54  Fem    9.3  forest
    302  13.63 548.5952 R187902      B1102        54  Fem    9.3  forest
    338  14.77 549.1548 R186912       F102        54 Male    9.9  forest
    378  14.54 550.2464 R187517      C2202        44 Male    9.8  forest
    392  14.16 550.4797 R187398       C602        44 Male    9.6  forest
    437  13.10 551.0940 R186912      B1102        54  Fem    9.2  forest
    491  14.69 550.4395 R187398       C602        44  Fem   10.1  forest
    541  14.31 548.1940 R186917      H2502        55 Male    9.7  forest
    567  15.37 549.8400 R187517      C2202        44 Male   10.5  forest
    570  14.27 550.5134 R046108       C402        44  UNK    9.6  forest
    628  14.61 550.9567 R186917      H2502        55  Fem   10.3  forest
    656  14.69 550.3631 R187398       C602        44 Male    9.8  forest
    657  14.16 549.2287 R046108       C402        44  Fem    9.7  forest
    705  13.86 550.1435 R187902       F102        54  Fem    9.1  forest
    735  13.86 550.9696 R186910      A1202        54  Fem    9.2  forest
    802  13.78 551.3046 R187902       F102        54 Male    9.1  forest
    821  13.33 550.3301 R186917      H2502        55  Fem    9.2  forest
        bill_length bill_depth
    26       10.866      0.619
    159      10.734      0.541
    197      11.698      0.644
    198      10.614      0.539
    210      10.850      0.577
    247      11.233      0.591
    302      10.866      0.646
    338      11.827      0.619
    378      11.644      0.654
    392      11.295      0.644
    437      10.500      0.513
    491      11.801      0.638
    541      11.489      0.598
    567      12.314      0.693
    570      11.403      0.598
    628      11.653      0.625
    656      11.719      0.679
    657      11.337      0.602
    705      11.128      0.595
    735      11.035      0.622
    802      11.049      0.552
    821      10.717      0.555

■

Similar result can be achieved by using the `subset()` function - and
providing logical expressions as function arguments (`BTdata$` can be
omitted).

**EXERCISE 3:** Achieve the same results as in the previous exercise,
but using the `subset()` function, for the first two filterings in
EXCERCISE 2.

**Output**

        tarsus     back     dam fosternest hatchdate  sex weight habitat
    15   16.81 548.3708 R187545      D1002        47 Male   11.4    park
    794  15.60 550.4936 R187155      F2402        47 Male   11.2    park
        bill_length bill_depth
    15       13.399      0.797
    794      12.477      0.696

        tarsus     back     dam fosternest hatchdate  sex weight habitat
    60   14.54 549.1467 R187239       D802        48 Male    9.9    park
    220  14.46 547.3801 R187239       D802        48  Fem    9.8    park
    380  14.46 549.3456 R187239       B202        48  Fem    9.7    park
    395  14.61 548.3846 R187239       B202        48 Male   10.0    park
    583  14.54 548.7014 R187239       B202        48  Fem    9.8    park
        bill_length bill_depth
    60       11.654      0.585
    220      11.561      0.637
    380      11.541      0.653
    395      11.678      0.614
    583      11.639      0.668

■

What is nice about the indexing paradigm, you can use it to do useful
things, e.g., to randomply sample rows of data if needed. To do this,
you will need the `sample()` function, that is able to randomly pick
values from a larger vector, with or without replacement. Have a look at
the function’s help file to understand how it works.

**EXERCISE 4:** Randomly sample 10 rows from the `BTdata` dataset, with
replacement.

**Output**

        tarsus     back     dam fosternest hatchdate  sex weight habitat
    233  14.54 552.0244 R187548       E902        48  Fem    9.9    park
    733  14.24 550.5537 R187562       A602        47 Male    9.9    park
    622  15.07 549.6052 R187914       G602        49  Fem   10.0  forest
    160  14.54 550.4472 R187930      G2202        50 Male   10.1    park
    347  14.24 550.4375 R187552       G502        47 Male    9.4    park
    383  13.93 551.1091 R187931      G2202        49  Fem   10.0    park
    18   14.46 549.7494 R187548       E902        48  Fem    9.6    park
    576  14.61 549.4949 R187824      B1602        53  Fem   10.0  forest
    650  14.84 548.1412 R187552      C2602        47  Fem    9.8    park
    304  15.37 547.9119 R187953       B902        51  UNK   10.5  forest
        bill_length bill_depth
    233      11.590      0.637
    733      11.345      0.722
    622      12.061      0.685
    160      11.592      0.644
    347      11.364      0.633
    383      11.171      0.629
    18       11.512      0.669
    576      11.695      0.656
    650      11.902      0.691
    304      12.282      0.684

■

### Missing values

You should be always cautious when filtering out missing values. Have a
look at this example dataset:

``` r
missingdata <- data.frame(
    x = c(1, 5, NA, 4, 6, NA, NA, NA),
    y = c(NA, 2, 7, 4, 8, 4, 9, 6),
    z = c(1, 2, 3, 4, 5, 6, 7, 8)
)

missingdata
```

       x  y z
    1  1 NA 1
    2  5  2 2
    3 NA  7 3
    4  4  4 4
    5  6  8 5
    6 NA  4 6
    7 NA  9 7
    8 NA  6 8

**EXERCISE 5:** Naively applying the `na.omit()` function can lead to
unexpected data loss. Filter out the missing values from the
`missingdata` dataset using the `na.omit()` function applied to the
whole data. How many rows of observations are left?

**Output**

      x y z
    2 5 2 2
    4 4 4 4
    5 6 8 5

■

**EXERCISE 6:** Now, let’s assume that variable `x` is not of interest
to us. We don;t want to filter out its `NA` values. Filter out the
missing values from the `missingdata` dataset, but only for variables
`y` and `z`. How many rows of observations are left? Hint: you can use
the logical function `is.na()` to check for `NA` values - it is safer
than using `==` in this context.

**Output**

       x y z
    2  5 2 2
    3 NA 7 3
    4  4 4 4
    5  6 8 5
    6 NA 4 6
    7 NA 9 7
    8 NA 6 8

You could also achieve the same result using `subset()`.

## Data wrangling with `tidyverse()`

Manipulating data is an extensive topic, so much that several packages
where created to simplify the process. The most widely used philosophy
comes from the `tidyverse` dialect of R - it is an ecosystem of
functions that provide wrappers to built-in methods and streamline the
data manipulation process. The `dplyr` package is one of the most
important components of the `tidyverse` - it provides a set of functions
that are easy to use and understand.

`dplyr` works through so called *verbs* - functions that perform
specific operations on dataframes. Multiple verbs can e used into larger
“sentences” - *pipelines* - that are executed sequentially. In a
pipeline, the output of one verb is passed to the next one, and so on.
This way, you can perform complex operations on dataframes in a very
readable way. Subsequent verbs are separated by the `%>%` operator.

<div>

> **Verbs in `dplyr`**
>
> - `filter()` - select rows based on conditions
> - `select()` - select columns based on conditions
> - `mutate()` - create new columns based on existing ones
> - `arrange()` - sort rows based on column values
> - `summarise()` - create summary statistics
> - `group_by()` - group data by specific variables

</div>

Before proceeding, make sure you have the `tidyverse` package installed
and loaded.

``` r
# install.packages("tidyverse")
library(tidyverse)
```

We will be working on the `BTdata` dataset, so make sure it is still
loaded.

### `filter()`

**EXERCISE 7:** Using the `filter()` function, display all rows of the
`BTdata` that fulfill the following conditions:

- All males (`sex`) heavier (`weight`) than 11 grams
- Birds that bred in parks (`habitat`) that were mother by females
  R187239 and R187240

**Output**

      tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1  16.81 548.3708 R187545      D1002        47 Male   11.4    park      13.399
    2  15.60 550.4936 R187155      F2402        47 Male   11.2    park      12.477
      bill_depth
    1      0.797
    2      0.696

       tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1   14.77 551.1920 R187932       B502        49 Male    9.9    park      11.828
    2   14.54 549.1467 R187239       D802        48 Male    9.9    park      11.654
    3   14.16 550.7290 R187932       B502        49  Fem    9.5    park      11.276
    4   14.46 547.3801 R187239       D802        48  Fem    9.8    park      11.561
    5   14.08 551.7399 R187932       B502        49 Male   10.0    park      11.247
    6   14.46 549.3456 R187239       B202        48  Fem    9.7    park      11.541
    7   14.61 548.3846 R187239       B202        48 Male   10.0    park      11.678
    8   13.93 552.1593 R187932       D202        49  Fem    9.5    park      11.159
    9   14.46 550.9975 R187932       D202        49  Fem    9.6    park      11.561
    10  14.54 548.7014 R187239       B202        48  Fem    9.8    park      11.639
    11  13.86 552.1625 R187932       D202        49  Fem    9.2    park      11.073
    12  14.01 550.5888 R187932       D202        49  Fem    9.2    park      11.138
    13  14.46 548.6909 R187932       D202        49 Male    9.3    park      11.577
       bill_depth
    1       0.638
    2       0.585
    3       0.620
    4       0.637
    5       0.639
    6       0.653
    7       0.614
    8       0.640
    9       0.648
    10      0.668
    11      0.631
    12      0.618
    13      0.632

■

Note, that in the examples above I used `filter()` as a typical
function. We can however “pipe” the data into the function, in which
case we omit the `data` argument in `filter()`. Try to build the
filtering again using the `%>%` operator.

**Output**

      tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1  16.81 548.3708 R187545      D1002        47 Male   11.4    park      13.399
    2  15.60 550.4936 R187155      F2402        47 Male   11.2    park      12.477
      bill_depth
    1      0.797
    2      0.696

       tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1   14.77 551.1920 R187932       B502        49 Male    9.9    park      11.828
    2   14.54 549.1467 R187239       D802        48 Male    9.9    park      11.654
    3   14.16 550.7290 R187932       B502        49  Fem    9.5    park      11.276
    4   14.46 547.3801 R187239       D802        48  Fem    9.8    park      11.561
    5   14.08 551.7399 R187932       B502        49 Male   10.0    park      11.247
    6   14.46 549.3456 R187239       B202        48  Fem    9.7    park      11.541
    7   14.61 548.3846 R187239       B202        48 Male   10.0    park      11.678
    8   13.93 552.1593 R187932       D202        49  Fem    9.5    park      11.159
    9   14.46 550.9975 R187932       D202        49  Fem    9.6    park      11.561
    10  14.54 548.7014 R187239       B202        48  Fem    9.8    park      11.639
    11  13.86 552.1625 R187932       D202        49  Fem    9.2    park      11.073
    12  14.01 550.5888 R187932       D202        49  Fem    9.2    park      11.138
    13  14.46 548.6909 R187932       D202        49 Male    9.3    park      11.577
       bill_depth
    1       0.638
    2       0.585
    3       0.620
    4       0.637
    5       0.639
    6       0.653
    7       0.614
    8       0.640
    9       0.648
    10      0.668
    11      0.631
    12      0.618
    13      0.632

The pipe operator `%>%` makes it possible to chain several conditions or
other verb operations, one after anotr:

``` r
BTdata %>%
    filter(sex == "Male") %>%
    filter(weight > 11)
```

      tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1  16.81 548.3708 R187545      D1002        47 Male   11.4    park      13.399
    2  15.60 550.4936 R187155      F2402        47 Male   11.2    park      12.477
      bill_depth
    1      0.797
    2      0.696

You also use to save the outpout of your filtering to an object:

``` r
filtered_data <- BTdata %>%
    filter(sex == "Male") %>%
    filter(weight > 11)
```

<div>

> **Multiple conditions with `AND`**
>
> In the `filter()` function, you can join multiple conditions with the
> `&` operator, or simply separating them with commas. Of course, this
> does not apply to the `|` operator, which is used for `OR` conditions.

</div>

### `select()`

The `select()` function is used to select columns of interest from a
dataframe. You can use it to select columns by name, or by their
position in the dataframe. You can also use the `-` operator to exclude
columns from the selection.

**EXERCISE 8:** Using the `select()` function, display only the columns
`sex`, `weight`, and `tarsus` from the `BTdata` dataset. Join this
selection with filtering that displays only individuals heavier than
10.5 grams.

**Output**

        sex weight tarsus
    1  Male   11.4  16.81
    2  Male   10.6  15.30
    3  Male   10.6  15.14
    4  Male   10.6  15.37
    5  Male   10.6  15.37
    6  Male   10.6  15.45
    7  Male   10.6  15.22
    8  Male   10.6  15.45
    9  Male   10.7  15.30
    10 Male   10.6  15.30
    11 Male   10.7  15.37
    12 Male   10.8  15.98
    13 Male   11.2  15.60
    14 Male   10.8  15.45

■

Using of `select()` is made easier by additional helpers that allow for
selecting columns matching certain name patterns, e.g., `starts_with()`,
`ends_with()`, `contains()`, `matches()`, `num_range()`, `one_of()`,
`everything()`.

**EXERCISE 9:** In the previous example, instead of the selected
columns, pick only those that start with `bill`.

**Output**

       bill_length bill_depth
    1       13.399      0.797
    2       12.216      0.671
    3       12.116      0.630
    4       12.300      0.620
    5       12.300      0.685
    6       12.324      0.706
    7       12.230      0.646
    8       12.424      0.675
    9       12.240      0.658
    10      12.308      0.697
    11      12.233      0.665
    12      12.828      0.690
    13      12.477      0.696
    14      12.389      0.728

■

### `arrange()`

The `arrange()` function is used to sort rows of a dataframe based on
the values of a specific column. You can sort in ascending or descending
order.

**EXERCISE 10:** Using the `arrange()` function, display the `BTdata`
dataset sorted by the `weight` column in descending order, selecting
only cases belonging to mothers (`dam`): R187239, R187547, and R187292.
Tip: yo will need to use the `desc()` helper.

**Output**

       tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1   15.37 547.1042 R187547       B202        48 Male   10.2  forest      12.314
    2   15.64 550.5361 R187292      E1802        47 Male   10.2  forest      12.471
    3   15.22 549.8951 R187239       B202        48  Fem   10.1  forest      12.192
    4   14.61 550.8438 R187547       D802        48  Fem   10.1    park      11.626
    5   14.92 548.6009 R187292      E1802        47  Fem   10.1  forest      11.931
    6   14.61 548.7633 R187239       D802        48 Male   10.0  forest      11.689
    7   14.77 547.1794 R187292      E1602        47  Fem   10.0  forest      11.850
    8   14.46 549.9420 R187547       B202        48  Fem   10.0    park      11.570
    9   15.07 548.1566 R187292      E1602        47 Male   10.0    park      12.033
    10  14.61 548.3846 R187239       B202        48 Male   10.0    park      11.678
    11  14.54 549.1467 R187239       D802        48 Male    9.9    park      11.654
    12  14.69 548.1016 R187292      E1602        47 Male    9.9  forest      11.790
    13  14.46 548.5005 R187547       B202        48  Fem    9.9  forest      11.622
    14  14.46 549.7182 R187239       D802        48  Fem    9.9  forest      11.591
    15  14.46 547.3801 R187239       D802        48  Fem    9.8    park      11.561
    16  14.61 549.1628 R187292      E1602        47 Male    9.8    park      11.687
    17  15.07 549.0320 R187239       B202        48 Male    9.8  forest      12.017
    18  14.54 548.7014 R187239       B202        48  Fem    9.8    park      11.639
    19  14.77 551.0839 R187239       B202        48  Fem    9.8  forest      11.814
    20  14.61 548.9334 R187547       B202        48  Fem    9.7  forest      11.687
    21  14.46 549.3456 R187239       B202        48  Fem    9.7    park      11.541
    22  14.54 548.9919 R187547       D802        48  Fem    9.7    park      11.648
    23  14.24 549.6942 R187547       D802        48  Fem    9.4  forest      11.422
    24  14.46 550.7150 R187239       B202        48  Fem    9.3  forest      11.587
       bill_depth
    1       0.662
    2       0.709
    3       0.610
    4       0.708
    5       0.693
    6       0.685
    7       0.694
    8       0.612
    9       0.680
    10      0.614
    11      0.585
    12      0.629
    13      0.648
    14      0.642
    15      0.637
    16      0.661
    17      0.661
    18      0.668
    19      0.727
    20      0.674
    21      0.653
    22      0.569
    23      0.597
    24      0.633

■

### `mutate()`

The `mutate()` function is used to create new columns based on existing
ones. You can use it to perform calculations on columns, or to create
new columns based on logical conditions.

**EXERCISE 11:** Using the `mutate()` function, create a new column in
the `BTdata` dataset that will contain the ratio of `weight` to `tarsus`
length. Name this column `wt_tarsus_ratio`.

**Output**

      tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1  13.55 551.3757 R187557      F2102        47  Fem    8.9    park      10.885
    2  15.07 549.0884 R187559      F1902        47 Male   10.5  forest      12.056
    3  14.99 550.1739 R187568       A602        47 Male    9.9  forest      12.000
    4  14.69 550.3067 R187518      A1302        45 Male    9.7  forest      11.733
    5  14.46 549.6392 R187528      A2602        45  Fem    9.7  forest      11.565
    6  13.93 551.8693 R187945      C2302        49  Fem    9.3  forest      11.165
      bill_depth wt_tarsus_ratio
    1      0.597       0.6568266
    2      0.682       0.6967485
    3      0.673       0.6604403
    4      0.639       0.6603131
    5      0.631       0.6708160
    6      0.626       0.6676238

■

**EXERCISE 12:** Using the `mutate()` function and data filtering create
a new dataframe with birds that have exceptionally long and narrow bills
(i.e., that have the bill length to depth ratio above 20). Name this
dataframe `long_bills`. Display the first rows of this new dataset.

**Output**

      tarsus     back     dam fosternest hatchdate  sex weight habitat bill_length
    1  15.22 551.8520 R187590       D202        49 Male    9.7    park      12.150
    2  15.30 550.7461 R187569       A502        48 Male   10.3  forest      12.214
    3  14.54 549.8902 R187918      G1302        49  Fem    9.9    park      11.612
    4  14.16 550.2273 R187931      E1902        49  Fem    9.7    park      11.324
    5  14.08 552.2924 R187594       E302        49  Fem    9.4  forest      11.308
    6  14.54 550.1580 R187517       C602        44  Fem    9.8    park      11.620
      bill_depth wt_tarsus_ratio bill_ratio
    1      0.607       0.6373193   20.01647
    2      0.591       0.6732026   20.66667
    3      0.575       0.6808803   20.19478
    4      0.542       0.6850282   20.89299
    5      0.536       0.6676136   21.09701
    6      0.573       0.6740028   20.27923

### `summarise()` and `group_by()`

The `summarise()` function is used to create summary statistics for
groups of data. The `group_by()` function is used to group data by
specific variables. On its own, the `summarise()` is not veru useful, it
collapses the dataset to few (even single) rows.

``` r
BTdata %>%
    summarise(mean_weight = mean(weight),
        sd_weight = sd(weight),
        n = n()
    )
```

      mean_weight sd_weight   n
    1    9.789372  0.377426 828

Note: I’ve used the helper function `n()` which can be applied to return
the number of rows in a given set of data being summarized.

However, we can group the data by ceretain variables. On its own,
groupin does not alter the data structure - but it adds an attribute,
that can be used by `summarise()` to perform summaries in groups instead
of the whole dataset.  

**EXERCISE 13:** Using the `group_by()` and `summarise()` functions,
calculate the mean and SD of `weight` for each breeding female (`dam`)
in the `BTdata` dataset. Also, add another variable displaying the
number of cases for each female. At the end, display only the first 6
rows of the summary.

**Output**

    # A tibble: 6 × 4
      dam     mean_weight sd_weight     n
      <fct>         <dbl>     <dbl> <int>
    1 Fem2           9.66     0.230     5
    2 Fem20          9.8      0.504    11
    3 Fem3           9.72     0.294    10
    4 Fem5           9.85     0.252     4
    5 K983388        9.76     0.363    10
    6 P322402        9.71     0.270     8

Do you see anything “odd” in this dataframe rendering in your console
(in the way it is displayed)?

## Putting it all together - a simple wrangling project

We will now see the different data wrangling possibilities in action,
using a real-life data example. The data comes in two files: `bt_mb.csv`
contains microbiome data of blue tit individuals (their IDs are in the
first column); for each individual, we have a list of bacterial taxa
(OTUs) listed as subsequent columns - in each, the value indicates how
many reads (occurences) of a given taxon were identified in the sample.
Second file (`bt_meta.csv`) contains additional data on each individual
(their sex, habitat type, year of study, data of sequencing, age and
individual ID). the data should be prepared in the following way:

- microbiome data should be changed from wide format to long format
  (where wthere is a column for sample ID, a column for bacterial taxon,
  and the columns with 0 or 1 indicating the presence/absence of each
  taxon); thios database sholud contain only cases, where the number of
  readswas greater than 2
- this new table should be summarised by counting the number of present
  baterial taxa for each sample ID
- finally, summary data should be merged with the individual meta-data:
  sex, habitat, bird ID and age

<div>

> **Long vs. wide format**
>
> Wide format data contains values belonging to one variable in several
> olumn categories. Let’s create an example of such data:
>
> ``` r
> toydata <- data.frame(
>     ID = c("A", "B", "C", "D", "E"),
>     V1 = c(1, 0, 1, 0, 1),
>     V2 = c(0, 1, 1, 0, 0),
>     V3 = c(1, 1, 0, 1, 0)
> )
>
> toydata
> ```
>
>       ID V1 V2 V3
>     1  A  1  0  1
>     2  B  0  1  1
>     3  C  1  1  0
>     4  D  0  0  1
>     5  E  1  0  0
>
> We want the data in a format, where each row contains a single
> observation, and each variable is in a separate column. Here, we would
> need a column for `ID` and a column for `V` containing the `V1-V3`
> identifiers, plus a `value` column containing the values of the `V.`
> variables. The `dplyr` functions allow us to transform between the two
> types of data display easily:
>
> ``` r
> toydata_long <- toydata %>%
>     pivot_longer(cols = -ID,
>         names_to = "V",
>         values_to = "value"
>     )
>
> # alternative formulation listing columns explicitly
>
> toydata_long <- toydata %>%
>     pivot_longer(cols = c("V1", "V2", "V3"),
>         names_to = "V",
>         values_to = "value"
>     )
>
> # one can also use starts_with(V)
>
> toydata_long
> ```
>
>     # A tibble: 15 × 3
>        ID    V     value
>        <chr> <chr> <dbl>
>      1 A     V1        1
>      2 A     V2        0
>      3 A     V3        1
>      4 B     V1        0
>      5 B     V2        1
>      6 B     V3        1
>      7 C     V1        1
>      8 C     V2        1
>      9 C     V3        0
>     10 D     V1        0
>     11 D     V2        0
>     12 D     V3        1
>     13 E     V1        1
>     14 E     V2        0
>     15 E     V3        0
>
> Of course, there’s an analogous function `pivot_wider()` that does the
> opposite operation. However, the longer format is usually much more
> useful and recommended.

</div>
