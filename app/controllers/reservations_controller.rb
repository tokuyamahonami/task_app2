class ReservationsController < ApplicationController


	def index
        @user_id = current_user.id
		@reservations = Reservation.all
	end

    def confirm
		@room = Room.find(params[:reservation][:room_id])
        @user_id = current_user.id
        @reservation = Reservation.new(reservation_params)
    end

    def create
		@room = Room.find(params[:reservation][:room_id])
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
           redirect_to reservations_path(@reservation.id)
        else
           @user = current_user
           render 'rooms/show'
        end
    end

    private

    def reservation_params
        params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :people )
    end





end
