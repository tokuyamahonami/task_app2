class ReservationsController < ApplicationController

    #before_action :permit_params, except: :new

	def index
		@user = current_user
		@reservations = Reservation.all
	end

    def confirm
		binding.pry
		@reservation = Reservation.new
		@room = Room.find(params[:id])
		@user = current_user
		binding.pry
	end

    def create
		@reservation = Reservation.new(params.permit(:room_id, :user_id, :start_date, :end_date, :single_rate, :total_price, :people, :total_day))
		if @reservation.save
		   flash[:notice] = "予約が完了しました"
		   redirect_to reservation_path(@reservation.id)
		else
		   @room = Room.find(params[:reservation][:room_id])
		   @user = User.find(params[:reservation][:user_id])
		   render :new
		end
	end


    def complete
		@reservation = Reservation.find(params[:id])
	end

	def show
		@reservation = Reservation.find(params[:id])
		@room = Room.find(@reservation.room_id)
	end


    private

	def reservation_params
		params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :single_rate, :total_price, :people, :total_day)
	end

end
