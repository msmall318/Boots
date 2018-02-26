#global
library(shiny)
library(ggplot2)
library(magrittr)
library(zoo)
library(forecast)
library(Boots)

Troop_Data <- readRDS('data/Troop_Data2.rds')
#data("Troop_Data2.rds")