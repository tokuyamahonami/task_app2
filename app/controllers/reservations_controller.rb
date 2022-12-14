class ReservationsController < ApplicationController

    #before_action :permit_params, except: :new

	def index
		@user = current_user
		@reservations = Reservation.all
	end

	def show
		@reservations = Reservation.all
		
	end

    def confirm
		#binding.pry
		@reservation = Reservation.new(params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :total_price, :people, :total_day, :name))
		@user = current_user
		if @reservation.valid?
			@room = @reservation.room
			@total_price = @reservation.room.single_rate * @reservation.people * (@reservation.end_date - @reservation.start_date).to_i
			@total_day = (@reservation.end_date - @reservation.start_date).to_i
		else
			render "rooms/show"
		end
	end

    def complete #create
		#binding.pry
		@reservation = Reservation.new(params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :total_price, :people, :total_day, :name))
		#@reservation.total_price = @reservation.room.single_rate * @reservation.people * (@reservation.end_date - @reservation.start_date).to_i
		if @reservation.save
		   flash[:notice] = "予約が完了しました"
		   redirect_to reservation_path(@room.room_id)
		else
		   @room = @reservation.room
		   @room = Room.find(params[:room_id])
		   @user = current_user #User.find(params[:reservation][:user_id])
		end
	end


    #def complete
		#binding.pry
		#@reservation = Reservation.new(reservation_params)
		#@total_price = @reservation.room.single_rate * @reservation.people * (@reservation.end_date - @reservation.start_date).to_i
		#@reservation = Reservation.find(params[:room_id])
		#@room = Room.find(params[:room_id])
	#end

    private

	def reservation_params
		params.require(:reservation).permit(:room_id, :user_id, :start_date, :end_date, :single_rate, :total_price, :people, :total_day, :name, :picture)
	end

end
