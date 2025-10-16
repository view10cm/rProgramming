while(TRUE) {
  typhoon <- readline(prompt = "Enter typhoon name (A,B,C,D): ")
  
  wind_speed <- switch(typhoon,
                       'A' = 120,
                       'B' = 150,
                       'C' = 180,
                       'D' = 210,
                       0
                      )
  
  hours <- as.numeric(readline(prompt = paste('How many hours did typhoon', typhoon, 'last?: ')))
  rainfall <- wind_speed * hours * 0.2
  
  cat('Typhoon:', typhoon, '\n')
  cat('Wind Speed (kph):', wind_speed, '\n')
  cat('Hours:', hours, '\n')
  cat('Estimated Rainfall (mm):', rainfall, '\n')
  
  if(wind_speed >= 200) {
    cat('Category: Super Typhoon\n')
  } else if(wind_speed >= 150) {
    cat('Category: Typhoon\n')
  } else {
    cat('Category: Tropical Storm\n')
  }
  
  cat('Stay safe and keep updated with weather reports!\n\n')
}
