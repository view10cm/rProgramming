#===========================================
# CLASS 1: VEHICLE (Main class)
#===========================================
create_vehicle <- function(model, brand, horsepower) {
  vehicle <- list(
    model = model,
    brand = brand,
    horsepower = horsepower
  )
  class(vehicle) <- "Vehicle"
  return(vehicle)
}

print.Vehicle <- function(x, ...) {
  cat(sprintf("Model: %s | Brand: %s | Horsepower: %d HP\n", 
              x$model, x$brand, x$horsepower))
}

#===========================================
# CLASS 2: PERFORMANCE (Uses arithmetic logic)
#===========================================
calculate_performance <- function(horsepower) {
  top_speed <- horsepower * 0.8  # Simple estimation
  performance <- list(
    horsepower = horsepower,
    top_speed = top_speed
  )
  class(performance) <- "Performance"
  return(performance)
}

print.Performance <- function(x, ...) {
  cat(sprintf("Estimated Top Speed: %.1f km/h\n", x$top_speed))
}

#===========================================
# CLASS 3: CATEGORY (Uses if-else logic)
#===========================================
categorize_vehicle <- function(horsepower) {
  if (horsepower < 100) {
    category <- "Economy"
  } else if (horsepower < 200) {
    category <- "Midrange"
  } else if (horsepower < 350) {
    category <- "High Performance"
  } else {
    category <- "Supercar"
  }
  class(category) <- "Category"
  return(category)
}

print.Category <- function(x, ...) {
  cat(sprintf("Vehicle Category: %s\n", x))
}

#===========================================
# CLASS 4: DEAL (For car deals)
#===========================================
create_car_deal <- function(model, brand, price, discount) {
  final_price <- ifelse(discount > 0, price - (price * (discount / 100)), price)
  deal <- list(
    model = model,
    brand = brand,
    price = price,
    discount = discount,
    final_price = final_price
  )
  class(deal) <- "Deal"
  return(deal)
}

print.Deal <- function(x, ...) {
  cat(sprintf("Deal: %s %s | Price: Php %.2f | Discount: %.1f%% | Final: Php %.2f\n",
              x$brand, x$model, x$price, x$discount, x$final_price))
}

#===========================================
# MAIN PROGRAM
#===========================================
garage <- list()
deals <- list()

repeat {
  cat("\n========= VEHICLE MANAGEMENT SYSTEM =========\n")
  cat("1. Add a Car\n")
  cat("2. Add a Car Deal\n")
  cat("3. View Car List\n")
  cat("4. View Popular Cars\n")
  cat("5. Exit\n")
  choice <- as.integer(readline("Enter your choice (1-5): "))
  
  if (choice == 1) {
    # ADD A CAR
    cat("\n--- Add a Car ---\n")
    model <- readline("Enter model: ")
    brand <- readline("Enter brand: ")
    horsepower <- as.numeric(readline("Enter horsepower: "))
    
    v <- create_vehicle(model, brand, horsepower)
    p <- calculate_performance(horsepower)
    c <- categorize_vehicle(horsepower)
    
    garage[[length(garage) + 1]] <- list(vehicle = v, performance = p, category = c)
    cat("\n✅ Car successfully added!\n")
    
  } else if (choice == 2) {
    # ADD A CAR DEAL
    cat("\n--- Add a Car Deal ---\n")
    model <- readline("Enter model: ")
    brand <- readline("Enter brand: ")
    price <- as.numeric(readline("Enter price (Php): "))
    discount <- as.numeric(readline("Enter discount (%): "))
    
    d <- create_car_deal(model, brand, price, discount)
    deals[[length(deals) + 1]] <- d
    cat("\n✅ Car deal successfully added!\n")
    
  } else if (choice == 3) {
    # VIEW CAR LIST
    cat("\n====== GARAGE LIST ======\n")
    if (length(garage) == 0) {
      cat("No cars registered yet.\n")
    } else {
      for (i in seq_along(garage)) {
        cat(sprintf("\nCar %d:\n", i))
        print(garage[[i]]$vehicle)
        print(garage[[i]]$performance)
        print(garage[[i]]$category)
      }
    }
    
  } else if (choice == 4) {
    # VIEW POPULAR CARS (Deals Summary)
    cat("\n====== POPULAR CAR DEALS ======\n")
    if (length(deals) == 0) {
      cat("No deals added yet.\n")
    } else {
      for (i in seq_along(deals)) {
        print(deals[[i]])
      }
    }
    
  } else if (choice == 5) {
    cat("\n🙏 Thank you for using the Vehicle Management System!\n")
    break
    
  } else {
    cat("\n❌ Invalid choice. Please select a number from 1 to 5.\n")
  }
}
