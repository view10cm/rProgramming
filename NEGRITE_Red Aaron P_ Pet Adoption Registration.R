# Define constructor function
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

# Define print method for Pet class
print.Pet <- function(x, ...) {
  cat('Pet Name:', x$name, '\n',
      '   Species:', x$species, '\n',
      '   Age:', x$age, '\n',
      '   Adoption Status:', x$status, '\n\n')
}

# Create pet list
adoption_center <- list()
adoption_center[['p1']] <- register_pet('Buddy', 'Dog', 3, 'Available')
adoption_center[['p2']] <- register_pet('Mochi', 'Cat', 2, 'Adopted')
adoption_center[['p3']] <- register_pet('Luna', 'Rabbit', 1, 'Available')

# Display
cat("===== PET ADOPTION CENTER =====\n")
for (pet in adoption_center) {
  print(pet)
}
