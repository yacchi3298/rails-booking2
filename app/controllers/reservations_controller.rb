class ReservationsController < ApplicationController
  def index
    @reservations =current_user.reservations
    #binding.pry
    #@room = @reservation.room   #roomの情報をroom_idを使って得る
    #binding.pry
    #@price = (reservation.checkout.to_date-reservation.checkin.to_date) * reservation.room.priice * reservation.Number_of_people.to_i
  end

  def confirm
    @reservation = Reservation.new(reservation_params)  #新しいreservationインスタンスにformからのパラメーターを入れる
    @room = Room.find(params[:reservation][:room_id])   #roomの情報をroom_idを使って得る
    if @reservation.invalid?
      flash[:danger] = @reservation.errors.full_messages
			redirect_to room_path(@room.id)
		else
      @user_id = current_user.id
      @days = (@reservation.checkout.to_date-@reservation.checkin.to_date).to_i    #日数
      @price = @days * @room.priice * @reservation.Number_of_people    #価格
    end
  end

  def create
    #binding.pry
    @reservation = Reservation.new(reservation_params)
    #@room = Room.find(params[:reservation][:room_id])  #confirmで定義済みだからいらない？
    if @reservation.save
      redirect_to :reservations
    else
      render "confirm"
    end
    #binding.pry
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_back(fallback_location: reservations_index_path)
  end

  private
    def reservation_params
      params.require(:reservation).permit(
        :checkin,
        :checkout,
        :Number_of_people,
        :created_at,
        :updated_at,
        :user_id,
        :room_id,
      )
    end
end
