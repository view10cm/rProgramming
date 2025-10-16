while(TRUE) {
  car <- readline(prompt = "Enter car type (Sedan, SUV, Truck, Hatchback): ")
  
  fuel_efficiency <- switch(car,
                            'Sedan' = 15,      # km per Liters of gas
                            'SUV' = 10,
                            'Truck' = 8,
                            'Hatchback' = 18,
                            0
  )
  
  distance <- as.numeric(readline(prompt = paste('Enter distance traveled by the', car, '(in km): ')))
  fuel_used <- distance / fuel_efficiency
  fuel_cost <- fuel_used * 65
  
  cat('Car Type:', car, '\n')
  cat('Fuel Efficiency:', fuel_efficiency, 'km/L\n')
  cat('Distance Travelled:', distance, 'km\n')
  cat('Fuel Consumption:', fuel_used, 'L\n')
  cat('Fuel Cost: Php', fuel_cost, '\n')
  
  if(fuel_efficiency >= 15) {
    cat('Rating: Long Travels\n')
  } else {
    cat('Rating: Regular Travelsn')
  }
  
  cat('Drive safely')
}
