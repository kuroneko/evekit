class EntitiesController < ApplicationController
  before_filter :require_user
  
  def index
    @entities = @current_user.entities
    render
  end
  
  def show
    @entity = Entity.find(params[:id])
    if @entity.user != @current_user
      flash[:error] = 'Access denied: You do not own the requested entity.'
      redirect_to (:action => :index)
    else
      render
    end
  end
end
