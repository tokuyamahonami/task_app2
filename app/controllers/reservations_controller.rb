class ReservationsController < ApplicationController

    #before_action :permit_params

	def index
		@user = current_user
		@reservations = Reservation.all
	end

    def confirm
		#binding.pry
		@room = Room.find(params[:reservation][:room_id])
        @user_id = current_user.id
        @reservation = Reservation.new(reservation_params)
    end

    def create
		@room = Room.find(params[:reservation][:room_id])
        @reservation = Reservation.new(reservation_params)
        #@room = @reservation.room
        if @reservation.save
           flash[:notice] = "予約が完了しました"
           redirect_to reservations_complete_path(@reservation.id)
        else
           @user = current_user
           #render 'rooms/show'
        end
    end

    def complete
		@reservation = Reservation.find(params[:reservation][:room_id])

    end

    private

    def reservation_params
        params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :people, )
    end





end
