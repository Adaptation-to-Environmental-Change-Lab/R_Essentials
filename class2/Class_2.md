Class 2 - data types, daa loading, data manipulation
================
Szymon Drobniak
11/18/24

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

**EXERCISE 1:** are bits of code to execute/practice pieces to do, often
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
