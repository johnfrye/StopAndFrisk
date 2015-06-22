# StopAndFrisk
Files support StableMarkets post here:

The files clean and analyze NYC's publicly available stop and frisk data (see 1.0 code for URL to data).
1.0 Imports the data and subets to relevant variables. The code also contains URLs to raw data and data dictionary.

Run 1.0 to import that data from the web and replace the file path in setwd() to the path where you want the R data.

Run 2.0 to clean selected variables. Particularly interested fields include "xcoord" and "ycoord", 
which are the coordinates for the stop location. However, these don't seem to be accurate. If anyone can make sense
out of these fields, it would be extremely useful. We could map the location of the stops over time.

Run 3.0 to produce the charts in the StableMarkets post.
