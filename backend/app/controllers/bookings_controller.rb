class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  # GET /bookings
  def index
    @bookings = Booking.all
    render json: @bookings
  end

  # GET /bookings/:id
  def show
    render json: @booking
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:room_id, :user_id, :from_date, :to_date, :total_days, :total_amount, :status)
  end
end
