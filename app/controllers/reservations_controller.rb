class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    # A user can reserve one table only - how can we limit that?
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @pingpong_table = Pingpong_table.find(params[:course_id])
    @reservation = Reservation.new

    @reservation.pingpong_table = @pingpong_table

    # Find the current user
    @reservation.user = current_user

    # Save
    @reservation.save

    # Go to reservations/index? or reservations/:id
    redirect_to reservations_path
  end

  def update
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :pingpong_table_id)
  end
end
