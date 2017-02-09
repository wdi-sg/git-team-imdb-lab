class MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :show, :update]

  def index
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def show
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save!
      redirect_to @movie
    else
      render :new
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary, :youtube_embeded_id, :thumbnail)
  end

  def set_movie
    @movie = movie.find_by_id(params[:id])
  end

end
