class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]


  # GET /rooms or /rooms.json
  def index
    @user = current_user
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @user = current_user
		@room = Room.find(params[:room_id]) 
		@reservation = Reservation.new(params.permit(:room_id, :start_date, :end_date, :single_rate, :total_price, :people, :total_day))
  end

  # GET /rooms/new
  def new
    @user = current_user
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @user = current_user
    @room = Room.create(room_params)
      if @room.save
        redirect_to :rooms ,notice: "ルーム情報を新規登録しました"
      else
        flash[:alert] = "ルーム情報を登録できませんでした"
        render "new"
      end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
     @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:name, :introduction, :single_rate, :address, :picture, :user_id)
  end
end
