class OrganizersController < ApplicationController
  def new
    @organizer = Organizer.new
  end

  def index
  end

  def create
    @organizer = Organizer.new(organizer_params)
    if @organizer.save
      flash[:success] = "Thanks for signing up!"
      redirect_to root_path
    else
      # handle unsuccessful save
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def organizer_params
    params.require(:organizer).permit(:name, :email, :club_name, :secondary_name, :secondary_email, :address, :city, :state, :zipcode, :num_scopes, :max_attendees)
  end

end