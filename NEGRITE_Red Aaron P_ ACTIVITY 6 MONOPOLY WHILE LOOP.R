while(TRUE) {
  property <- readline(prompt = "Enter property (ParkPlace, Boardwalk, MarvinGardens, BalticAve): ")
  
  rent <- switch(property,
                 'ParkPlace' = 350,
                 'Boardwalk' = 500,
                 'MarvinGardens' = 280,
                 'BalticAve' = 60,
                 0
  )
  
  houses <- as.numeric(readline(prompt = paste('How many houses built on', property, '?: ')))
  total_rent <- rent + (houses * 100)
  
  cat('Property:', property, '\n')
  cat('Base Rent:', rent, '\n')
  cat('Houses:', houses, '\n')
  cat('Total Rent Due:', total_rent, '\n')
  
  if(houses >= 5) {
    cat('Wow! You built a hotel! \n')
  } else if(houses >= 3) {
    cat('Good investment! Rent is high now!\n')
  } else {
    cat('Keep building to increase rent.\n')
  }
  
  cat('Pass the dice to the next player!\n\n')
}
