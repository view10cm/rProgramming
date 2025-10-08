repeat {
  cat("\nCentripetal Force Calculator\n")
  cat("Formula: Fc = (m * v^2) / r\n\n")
  
  cat("Choose which variable to solve for:\n")
  cat("1. Centripetal Force (Fc)\n")
  cat("2. Mass (m)\n")
  cat("3. Velocity (v)\n")
  cat("4. Radius (r)\n")
  cat("5. Exit\n")
  
  choice <- as.integer(readline(prompt = "Enter your choice (1-5): "))
  
  if (choice == 1) {
    m <- as.numeric(readline(prompt = "Enter mass (kg): "))
    v <- as.numeric(readline(prompt = "Enter velocity (m/s): "))
    r <- as.numeric(readline(prompt = "Enter radius (m): "))
    Fc <- (m * v^2) / r
    cat("\nCentripetal Force =", round(Fc, 2), "N\n")
    
  } else if (choice == 2) {
    Fc <- as.numeric(readline(prompt = "Enter Centripetal Force (N): "))
    v <- as.numeric(readline(prompt = "Enter velocity (m/s): "))
    r <- as.numeric(readline(prompt = "Enter radius (m): "))
    m <- (Fc * r) / (v^2)
    cat("\nMass =", round(m, 2), "kg\n")
    
  } else if (choice == 3) {
    Fc <- as.numeric(readline(prompt = "Enter Centripetal Force (N): "))
    m <- as.numeric(readline(prompt = "Enter mass (kg): "))
    r <- as.numeric(readline(prompt = "Enter radius (m): "))
    v <- sqrt((Fc * r) / m)
    cat("\nVelocity =", round(v, 2), "m/s\n")
    
  } else if (choice == 4) {
    Fc <- as.numeric(readline(prompt = "Enter Centripetal Force (N): "))
    m <- as.numeric(readline(prompt = "Enter mass (kg): "))
    v <- as.numeric(readline(prompt = "Enter velocity (m/s): "))
    r <- (m * v^2) / Fc
    cat("\nRadius =", round(r, 2), "m\n")
    
  } else if (choice == 5) {
    cat("\nThank you for using the Centripetal Force Calculator! Goodbye!\n")
    break
    
  } else {
    cat("\nInvalid choice! Please select a number between 1 and 5.\n")
  }
}
