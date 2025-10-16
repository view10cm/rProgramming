while(TRUE) {
  workout <- readline(prompt = "Enter workout type (Cardio, Strength, Yoga, Crossfit): ")
  
  calories_per_hour <- switch(workout,
                              'Cardio' = 600,
                              'Strength' = 500,
                              'Yoga' = 250,
                              'Crossfit' = 700,
                              0
  )
  
  duration <- as.numeric(readline(prompt = paste('How many hours did you do', workout, '?: ')))
  total_calories <- calories_per_hour * duration
  
  cat('Type:', workout, '\n')
  cat('Calories Burned per Hour:', calories_per_hour, '\n')
  cat('Duration:', duration, '\n')
  cat('Total Calories:', total_calories, '\n')
  
  if(total_calories >= 500) {
    cat('Status: Excellent\n')
  } else {
    cat('Status: Good workout\n')
  }
  
  cat('Come back Tommorrow, Dont stop kapag hindi kapa masarap!')
}
