# app/controllers/rooms_controller.rb

class RoomsController < ApplicationController
    before_action :set_room, only: [:show]
  
    # GET /rooms
    def index
      @rooms = Room.all
      render json: @rooms
    end
  
    # GET /rooms/:id
    def show
      render json: @room
    end
  
    # POST /rooms
    def create
      @room = Room.new(room_params)
  
      if @room.save
        render json: @room, status: :created, location: @room
      else
        render json: @room.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :description, :image_url, :max_count, :phone_number, :rent_per_day, :room_type)
    end
  end
  