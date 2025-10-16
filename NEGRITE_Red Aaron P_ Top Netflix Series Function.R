# Define constructor function
make_film <- function(title, director, year, box_office) {
  film <- list(
    title = title,
    director = director,
    year = year,
    box_office = box_office
  )
  class(film) <- "Series"
  return(film)
}

# Define print method for Movie class
print.Series <- function(x, ...) {
  cat(' Movie Title:', x$title, '\n',
      ' Director:', x$director, '\n',
      ' Release Year:', x$year, '\n',
      ' Box Office: Php', format(x$box_office, big.mark = ",", scientific = FALSE), '\n\n')
}

# Create a list of films
films <- list()
films[['film1']] <- make_film('Stranger Things', 'The Duffer Brothers', 2022, 140700000)
films[['film2']] <- make_film('Wednesday', 'Alfred Gough', 2025, 252500000)


# Display films
cat("------ Series Records ------ \n")
for (watch in films) {
  print(watch)
}
