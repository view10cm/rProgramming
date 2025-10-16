while(TRUE) {
  city <- readline(prompt = "Enter city (Manila, Baguio, Cebu, Davao): ")
  
  temp <- switch(city,
                 'Manila' = 33.5,
                 'Baguio' = 22.1,
                 'Cebu' = 31.8,
                 'Davao' = 30.2,
                 0
  )
  
  days <- as.numeric(readline(prompt = paste('Enter number of days recorded in', city, ': ')))
  avg_temp <- temp * days / days
  
  cat('City:', city, '\n')
  cat('Average Temperature (°C):', temp, '\n')
  cat('Days Recorded:', days, '\n')
  cat('Overall Avg Temperature:', avg_temp, '\n')
  
  if(temp >= 35) {
    cat('Status: Extremely Hot\n')
  } else if(temp >= 30) {
    cat('Status: Warm\n')
  } else if(temp >= 25) {
    cat('Status: Mild\n')
  } else {
    cat('Status: Cool\n')
  }
  
  cat('Remember to stay hydrated and check the forecast daily!\n\n')
}
