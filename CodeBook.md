# Getting and Cleaning Data Code book 

`GCDC_project.R` file is the R script.

## Identifier names <a name="Identifier names"></a>

`Person_ID`   Is the ID of the test person (1 to 30).
`Activity_ID` Is the ID of the activity done bytest person.(1 to 6).

	- `WALKING`: person was walking
	- `WALKING_UPSTAIRS`: person was walking upstairs
	- `WALKING_DOWNSTAIRS`: person was walking downstairs
	- `SITTING`: person was sitting
	- `STANDING`: person was standing
	- `LAYING`: person was laying

## Output File <a name="Output File"></a>

The `tidy_data.txt` data file is a text file, containing space-separated values.

### Measurements <a name="Measurements"></a>

#### Time-domain signals
- `timeDomainBodyAccelerometerMean` in XYZ directions
- `timeDomainBodyAccelerometerStandardDeviation` in XYZ directions
- `timeDomainGravityAccelerometerMeanZ` in XYZ directions
- `timeDomainGravityAccelerometerStandardDeviationZ` in XYZ directions
- `timeDomainBodyAccelerometerJerkMeanZ` in XYZ directions
- `timeDomainBodyAccelerometerJerkStandardDeviationZ` in XYZ directions
- `timeDomainBodyGyroscopeMeanZ` in XYZ directions
- `timeDomainBodyGyroscopeStandardDeviationZ` in XYZ directions
- `timeDomainBodyGyroscopeJerkMeanZ` in XYZ directions
- `timeDomainBodyGyroscopeJerkStandardDeviationZ` in XYZ directions
- `timeDomainBodyAccelerometerMagnitudeMean`
- `timeDomainBodyAccelerometerMagnitudeStandardDeviation`
- `timeDomainGravityAccelerometerMagnitudeMean`
- `timeDomainGravityAccelerometerMagnitudeStandardDeviation`
- `timeDomainBodyAccelerometerJerkMagnitudeMean`
- `timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation`
- `timeDomainBodyGyroscopeMagnitudeMean`
- `timeDomainBodyGyroscopeMagnitudeStandardDeviation`
- `timeDomainBodyGyroscopeJerkMagnitudeMean`
- `timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation`
- `frequencyDomainBodyAccelerometerMeanZ`
- `frequencyDomainBodyAccelerometerStandardDeviationZ` in XYZ directions
- `frequencyDomainBodyAccelerometerMeanFrequencyZ` in XYZ directions
- `frequencyDomainBodyAccelerometerJerkMeanZ` in XYZ directions
- `frequencyDomainBodyAccelerometerJerkStandardDeviationZ` in XYZ directions
- `frequencyDomainBodyAccelerometerJerkMeanFrequencyZ` in XYZ directions
- `frequencyDomainBodyGyroscopeMeanZ` in XYZ directions
- `frequencyDomainBodyGyroscopeStandardDeviationZ` in XYZ directions
- `frequencyDomainBodyGyroscopeMeanFrequencyZ` in XYZ directions
- `frequencyDomainBodyAccelerometerMagnitudeMean`
- `frequencyDomainBodyAccelerometerMagnitudeStandardDeviation`
- `frequencyDomainBodyAccelerometerMagnitudeMeanFrequency`
- `frequencyDomainBodyAccelerometerJerkMagnitudeMean`
- `frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation`
- `frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency`
- `frequencyDomainBodyGyroscopeMagnitudeMean`
- `frequencyDomainBodyGyroscopeMagnitudeStandardDeviation`
- `frequencyDomainBodyGyroscopeMagnitudeMeanFrequency`
- `frequencyDomainBodyGyroscopeJerkMagnitudeMean`
- `frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation`
- `frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency`

## Operations carried out <a name="Operations carried out"></a>
The following transformations were applied to the source data:

1. Merge training and test sets.
2. Mean and standard deviation measurements picked up
3. Correct activity identifiers.
4. From the obtained data set,, obtain a second one with the average of each variable for each Activity_ID and each Person_ID.