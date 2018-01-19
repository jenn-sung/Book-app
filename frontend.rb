require 'Unirest'
require 'pp'

p "Welcome to my book shop!"
p "Choose an option!"

p "[1] See all of my books"
p "[2] See a specific book"
p "[3] Create a new book option"
p "[4] Update a book option"
p "[5] Delete a book option"


user_input = gets.chomp

if user_input == '1'
  response = Unirest.get("localhost:3000/books")
  books = response.body
  pp response
elsif user_input == '2'
  p "Enter an id of a book that you would like to see."
  book_id = gets.chomp
  response = Unirest.get("localhost:3000/books/#{book_id}")
  pp response.body
elsif user_input == '3'
  the_params = {}
  p "Enter the name"
  the_params['name'] = gets.chomp
  p "Enter the author"
  the_params['author'] = gets.chomp
  p "Enter the year"
  the_params['year'] = gets.chomp.to_i
  p "Enter the price"
  the_params['price'] = gets.chomp.to_i
  response = Unirest.post("localhost:3000/books", parameters: the_params)
  pp response
elsif user_input == '4'
  the_params = {}
  p "Enter the id of the book option that you want to update"
  book_id = gets.chomp
  p "Enter the name of the book"
  the_params[:name] = gets.chomp
  response = Unirest.patch("localhost:3000/books", parameters: the_params)


  
    
elsif user_input == '5'
  p "Enter the id of the book you would like to delete"
  book_id = gets.chomp
  response = Unirest.delete("localhost:3000/books/#{book_id}")
  pp response.body
end