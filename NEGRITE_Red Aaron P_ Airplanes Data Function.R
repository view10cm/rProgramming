build_airplane <- function(model, airline, capacity, range_km) {
  plane <- list(
    model = model,
    airline = airline,
    capacity = capacity,
    range_km = range_km
  )
  class(plane) <- "Airplane"
  return(plane)
}


print.Airplane <- function(x, ...) {
  cat('Model:', x$model, '\n',
      'Airline:', x$airline, '\n',
      'Capacity:', x$capacity, '\n',
      'Range:', format(x$range_km, big.mark = ",", scientific = FALSE), 'km\n\n')
}

fleet <- list()
fleet[['a1']] <- build_airplane('A320neo', 'Cebu Pacific', 180, 6300)
fleet[['a2']] <- build_airplane('Boeing 777-300ER', 'Philippine Airlines', 396, 13650)
fleet[['a3']] <- build_airplane('A350-900', 'Qatar Airways', 325, 15000)


cat("----- Where Stars Land Airlines ----- \n")
for (plane in fleet) {
  print(plane)
}
