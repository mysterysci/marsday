class AttendeesController < ApplicationController
  def new
    @attendee = Attendee.new
  end

  def index
  end

  def create
    @attendee = Attendee.new(attendee_params)
    @attendee.organizer.num_attendees += 1
    if @attendee.save && @attendee.organizer.save
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
  def attendee_params
    params.require(:attendee).permit(:name, :email, :address, :organizer_id)
  end
end
