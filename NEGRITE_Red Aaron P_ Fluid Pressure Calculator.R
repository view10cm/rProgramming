g <- 9.81  # constant acceleration due to gravity (m/s²)

repeat {
  cat("\nFluid Pressure Calculator\n")
  cat("Formula: P = ρ * g * h\n\n")
  cat("Choose what you want to calculate:\n")
  cat("1 - Pressure (P)\n")
  cat("2 - Density (ρ)\n")
  cat("3 - Height/Depth (h)\n")
  cat("4 - Exit\n")
  
  choice <- readline("Enter your choice (1-4): ")
  
  if (choice == "1") {
    rho <- as.numeric(readline("Enter density of fluid (kg/m³): "))
    h <- as.numeric(readline("Enter height/depth of fluid column (m): "))
    P <- rho * g * h
    cat("\nPressure =", round(P, 2), "Pascals (Pa)\n")
    
  } else if (choice == "2") {
    P <- as.numeric(readline("Enter pressure (Pa): "))
    h <- as.numeric(readline("Enter height/depth of fluid column (m): "))
    rho <- P / (g * h)
    cat("\nDensity =", round(rho, 2), "kg/m³\n")
    
  } else if (choice == "3") {
    P <- as.numeric(readline("Enter pressure (Pa): "))
    rho <- as.numeric(readline("Enter density of fluid (kg/m³): "))
    h <- P / (rho * g)
    cat("\nHeight/Depth =", round(h, 4), "meters (m)\n")
    
  } else if (choice == "4") {
    cat("\nThank you for using the Fluid Pressure Calculator! Goodbye!\n")
    break
    
  } else {
    cat("\nInvalid choice! Please select 1, 2, 3, or 4.\n")
  }
}
