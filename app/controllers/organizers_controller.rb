class OrganizersController < ApplicationController
  def new
    @organizer = Organizer.new
  end

  def index
    if params.has_key? :ne_latitude then
      render json: Organizer.in_box(params[:ne_latitude], params[:ne_longitude], params[:sw_latitude], params[:sw_longitude])
    end
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

  def search
    render json: Organizer.close_to(params[:latitude], params[:longitude], params[:meters])
  end

  private
  def organizer_params
    params.require(:organizer).permit(:name, :email, :club_name, :secondary_name, :secondary_email, :address, :location, :zipcode, :num_scopes, :max_attendees)
  end
end
