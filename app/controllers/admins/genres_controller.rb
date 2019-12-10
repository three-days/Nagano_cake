class Admins::GenresController < ApplicationController

layout "admin"

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admins_genres_path, notice: 'You have created product successfully.'
  end

  def update
    
  end

  def destroy
  end


  def book_params
    params.require(:genre).permit(:genre_name)
  end


end
