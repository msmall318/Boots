k <- nrow(Troop_Data)+1
for (i in unique(Troop_Data$Country)){
  for (j in seq(1950,2017,1)){
  Troop_Data[k,"Country"] <- i
  Troop_Data[k,"Branch"] <- "All Services"
  Troop_Data[k,"Year"] <- j
  Troop_Data[k,"Personnel"] <- NA
  Troop_Data[k,"Indicator"] <- NA
  Troop_Data[k,"Interpolated"] <- Troop_Data %>% dplyr::filter(Country==i,Year==j) %>% dplyr::summarise(Interpolated=sum(Interpolated,na.rm = TRUE))
  k <- k+1
  }
}
