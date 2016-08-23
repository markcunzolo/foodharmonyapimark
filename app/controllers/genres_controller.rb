class GenresController < ApplicationController
  def index
    render json: Genre.all
  end

  def create
    @genre = Genre.new(new_genre_params)
    @genre.save!
    render json: Genre.all
  end

  private
  def new_genre_params
    params.require(:genre).permit(
        :name,
        :description
    )
  end
end
