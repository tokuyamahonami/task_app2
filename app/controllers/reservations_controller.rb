class ReservationsController < ApplicationController

    #before_action :permit_params, except: :new

	def index
		@user = current_user
		@reservations = Reservation.all
	end

	def show
		@reservation = Reservation.find(params[:id])
		@room = Room.find(@reservation.room_id)
	end

    def confirm
		@reservation = Reservation.new(reservation_params)
		@user = current_user
		if @reservation.valid?
			@room = @reservation.room
			@total_price = @reservation.room.single_rate * @reservation.people * (@reservation.end_date - @reservation.start_date).to_i
			@total_day = (@reservation.end_date - @reservation.start_date).to_i
		else
			render "rooms/show"
		end
	end

    def create
		@reservation = Reservation.new(reservation_params)
		if @reservation.save
		   flash[:notice] = "予約が完了しました"
		   redirect_to reservation_path(@reservation.id)
		else
		   @room = Room.find(params[:reservation][:room_id])
		   @user = User.find(params[:reservation][:user_id])
		   render :complete
		end
	end


    def complete
		@reservation = Reservation.find(params[:id])
	end

    private

	def reservation_params
		params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :single_rate, :total_price, :people, :total_day)
	end

end
