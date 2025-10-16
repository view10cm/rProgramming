# Define constructor function
create_vehicle <- function(model, brand, price) {
  vehicle <- list(
    model = model,
    brand = brand,
    price = price
  )
  class(vehicle) <- "Vehicle"
  return(vehicle)
}

# Define print method with commas in price
print.Vehicle <- function(x, ...) {
  price_formatted <- format(x$price, big.mark = ",", scientific = FALSE)
  cat('Vehicle:', x$brand, x$model, '- Price: Php', price_formatted, '\n')
}

# Create vehicles
garage <- list()
garage[['car1']] <- create_vehicle('Civic', 'Honda', 1200000)
garage[['car2']] <- create_vehicle('Fortuner', 'Toyota', 2500000)
garage[['car3']] <- create_vehicle('Mustang', 'Ford', 3500000)


# Display
cat("====== GARAGE LIST ======\n")
i <- 1
for (drive in garage) {
  cat(sprintf("Car %d: ", i))
  print(drive)
  i <- i + 1
}
