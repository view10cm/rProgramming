# Define constructor function
create_customer <- function(name, age, membership) {
  customer <- list(
    name = name,
    age = age,
    membership = membership
  )
  class(customer) <- "Customer"
  return(customer)
}

# Define print method
print.Customer <- function(x, ...) {
  cat('Name:', x$name, '- Age:', x$age, sprintf("(%s Member)\n", x$membership))
}

# Create some customers
customers <- list()
customers[['001']] <- create_customer('Red Negrite', 21, "Gold")
customers[['002']] <- create_customer('Joshua Africa', 21, "Silver")
customers[['003']] <- create_customer('Carl Garcia', 22, "Regular")

# Display
cat("====== GYM Z Customers ======\n")

# Print each customer with numbering
i <- 1
for (member in customers) {
  cat(sprintf("Customer %d: ", i))
  print(member)
  i <- i + 1
}
