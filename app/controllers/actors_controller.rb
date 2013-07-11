class ActorsController < ApplicationController
  def index
    @actors = Actor.order('name').all
  end

  def show
    @actor = Actor.find(params[:id])
  end
end
