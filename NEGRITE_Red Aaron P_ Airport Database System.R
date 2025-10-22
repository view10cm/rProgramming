#===============================================
# CLASS 1: AIRPLANE
#===============================================
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
  cat(' Model   :', x$model, '\n',
      ' Airline :', x$airline, '\n',
      ' Capacity:', x$capacity, 'passengers\n',
      ' Range   :', format(x$range_km, big.mark = ",", scientific = FALSE), 'km\n\n')
}

#===============================================
# CLASS 2: LOGIC (Arithmetic Computations)
#===============================================
create_logic <- function(fleet) {
  logic <- list(fleet = fleet)
  class(logic) <- "Logic"
  return(logic)
}

# Compute average capacity
average_capacity.Logic <- function(logic) {
  if (length(logic$fleet) == 0) return(0)
  total <- sum(sapply(logic$fleet, function(p) p$capacity))
  avg <- total / length(logic$fleet)
  return(avg)
}

# Compute total range
total_range.Logic <- function(logic) {
  if (length(logic$fleet) == 0) return(0)
  total <- sum(sapply(logic$fleet, function(p) p$range_km))
  return(total)
}

#===============================================
# CLASS 3: FLIGHT CATEGORY (Special Logic with If-Else)
#===============================================
create_category <- function(plane) {
  category <- list(plane = plane)
  class(category) <- "FlightCategory"
  return(category)
}

# Determine flight range type
evaluate_flight.FlightCategory <- function(category) {
  range <- category$plane$range_km
  
  if (range >= 12000) {
    type <- "Ultra Long-Haul Flight"
  } else if (range >= 8000) {
    type <- "Long-Haul Flight"
  } else if (range >= 4000) {
    type <- "Medium-Haul Flight"
  } else if (range > 0) {
    type <- "Short-Haul Flight"
  } else {
    type <- "Unknown Range"
  }
  
  return(type)
}

#===============================================
# MAIN PROGRAM LOOP
#===============================================
fleet <- list()

repeat {
  cat("\n===========================================\n")
  cat("   W H E R E   S T A R S   L A N D \n")
  cat("===========================================\n")
  cat("1. Add an Airplane\n")
  cat("2. Show Fleet\n")
  cat("3. Compute Fleet Logic (Average/Total)\n")
  cat("4. Categorize Flight Range\n")
  cat("5. Exit\n")
  cat("===========================================\n")
  
  choice <- as.integer(readline("Choose an option: "))
  
  if (choice == 1) {
    # ADD AN AIRPLANE
    cat("\nEnter airplane details:\n")
    model <- readline("Model: ")
    airline <- readline("Airline: ")
    capacity <- as.integer(readline("Passenger Capacity: "))
    range_km <- as.numeric(readline("Range in kilometers: "))
    
    fleet[[length(fleet) + 1]] <- build_airplane(model, airline, capacity, range_km)
    cat("\nAirplane successfully added!\n")
    
  } else if (choice == 2) {
    # DISPLAY ALL PLANES
    if (length(fleet) == 0) {
      cat("\nNo airplanes in the fleet.\n")
    } else {
      cat("\n------ AIRPLANE FLEET RECORDS ------\n")
      for (p in fleet) {
        print(p)
      }
    }
    
  } else if (choice == 3) {
    # LOGIC CLASS — ARITHMETIC FORMULAS
    logic <- create_logic(fleet)
    avg_capacity <- average_capacity.Logic(logic)
    total_range <- total_range.Logic(logic)
    
    if (avg_capacity == 0) {
      cat("\nNo data available for computation.\n")
    } else {
      cat("\n------ FLEET STATISTICS ------\n")
      cat("Average Capacity :", format(avg_capacity, nsmall = 2), "passengers\n")
      cat("Total Range      :", format(total_range, big.mark = ","), "km\n")
    }
    
  } else if (choice == 4) {
    # FLIGHT CATEGORY — MULTIPLE IF-ELSE LOGIC
    if (length(fleet) == 0) {
      cat("\nNo airplanes available to categorize.\n")
    } else {
      cat("\n------ FLIGHT RANGE CATEGORIES ------\n")
      for (p in fleet) {
        category <- create_category(p)
        type <- evaluate_flight.FlightCategory(category)
        cat("Model:", p$model, "-", type, "\n")
      }
    }
    
  } else if (choice == 5) {
    cat("\nThank you for using Where Stars Land Airlines System!\n")
    cat("===========================================\n")
    break
    
  } else {
    cat("Invalid choice. Please try again.\n")
  }
}
