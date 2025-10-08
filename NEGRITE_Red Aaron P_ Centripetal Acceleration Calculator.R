repeat {
  cat("\n=== Centripetal Acceleration Calculator ===\n")
  cat("Choose what to solve for:\n")
  cat("1 - Centripetal Acceleration (a_c)\n")
  cat("2 - Linear Velocity (v)\n")
  cat("3 - Radius of Circular Path (r)\n")
  
  choice <- readline(prompt = "Enter your choice (1/2/3): ")
  
  if (choice == "1") {
    v <- as.numeric(readline(prompt = "Enter velocity (m/s): "))
    r <- as.numeric(readline(prompt = "Enter radius (m): "))
    
    a_c <- (v^2) / r
    cat("Centripetal Acceleration =", round(a_c, 4), "m/s²\n")
    
  } else if (choice == "2") {
    a_c <- as.numeric(readline(prompt = "Enter centripetal acceleration (m/s²): "))
    r <- as.numeric(readline(prompt = "Enter radius (m): "))
    
    v <- sqrt(a_c * r)
    cat("Linear Velocity =", round(v, 4), "m/s\n")
    
  } else if (choice == "3") {
    v <- as.numeric(readline(prompt = "Enter velocity (m/s): "))
    a_c <- as.numeric(readline(prompt = "Enter centripetal acceleration (m/s²): "))
    
    r <- (v^2) / a_c
    cat("Radius of Circular Path =", round(r, 4), "m\n")
    
  } else {
    cat("Invalid choice! Please select 1, 2, or 3.\n")
  }
  
  again <- readline(prompt = "\nDo you want to solve another formula? (yes/no): ")
  if (tolower(again) != "yes") {
    cat("Exiting Centripetal Motion Calculator. Goodbye!\n")
    break
  }
}
