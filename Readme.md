OPER 782 - Analytic Proposal Review \#1
================
Matthew Small
17 January 18

Section 1
=========

Provide a short name (either a single word or an acronym) for the analytic you plan to develop.
-----------------------------------------------------------------------------------------------

Boots

Provide a brief title (1-2 sentences) describing - at the 50,000 foot level - what your analytic does. Your title should be short and to the point, but should also be clear to an end user.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The analytic takes Defense Manpower Data Center(DMDC) data on troop numbers abroad for active duty military personnel and generates forecasts for the selected country or countries, provides accuracy statistics, a visual depiction of the forecasts including actual observed values, and projected troop numbers for the year or years of interest.

Provide a description (2-3 paragraphs) of why this analytic data product will be useful for an end-user.
--------------------------------------------------------------------------------------------------------

This analytic will be utilized by USTRANSCOM to better predict USTRANSCOM workload demands in coming years. The features which my analytic will perform when complete are to import the data, tidy the data in the format popularized by Wickham, group the data by country, branch, order the data by year, convert the data to a zoo/time series object, implement forecast functions, plot the forecasts, provide accuracy metrics, provide forecast values, and confidence intervals for years of interest. The typical end-users for whom this analytic is being developed are analysts at USTRANSCOM/JDPAC. Important knowledge/skills/abilities an end-user must have in order to utilize the analytic is a knowledge of forecasting techniques such as ARIMA, exponential smoothing, and possibly some dynamic regression models; however, the analytic will provide a basic description of what the model is and its key parameters and terms.

The analytic implements autoregressive integrated moving average (ARIMA) forecasting models, simple exponential smoothing models, Holt models, and forecasting accuracy metrics.
This analytic is built upon packages: *forecast, ggplot2 and tidyverse*.

How will end-users access your analytic data product?
-----------------------------------------------------

End-users will access the data analytic product via the internet. The analytic will be available via the github repository and potentially on the CRAN network.

Are there any security concerns that need to be addressed?
----------------------------------------------------------

All data are available from the unclassified, open-source database maintained by DMDC. There are no security concerns that need to be addressed.

Are there any appearance/design constraints that your analytic must adhere to?
------------------------------------------------------------------------------

There are no appearance/design constraints that the analytic must adhere to, but the goal is to provide a clean design with easy to use graphical user interface.

Section 2
=========

The following table gives several features which will be addressed in the analytic. Each row in the table represents a column. Information pertaining to the following points are also provided in each of the columns:

-   2.1.A. The description of the feature
-   2.1.B. A rank ordered priority number for this feature
-   2.1.C. The status of the feature – should be either ‘finished’, ‘in-work’, or ‘not started’
-   2.1.D. What value will this feature provide to an end-user?
-   2.1.E. What input(s) must be provided by end-user to perform this feature?
-   2.1.F. What output(s) will this feature return to the end-user?
-   2.1.G. What do you envision an end-user will do with the output of this feature?
-   2.1.H. Is there sufficient time to deliver this feature prior to the deadline?
-   2.1.I. Does this feature need to be included in the current version of your analytic or can it be pushed to a future update?

A rank of 1 is deemed most important with higher values being of lesser import.

<table style="width:100%;">
<colgroup>
<col width="2%" />
<col width="17%" />
<col width="0%" />
<col width="1%" />
<col width="25%" />
<col width="15%" />
<col width="31%" />
<col width="2%" />
<col width="2%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
<th>Rank</th>
<th>Status</th>
<th>Value</th>
<th>Inputs/Outputs</th>
<th>Utilization</th>
<th>Sufficient Time?</th>
<th>Current or Future?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Download the Data</td>
<td>This feature downloads the data off of the DMDC website</td>
<td>10</td>
<td>Not Started</td>
<td>This makes the user not have to spend as much time having to download the data.</td>
<td>Inputs: PDF and/or Microsoft Excel Files Containing Troop ValuesOutputs: R Data Frame Containing Troop Data</td>
<td>Get new DMDC Data</td>
<td>Maybe</td>
<td>Future</td>
</tr>
<tr class="even">
<td>Tidy the Data</td>
<td>This feature tidys the data such that each variable is represented by a column and each observation is represented by a row</td>
<td>7</td>
<td>In Progress</td>
<td>This makes the data easy to work with since it is in the format popularized by Wickham</td>
<td>Inputs: R Data Frame in Non-Tidy FormatOutputs: R Data Frame in Tidy Format</td>
<td>Organizes the data in a convenient format</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="odd">
<td>Group Data</td>
<td>This feature groups the data by country and military branch.</td>
<td>6</td>
<td>In Progress</td>
<td>This is valuable in that it allows for forecasts to be disaggregated for future use of forecasting in hopes that disaggregation will improve forecast accuracy.</td>
<td>Inputs: R Data Frame in Tidy FormatOutputs: R Data Frame grouped by country and branch.</td>
<td>Allows for disaggregated forecasting</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="even">
<td>Order Data</td>
<td>This feature orders the data in chronological order</td>
<td>4</td>
<td>In Progress</td>
<td>Ordering the data is necessary for forecasting the data.</td>
<td>Inputs: R Data FrameOutputs: R Data Frame</td>
<td>Necessary for the end product</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="odd">
<td>Fill Missing Data</td>
<td>This feature fills the missing observations by interpolating between the nearest two points.</td>
<td>8</td>
<td>In Progress</td>
<td>Filling missing data will allow for forecasting functions to work properly and clearly explains how missing data is being handled.</td>
<td>Inputs: R Data FrameOutputs: R Data Frame</td>
<td>Necessary for the end product</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="even">
<td>Convert Data</td>
<td>This feature converts the ordered data into a time series object.</td>
<td>5</td>
<td>In Progress</td>
<td>Converting the data series into a Zoo object in R allows forecasting functions to operate.</td>
<td>Inputs: R Data FrameOutputs:Zoo Object</td>
<td>Necessary for the end product</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="odd">
<td>Forecast</td>
<td>This feature takes the converted data and applies forecasting functions to it.</td>
<td>1</td>
<td>In Progress</td>
<td>Forecasting the data utilizing Rob Hyndman's forecast package allows for exponential smoothing, ARIMA, and several other forecasting functions to be implemented.</td>
<td>Inputs: Zoo ObjectOutputs: Forecast Object</td>
<td>Allows the end-user to generate their desired forecast models.</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="even">
<td>Plot Forecasts</td>
<td>This function takes the forecast and generates plots.</td>
<td>3</td>
<td>In Progress</td>
<td>Plotting the functions allows the end-user to have a visual depiction of how well the forecasting is predicting new observations.</td>
<td>Inputs: Forecast ObjectOutputs: Plot (graphical object)</td>
<td>Allows for user to visualize the forecasts</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="odd">
<td>Assess Accuracy</td>
<td>This function assesses the accuracy of the forecasts.</td>
<td>9</td>
<td>In Progress</td>
<td>Assessing the accuracy of the forecasts indicates which forecasts are performing well and which are performing poorly. This will allow the user to select the best performing model.</td>
<td>Inputs: Forecast ObjectOutputs: List of forecast accuracy metrics</td>
<td>The output will enable the user to compare forecasts accuracies in order to determine which forecast is fitting the data best. This can then be compared to the parsimony of the model to determine which one is most efficient.</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="even">
<td>Provide Values</td>
<td>This function provides the actual values for the forecast for use in USTRANSCOM Models</td>
<td>2</td>
<td>Not Started</td>
<td>By providing the forecasted values, this analytic will enable USTRANSCOM to feed US troop data into its workload demand forecasts.</td>
<td>Inputs: Forecast ObjectOutputs: Vector</td>
<td>Providing values is necessary so that USTRANSCOM can incorporate forecasted values into its workload demand forecast models.</td>
<td>Yes</td>
<td>Current</td>
</tr>
</tbody>
</table>
