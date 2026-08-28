# Recreating the 9 Week Moving Average of Stream Ion Concentrations in Bisley, Puerto Rico
This repository contains all the code useed to recreate the analysis figure 3 of the 9-week moving average from the Schaefer et al. (2000) study of ion concentrations in Bisley, Puerto Rico stream, before and after Hurricane Hugo. 

# Data Access

Raw data from the Schaefer et al. (2000) study was obtained from the Environmental Data Initiative Data Portal.
<https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458>

# Data Organization
The data and code for this analysis is organized as follows

- data/ : four raw data files downloaded from the Environmental Data Initiative data portal
    "QuebradaCuenca1-Bisley.csv"
    "QuebradaCuenca2-Bisley.csv"
    "QuebradaCuenca3-Bisley.csv"
    "RioMameyesPuenteRoto.csv"
- output/ : The data file that was processed and formatted in tidy form
- R/ : code for moving average function
- scratch/ : drafts of project codes
- 1_clean_data.R : code for reading in raw data, applying moving average function, and formating to tidy format

# Data Cleaning

In this repository is the data and code to process and visualize the data for potassium, nitrate, magnesium, calcium, and ammonium from four stream sample sites between 1988 and 1994. 

These codes are used to: 

- Join the four dataframes.
- Clean the data to only include the columns for Sample Date, Sample Site, and the five ions of interest.
- Creating a tibble with the columns for 9-week window and ions of interest.
- Calculating the 9-week moving average and inserting into the tibble.
- Mutating the tibble into tidy form for visualization
- Creating the graph to visualize the 9-week moving average for the four stream sample sites.


# References
McDowell, William H., and USDA Forest Service. International Institute Of Tropical Forestry (IITF). 2024. “Chemistry of Stream Water from the Luquillo Mountains.” Environmental Data Initiative. https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458.

Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” Journal of Tropical Ecology 16 (2): 189–207. https://doi.org/10.1017/s0266467400001358.
