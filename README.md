# READ ME

This folder contains all the materials used for the ASER panel data analysis. Below is a summary of the contents:

## Files and Folders

1. **Dev_paper_final.do**
   - The final Stata do-file containing all the code used for data analysis, cleaning, and regression.

2. **ASER_Panel_Analysis_Ready.dta**
   - The final compiled and cleaned dataset used for all analyses.

3. **ASER RAW** *(folder)*
   - ASER HH datasets: Contains the raw ASER data at the household (HH) level.
   - ASER HH codebooks: Includes codebooks of data for each year
   - ASER HH other details: other documentation related to the raw datasets.

4. **Data Compiling Code** *(folder)*
   - Contains the Python scripts used to compile and clean the ASER data:
     - Aser data compiling.ipynb: Compiles all the raw ASER datasets into a single .dta file.
     - ASER_Column_Mapping.xlsx: Column mapping Excel generated to check and compare variables of different years
     - ASER_compiled_datacleaning.ipynb: Cleans and standardises district names within the compiled dataset.
