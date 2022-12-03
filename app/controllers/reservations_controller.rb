class ReservationsController < ApplicationController

    before_action :permit_params, except: :new

	def index
		@user = current_user
		@reservations = Reservation.all
	end

    #def new
		#@user = current_user
		#@room = Room.find(params[:id]) 
		#@reservation = Reservation.new(reservation_params)
	#end

    def confirm
		@user = current_user
		@reservation = Reservation.new

		@reservation = Reservation.new(reservation_params)
		if @reservation.invalid?
			render :new
		else
			@room = @reservation.room
		end
	end

    def create
		@reservation = Reservation.new(params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:price,:total_price,:people,:total_day))
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
		@user = current_user
		@reservation = Reservation.new(reservation_params)
	end

	def show
		@reservation = Reservation.find(params[:id])
		@room = Room.find(@reservation.room_id)
	end


    private

	def reservation_params
		params.require(:reservation).permit(:room_id,:user_id,:start_date,:end_date,:people)
	end

end
