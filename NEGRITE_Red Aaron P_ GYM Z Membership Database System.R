#===============================================
# CLASS 1: CUSTOMER
#===============================================
create_customer <- function(name, age, membership) {
  customer <- list(
    name = name,
    age = age,
    membership = membership
  )
  class(customer) <- "Customer"
  return(customer)
}

print.Customer <- function(x, ...) {
  cat('Name:', x$name, '\n',
      'Age:', x$age, '\n',
      'Membership Level:', x$membership, '\n\n')
}

#===============================================
# CLASS 2: MEMBERSHIP LOGIC (ARITHMETIC)
#===============================================
create_logic <- function(customers) {
  logic <- list(customers = customers)
  class(logic) <- "MembershipLogic"
  return(logic)
}

average_age.MembershipLogic <- function(logic) {
  if (length(logic$customers) == 0) return(0)
  avg <- mean(sapply(logic$customers, function(c) c$age))
  return(avg)
}

count_by_membership.MembershipLogic <- function(logic, type) {
  count <- sum(sapply(logic$customers, function(c) tolower(c$membership) == tolower(type)))
  return(count)
}

#===============================================
# CLASS 3: DISCOUNT SYSTEM (MULTIPLE IF-ELSE)
#===============================================
create_discount <- function(customer) {
  discount <- list(customer = customer)
  class(discount) <- "DiscountSystem"
  return(discount)
}

evaluate_discount.DiscountSystem <- function(discount) {
  membership <- tolower(discount$customer$membership)
  age <- discount$customer$age
  percent <- 0
  reason <- ""
  
  # multiple if-else logic
  if (membership == "gold" && age >= 18 && age <= 25) {
    percent <- 20
    reason <- "Gold member under 25 - Youth Fitness Promo"
  } else if (membership == "gold") {
    percent <- 15
    reason <- "Gold Member Discount"
  } else if (membership == "silver" && age > 30) {
    percent <- 10
    reason <- "Silver Senior Bonus"
  } else if (membership == "regular" && age < 18) {
    percent <- 5
    reason <- "Teen Regular Discount"
  } else {
    percent <- 0
    reason <- "No discount applicable"
  }
  
  return(list(percent = percent, reason = reason))
}

#===============================================
# MAIN PROGRAM LOOP
#===============================================
customers <- list()

repeat {
  cat("\n===========================================\n")
  cat("        🏋️‍♂️  G Y M   Z   S Y S T E M\n")
  cat("===========================================\n")
  cat("1. Register a Customer\n")
  cat("2. View All Customers\n")
  cat("3. View Membership Summary\n")
  cat("4. Evaluate Discount Eligibility\n")
  cat("5. Exit\n")
  cat("===========================================\n")
  
  choice <- as.integer(readline("Choose an option: "))
  
  if (choice == 1) {
    # REGISTER A CUSTOMER
    cat("\nEnter customer details:\n")
    name <- readline("Name: ")
    age <- as.integer(readline("Age: "))
    membership <- readline("Membership Type (Gold/Silver/Regular): ")
    
    customers[[length(customers) + 1]] <- create_customer(name, age, membership)
    cat("\nCustomer successfully registered!\n")
    
  } else if (choice == 2) {
    # VIEW ALL CUSTOMERS
    if (length(customers) == 0) {
      cat("\nNo customers registered yet.\n")
    } else {
      cat("\n====== GYM Z CUSTOMERS ======\n")
      i <- 1
      for (member in customers) {
        cat(sprintf("Customer %d:\n", i))
        print(member)
        i <- i + 1
      }
    }
    
  } else if (choice == 3) {
    # MEMBERSHIP LOGIC
    if (length(customers) == 0) {
      cat("\nNo data available.\n")
    } else {
      logic <- create_logic(customers)
      avg_age <- average_age.MembershipLogic(logic)
      gold <- count_by_membership.MembershipLogic(logic, "Gold")
      silver <- count_by_membership.MembershipLogic(logic, "Silver")
      regular <- count_by_membership.MembershipLogic(logic, "Regular")
      
      cat("\n------ MEMBERSHIP SUMMARY ------\n")
      cat("Average Age   :", round(avg_age, 2), "years\n")
      cat("Gold Members  :", gold, "\n")
      cat("Silver Members:", silver, "\n")
      cat("Regular Members:", regular, "\n")
    }
    
  } else if (choice == 4) {
    # DISCOUNT SYSTEM
    if (length(customers) == 0) {
      cat("\nNo customers to evaluate.\n")
    } else {
      cat("\n------ DISCOUNT EVALUATION ------\n")
      for (c in customers) {
        discount <- create_discount(c)
        info <- evaluate_discount.DiscountSystem(discount)
        cat(c$name, "-", info$percent, "% Discount:", info$reason, "\n")
      }
    }
    
  } else if (choice == 5) {
    cat("\nThank you for using the GYM Z Customer System!\n")
    cat("===========================================\n")
    break
    
  } else {
    cat("Invalid choice. Please try again.\n")
  }
}
