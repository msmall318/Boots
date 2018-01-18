OPER 782 - Analytic Proposal Review \#1
================
Matthew Small
17 January 18

Section 1
=========

1.  Provide a short name (either a single word or an acronym) for the analytic you plan to develop.

Boots

1.  Provide a brief title (1-2 sentences) describing - at the 50,000 foot level - what your analytic does. Your title should be short and to the point, but should also be clear to an end user. The analytic takes Defense Manpower Data Center(DMDC) data on troop numbers abroad for active duty military personnel and generates forecasts for the selected country or countries, provides accuracy statistics, a visual depiction of the forecasts including actual observed values, and projected troop numbers for the year or years of interest.

2.  Provide a description (2-3 paragraphs) of why this analytic data product will be useful for an end-user. This description should address the following points (where applicable).

This analytic will be utilized by USTRANSCOM to better predict USTRANSCOM workload demands in coming years. The features which my analytic will perform when complete are to import the data, tidy the data in the format popularized by Wickham, group the data by country, branch, order the data by year, convert the data to a zoo/time series object, implement forecast functions, plot the forecasts, provide accuracy metrics, provide forecast values, and confidence intervals for years of interest. The typical end-users for whom this analytic is being developed are analysts at USTRANSCOM/JDPAC. Important knowledge/skills/abilities an end-user must have in order to utilize the analytic is a knowledge of forecasting techniques such as ARIMA, exponential smoothing, and possibly some dynamic regression models; however, the analytic will provide a basic description of what the model is and its key parameters and terms.

The analytic implements autoregressive integrated moving average (ARIMA) forecasting models, simple exponential smoothing models, Holt models, and forecasting accuracy metrics. This analytic is built upon packages: *forecast, ggplot2 and tidyverse*. End-users will access the data analytic product via the internet. All data are available from the unclassified, open-source database maintained by DMDC. There are no security concerns that need to be addressed. There are no appearance/design constraints that the analytic must adhere to, but the goal is to provide a clean design with easy to use graphical user interface.

Section 2
=========

<table style="width:100%;">
<colgroup>
<col width="5%" />
<col width="37%" />
<col width="2%" />
<col width="4%" />
<col width="2%" />
<col width="17%" />
<col width="13%" />
<col width="4%" />
<col width="5%" />
<col width="6%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Description</th>
<th>Rank</th>
<th>Status</th>
<th>Value</th>
<th>Inputs</th>
<th>Outputs</th>
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
<td>1</td>
<td>PDF and/or Microsoft Excel Files Containing Troop Values</td>
<td>R Data Frame Containing Troop Data</td>
<td>Low</td>
<td>Maybe</td>
<td>Future</td>
</tr>
<tr class="even">
<td>Tidy the Data</td>
<td>This feature tidys the data such that each variable is represented by a column and each observation is represented by a row</td>
<td>7</td>
<td>In Progress</td>
<td>2</td>
<td>R Data Frame in Non-Tidy Format</td>
<td>R Data Frame in Tidy Format</td>
<td>Medium</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="odd">
<td>Group Data</td>
<td>This feature groups the data by country and military branch.</td>
<td>6</td>
<td>In Progress</td>
<td>3</td>
<td>R Data Frame in Tidy Format</td>
<td>R Data Frame grouped by country and branch.</td>
<td>Medium</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="even">
<td>Order Data</td>
<td>This feature orders the data in chronological order</td>
<td>4</td>
<td>In Progress</td>
<td>4</td>
<td>R Data Frame</td>
<td>R Data</td>
<td>Medium</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="odd">
<td>Fill Missing Data</td>
<td>This feature fills the missing observations by interpolating between the nearest two points.</td>
<td>8</td>
<td>In Progress</td>
<td>4</td>
<td>R Data Frame</td>
<td>R Data Frame</td>
<td>Medium</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="even">
<td>Convert Data</td>
<td>This feature converts the ordered data into a time series object.</td>
<td>5</td>
<td>In Progress</td>
<td>5</td>
<td>R Data Frame</td>
<td>Zoo Object</td>
<td>Medium</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="odd">
<td>Forecast</td>
<td>This feature takes the converted data and applies forecasting functions to it.</td>
<td>1</td>
<td>In Progress</td>
<td>1</td>
<td>Zoo Object</td>
<td>Forecast Object</td>
<td>High</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="even">
<td>Plot Forecasts</td>
<td>This function takes the forecast and generates plots.</td>
<td>3</td>
<td>In Progress</td>
<td>2</td>
<td>Forecast Object</td>
<td>Plot (graphical object)</td>
<td>High</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="odd">
<td>Assess Accuracy</td>
<td>This function assesses the accuracy of the forecasts.</td>
<td>9</td>
<td>In Progress</td>
<td>3</td>
<td>Forecast Object</td>
<td>List</td>
<td>Low</td>
<td>Yes</td>
<td>Current</td>
</tr>
<tr class="even">
<td>Provide Values</td>
<td>This function provides the actual values for the forecast for use in USTRANSCOM Models</td>
<td>2</td>
<td>Not Started</td>
<td>4</td>
<td>Forecast Object</td>
<td>Vector</td>
<td>High</td>
<td>Yes</td>
<td>Current</td>
</tr>
</tbody>
</table>
