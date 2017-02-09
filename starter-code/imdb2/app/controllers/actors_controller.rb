class ActorsController < ApplicationController

  before_action :set_actor, only: [:edit, :show, :update]

  def new
    @actor = Actor.new
  end

  def edit
  end

  def show
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save!
      redirect_to @actor
    else
      render :new
    end
  end

  def update
    if @actor.update(actor_params)
      redirect_to @actor
    else
      render :edit
    end
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :year_of_birth, :thumbnail)
  end

  def set_actor
    @actor = Actor.find_by_id(params[:id])
  end

end
