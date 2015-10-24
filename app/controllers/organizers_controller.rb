class OrganizersController < ApplicationController
  def new
  end

  def index
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def search
    render json: Organizer.close_to(params[:latitude], params[:longitude], params[:meters])
  end
end
