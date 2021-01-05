# Overview
The program takes an individual real number (chosen by the user) and calculates the numerical second 
derivative of f(x)= x*sin(x) using both the Symmetric Euler 3-point and 
Euler 5-point approximations to the derivative given a specified h_step.

The program also calculates the analytical second derivative for f(x) and using Jupyter and Python perfoms an error comparison between the approximated calculations and the analytical result. 


# Compilation Instructions

Compilation is all done using the makefile in the repository. Type "make" into your command line to compile the files.

Initially sets dervitives as the executable name.
- Then creates the types object file.
- Then creates the analytic_functions object file using the types object file.
- Then creates the euler_formulas object file using the types, and analytic_functions object files.
- Then creates the read_write object file using the types, analytic_functions, and euler_formulas object files.
- Then creates the main object file using the types, and read_write object files.


# Usage Instructions

Once you have compiled everything execute the program (./derivatives)
The program will prompt you to type a real number(x) to calculate f''(x) = x*sin(x).
It then will write the results of the program into a results.dat file. 
Once created you will be able to run the Jupyter file on this dataset. 

# Expected Behavior

Once you have typed your value in, it then will perform calculation and write the results of the program into a results.dat file.
The file should have 4 columns.
- h_step: This column will contain each individual value of h at each step of the program.
- d2_analytic: This column will contain the anlytic derivative for each row (all rows contain the same value)
- d2_num3: This column will contain the value of the numerical second derivative using the 3-point method for each h_step
- d2_num5: This column will contain the value of the numerical second derivative using the 5-point method for each h_step

The expected behavior when running the Jupyter file. 
The expected slope of the error, between the analytical result and the numerical result should be as follows.
- 3-point method ≈ 2
- 5-point method ≈ 4


```python

```
