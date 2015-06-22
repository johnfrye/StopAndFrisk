# StopAndFrisk
Files support StableMarkets post here: https://stablemarkets.wordpress.com/2015/06/22/stop-and-frisk-blacks-stopped-3-6-times-more-than-whites-over-10-years

The files clean and analyze NYC's publicly available stop and frisk data (see 1.0 code for URL to data).
1.0 Imports the data and subets to relevant variables. The code also contains URLs to raw data and data dictionary.

Run 1.0 to import that data from the web and replace the file path in setwd() to the path where you want the R data.

Run 2.0 to clean selected variables. Particularly interested fields include "xcoord" and "ycoord", 
which are the coordinates for the stop location. However, these don't seem to be accurate. If anyone can make sense
out of these fields, it would be extremely useful. We could map the location of the stops over time.
- Update: the coordinates are given in US state Plane Coordinate Systems for New York 3104, Long Island Zone (1983 Survey feet). This needs to be converted to longitude and lattitude coordinates before plotting in R.

Run 3.0 to produce the charts in the StableMarkets post.


