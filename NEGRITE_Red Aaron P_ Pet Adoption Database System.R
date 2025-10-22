#===============================================
# CLASS 1: PET
#===============================================
register_pet <- function(name, species, age, status) {
  pet <- list(
    name = name,
    species = species,
    age = age,
    status = status
  )
  class(pet) <- "Pet"
  return(pet)
}

print.Pet <- function(x, ...) {
  cat('Pet Name        :', x$name, '\n',
      'Species         :', x$species, '\n',
      'Age             :', x$age, 'year(s)\n',
      'Adoption Status :', x$status, '\n\n')
}

#===============================================
# CLASS 2: ADOPTION STATS (ARITHMETIC / LOGIC)
#===============================================
create_stats <- function(adoption_center) {
  stats <- list(adoption_center = adoption_center)
  class(stats) <- "AdoptionStats"
  return(stats)
}

count_available.AdoptionStats <- function(stats) {
  available <- sum(sapply(stats$adoption_center, function(p) p$status == "Available"))
  return(available)
}

count_adopted.AdoptionStats <- function(stats) {
  adopted <- sum(sapply(stats$adoption_center, function(p) p$status == "Adopted"))
  return(adopted)
}

average_age.AdoptionStats <- function(stats) {
  if (length(stats$adoption_center) == 0) return(0)
  avg <- mean(sapply(stats$adoption_center, function(p) p$age))
  return(avg)
}

#===============================================
# CLASS 3: PET CATEGORY (MULTIPLE IF-ELSE LOGIC)
#===============================================
create_category <- function(pet) {
  category <- list(pet = pet)
  class(category) <- "PetCategory"
  return(category)
}

classify_age.PetCategory <- function(category) {
  age <- category$pet$age
  
  if (age <= 1) {
    type <- "Young (Puppy/Kitten)"
  } else if (age <= 4) {
    type <- "Adult"
  } else if (age > 4 && age <= 10) {
    type <- "Senior"
  } else if (age > 10) {
    type <- "Elderly"
  } else {
    type <- "Unknown"
  }
  
  return(type)
}

#===============================================
# MAIN PROGRAM LOOP
#===============================================
adoption_center <- list()

repeat {
  cat("\n===========================================\n")
  cat("     🐾  P E T   A D O P T I O N   C E N T E R\n")
  cat("===========================================\n")
  cat("1. Register a Pet\n")
  cat("2. Show All Pets\n")
  cat("3. View Adoption Statistics\n")
  cat("4. Classify Pets by Age\n")
  cat("5. Exit\n")
  cat("===========================================\n")
  
  choice <- as.integer(readline("Choose an option: "))
  
  if (choice == 1) {
    # REGISTER PET
    cat("\nEnter pet details:\n")
    name <- readline("Pet Name: ")
    species <- readline("Species: ")
    age <- as.numeric(readline("Age (in years): "))
    status <- readline("Adoption Status (Available/Adopted): ")
    
    adoption_center[[length(adoption_center) + 1]] <- register_pet(name, species, age, status)
    cat("\nPet successfully registered!\n")
    
  } else if (choice == 2) {
    # DISPLAY PETS
    if (length(adoption_center) == 0) {
      cat("\nNo pets registered yet.\n")
    } else {
      cat("\n------ PET LIST ------\n")
      for (p in adoption_center) {
        print(p)
      }
    }
    
  } else if (choice == 3) {
    # VIEW STATISTICS
    if (length(adoption_center) == 0) {
      cat("\nNo data available.\n")
    } else {
      stats <- create_stats(adoption_center)
      available <- count_available.AdoptionStats(stats)
      adopted <- count_adopted.AdoptionStats(stats)
      avg_age <- average_age.AdoptionStats(stats)
      
      cat("\n------ ADOPTION STATISTICS ------\n")
      cat("Available Pets :", available, "\n")
      cat("Adopted Pets   :", adopted, "\n")
      cat("Average Age    :", round(avg_age, 2), "years\n")
    }
    
  } else if (choice == 4) {
    # CLASSIFY PETS BY AGE
    if (length(adoption_center) == 0) {
      cat("\nNo pets to classify.\n")
    } else {
      cat("\n------ PET AGE CLASSIFICATION ------\n")
      for (p in adoption_center) {
        category <- create_category(p)
        type <- classify_age.PetCategory(category)
        cat(p$name, "-", type, "\n")
      }
    }
    
  } else if (choice == 5) {
    cat("\nThank you for visiting the Pet Adoption Center!\n")
    cat("===========================================\n")
    break
    
  } else {
    cat("Invalid choice. Please try again.\n")
  }
}
