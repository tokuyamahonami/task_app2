class ReservationsController < ApplicationController

    #before_action :permit_params

	def index
		@user = current_user
		@reservations = Reservation.all
	end

    def confirm
		#binding.pry
		if params[:room_id]
		@room = Room.find(params[:room_id])
        @user_id = current_user.id
        @reservation = Reservation.new
		else
			render "rooms/show"
		end
    end

    def create
		@room = Room.find(params[:id])
        @reservation = Reservation.new(reservation_params)
        @total_price = @room.single_rate * @reservation.people * (@reservation.end_date - @reservation.start_date).to_i
		@total_day = (@reservation.end_date - @reservation.start_date).to_i
        if @reservation.save
           flash[:notice] = "予約が完了しました"
           redirect_to reservation_path(@room.room_id)
        else
           #@room = @reservation.room
           @user = current_user
           render "rooms/show"
        end
    end

    def complete
        @room = Room.find(params[:room_id])
        @reservation = Reservation.new(reservation_params)
        #@total_price = @reservation.single_rate * @reservation.people * (@reservation.end_date - @reservation.start_date).to_i
    end

    private

    def reservation_params
        params.require(:reservation).permit(:id, :room_id, :user_id, :start_date, :end_date, :single_rate, :total_price, :people, :total_day, :name, :picture)
    end





end
