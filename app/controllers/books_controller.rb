class BooksController < ApplicationController
  def index
    books = Book.all
    render json: books.as_json
  end

  def show
    book = Book.find_by(id: params[:id])
    render json: book.as_json
  end

  def create
    book = Book.new(
      name: params[:name],
      author: params[:author],
      year: params[:year],
      price: params[:price])
    if book.save
      render json: book.as_json
  else
    render json: {errors: books.errors.full_messages}
    end
  end

  def update
    book = Book.find_by(id: params[:id])
    if book.update(
      name: params[:name],
      author: params[:author],
      year: params[:year],
      price: params[:price]
      )
      render json: book.as_json
    else
      render json: {errors: book.errors.full_messages}
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])
    book.destroy
    render json: book.as_json
  end
end