class Admin::GenresController < ApplicationController
  
  before_action :authenticate_admin!

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(admin_genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(admin_genre_params)
    redirect_to admin_genres_path
  end

  private

  def admin_genre_params
    params.require(:genre).permit(:name)
  end


end
