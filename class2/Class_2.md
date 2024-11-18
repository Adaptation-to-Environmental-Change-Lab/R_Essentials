Class 2 - data types, daa loading, data manipulation
================
Szymon Drobniak
11/18/24

**In the below instructions…**

**EXERCISE 1:** are bits of code to execute/practice pieces to do, often
with only hints on how to perform them.

**Output** indicates the typical output you should expect from a given
instruction.

## Data

We will work on a simple dataset on cholesterol levels from patients.
The data presents cholesterol concentrations in plasma in patients
before diet, and after 4 & 8 weeks of diet containing one of two types
of margarine. The age group of patients is also indicated. Data can be
downloaded here:
https://raw.githubusercontent.com/wbabik/Practical_computing/teaching/Class_10/data/Cholesterol_Age_R.csv

``` r
data_chol <- read.table('https://raw.githubusercontent.com/wbabik/Practical_computing/teaching/Class_10/data/Cholesterol_Age_R.csv',
                       sep = ';', header = T,
                       stringsAsFactors = T)

head(data_chol)
```

      ID Before After4weeks After8weeks Margarine AgeGroup
    1  1   6.42        5.83        5.75         B    Young
    2  2   6.76        6.20        6.13         A    Young
    3  3   6.56        5.83        5.71         B    Young
    4  4   4.80        4.27        4.15         A    Young
    5  5   8.43        7.71        7.67         B    Young
    6  6   7.49        7.12        7.05         A   Middle

``` r
summary(data_chol)
```

           ID            Before       After4weeks     After8weeks    Margarine
     Min.   : 1.00   Min.   :3.910   Min.   :3.700   Min.   :3.660   A:9      
     1st Qu.: 5.25   1st Qu.:5.740   1st Qu.:5.175   1st Qu.:5.210   B:9      
     Median : 9.50   Median :6.500   Median :5.830   Median :5.730            
     Mean   : 9.50   Mean   :6.408   Mean   :5.842   Mean   :5.779            
     3rd Qu.:13.75   3rd Qu.:7.218   3rd Qu.:6.730   3rd Qu.:6.688            
     Max.   :18.00   Max.   :8.430   Max.   :7.710   Max.   :7.670            
       AgeGroup
     Middle:6  
     Old   :7  
     Young :5  
               
               
               
