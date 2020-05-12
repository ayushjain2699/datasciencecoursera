The analysis script produces a tidy data set of the means of the time domain signals containing mean
and standard deviation.

This script initially reads the data and produces a data frame seperately for both the test and the training data sets.
*Note* These data sets only contains coulumns with either mean or std in it.

The column names of these data sets are also changed as per the convenience

Next these two data sets are combined to form a single large data set.

The Activity column is then converted to be a factor variable with labels defined in the codebook.
Then the coumn nams are changes as per the codebook

Then a new table is created by grouping the so formed table by subject and activity and summarizing the by coulumn means.