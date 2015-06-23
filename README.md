#### Please cite Arman Oganisian @ StableMarkets when sharing ####
Files support The following StableMarkets posts:
- https://stablemarkets.wordpress.com/2015/06/22/stop-and-frisk-blacks-stopped-3-6-times-more-than-whites-over-10-years
- https://stablemarkets.wordpress.com/2015/06/23/stop-and-frisk-spatial-analysis-of-racial-discrepancies/



#### Introduction: ####
The files clean and analyze NYC's publicly available stop and frisk data.

Raw Data:
Raw data is located at the URL below. There is one CSV file per year.
http://www.nyc.gov/html/nypd/html/analysis_and_planning/stop_question_and_frisk_report.shtml

#### Data Dictionary/Codebook: ####
In the above URL, click "SQF File Documentation Zip (all years)".

#### Folder Desciptions: ####
- Code
  - 1.0 imports the raw data from the URL, subsets to relevant variables, and saves a stacked (all years) version.
  - 2.0 brings in the stacked dataset produced by 1.0 and cleans the data. Most impotantly, it cleans the date variable, which is formatted inconsistently across years. It also converts the coordinates of the stop locations. In the raw data, the coordinates are given in US State Plane format (see code for details). These are converted to standard long/lat coordinates using the rgdal package. These coordinates are then used to map stops with ggmap. Note that coordinates are not located for every year. Only for years 2004 and 2007-2014. It produces two data sets: "full_stop_frisk_clean.Rdata" and "full_stop_frisk_clean_w_coords.Rdata". The first is used in 3.0 for summary statistics and the latter is used in 4.0 for the spatial analysis. This code also cleans the age variable since there are some absurdly high and low values.
  - 3.0 calculates the basic summary statistics presented in the first StableMarkets post.
  - 4.0 conducts the spatial analysis using 
- Data
  - Contains "full_stop_frisk_clean.Rdata" and "full_stop_frisk_clean_w_coords.Rdata", which are the outputs of code 1.0. The former contains clean data used to calculate descriptive statistics. The latter contains cleaned and converted longitude/latitude coordinates of stop locations, used for the spatial analysis post.
- Output
  -  Contains all visualizations found in both StableMarkets posts
