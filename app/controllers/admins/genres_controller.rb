class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
layout "admin"

  def index
    @genres = Genre.all.with_deleted
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
   if @genre.save
    @genres = Genre.all.with_deleted
    redirect_to admins_genres_path
   else
    @genres = Genre.all.with_deleted
    render :index
   end
  end

  def update
   @genre = Genre.with_deleted.find(params[:id])
    if @genre.update(genre_params)
     @genres = Genre.all.with_deleted
     redirect_to admins_genres_path
    else
     render :edit
    end

  end

  def edit
    @genre = Genre.with_deleted.find(params[:id])
  end

  def genre_restore
    @genre = Genre.only_deleted.find(params[:id]).restore
    redirect_to admins_genres_path
  end

  def destroy
    @genre = Genre.with_deleted.find(params[:id])
    @genre.destroy
    redirect_to admins_genres_path
  end
private
  def genre_params
    params.require(:genre).permit(:genre_name, :deleted_at)
  end


end
