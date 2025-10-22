#===============================================
# CLASS 1: SERIES
#===============================================
make_series <- function(title, director, year, popularity) {
  series <- list(
    title = title,
    director = director,
    year = year,
    popularity = popularity
  )
  class(series) <- "Series"
  return(series)
}

print.Series <- function(x, ...) {
  cat(' Series Title :', x$title, '\n',
      ' Director     :', x$director, '\n',
      ' Release Year :', x$year, '\n',
      ' Popularity   :', format(x$popularity, big.mark = ",", scientific = FALSE), '\n\n')
}

#===============================================
# CLASS 2: LOGIC (ARITHMETIC FORMULAS)
#===============================================
create_logic <- function(series_list) {
  logic <- list(series_list = series_list)
  class(logic) <- "Logic"
  return(logic)
}

# Method to compute average popularity
average_popularity.Logic <- function(logic) {
  if (length(logic$series_list) == 0) return(0)
  total <- sum(sapply(logic$series_list, function(s) s$popularity))
  avg <- total / length(logic$series_list)
  return(avg)
}

#===============================================
# CLASS 3: CATEGORY (SPECIAL LOGIC WITH IF-ELSE)
#===============================================
create_category <- function(series) {
  category <- list(series = series)
  class(category) <- "Category"
  return(category)
}

# Determine popularity level based on score
evaluate_popularity.Category <- function(category) {
  score <- category$series$popularity
  
  if (score >= 95) {
    level <- "Legendary Series"
  } else if (score >= 80) {
    level <- "Highly Popular"
  } else if (score >= 60) {
    level <- "Moderately Popular"
  } else if (score > 0) {
    level <- "Needs More Audience"
  } else {
    level <- "No Data / Unreleased"
  }
  
  return(level)
}

#===============================================
# MAIN PROGRAM LOOP
#===============================================
series_list <- list()

repeat {
  cat("\n===========================================\n")
  cat("     S E R I E S   M A N A G E M E N T\n")
  cat("===========================================\n")
  cat("1. Add a Series\n")
  cat("2. Show All Series\n")
  cat("3. Compute Average Popularity (Logic)\n")
  cat("4. Evaluate Popularity Level\n")
  cat("5. Exit\n")
  cat("===========================================\n")
  
  choice <- as.integer(readline("What would you like to do? "))
  
  if (choice == 1) {
    # ADD A SERIES
    cat("\nEnter details for new series:\n")
    title <- readline("Title: ")
    director <- readline("Director: ")
    year <- as.integer(readline("Release Year: "))
    popularity <- as.numeric(readline("Popularity Score (0–100): "))
    
    series_list[[length(series_list) + 1]] <- make_series(title, director, year, popularity)
    cat("\nSeries added successfully!\n")
    
  } else if (choice == 2) {
    # SHOW ALL SERIES
    if (length(series_list) == 0) {
      cat("\nNo series records available.\n")
    } else {
      cat("\n------ SERIES RECORDS ------\n")
      for (s in series_list) {
        print(s)
      }
    }
    
  } else if (choice == 3) {
    # LOGIC CLASS — COMPUTE AVERAGE POPULARITY
    logic <- create_logic(series_list)
    avg <- average_popularity.Logic(logic)
    if (avg == 0) {
      cat("\nNo data available to compute average.\n")
    } else {
      cat("\nAverage Popularity Score:", format(avg, nsmall = 2), "\n")
    }
    
  } else if (choice == 4) {
    # CATEGORY CLASS — EVALUATE POPULARITY LEVEL
    if (length(series_list) == 0) {
      cat("\nNo series records available to evaluate.\n")
    } else {
      cat("\n------ POPULARITY EVALUATION ------\n")
      for (s in series_list) {
        category <- create_category(s)
        status <- evaluate_popularity.Category(category)
        cat("Series:", s$title, "- Level:", status, "\n")
      }
    }
    
  } else if (choice == 5) {
    cat("\nThank you for using the Series Management System!\n")
    cat("===========================================\n")
    break
    
  } else {
    cat("Invalid choice. Please try again.\n")
  }
}
