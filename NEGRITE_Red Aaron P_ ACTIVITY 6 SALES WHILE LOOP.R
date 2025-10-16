while(TRUE) {
  item <- readline(prompt = "Enter item sold (shoes, bag, watch, perfume): ")
  
  price <- switch(item,
                  'shoes' = 1500,
                  'bag' = 2000,
                  'watch' = 2500,
                  'perfume' = 1200,
                  0
  )
  
  qty <- as.numeric(readline(prompt = paste('Quantity of', item, ': ')))
  subtotal <- price * qty
  
  cat('Item:', item, '\n')
  cat('Price: Php', price, '\n')
  cat('Quantity:', qty, '\n')
  cat('Subtotal: Php', subtotal, '\n')
  
  if(subtotal > 5000) {
    discount <- subtotal * 0.15
    cat('Discount (15%): Php', discount, '\n')
  } else {
    discount <- 0
  }
  
  total <- subtotal - discount
  cat('Total Sales: Php', total, '\n')
  cat('Thank you for your purchase! Come again soon!\n\n')
}
