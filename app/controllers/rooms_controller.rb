class RoomsController < ApplicationController
  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id #deviseのメソッドを使って「ログインしている自分のid」を代入
      if @room.save
        flash[:notice] = "投稿しました"
        redirect_to @room
      else
        flash.now[:alert] = "投稿に失敗しました"
        render "new"
      end
  end

  def show
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    @room = Room.find(params[:id])
    @user = @room.user
    @reservation=Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "投稿しました"
      redirect_to @room
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :edit , status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
      @room.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_back(fallback_location: root_path)
  end

  def own
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end

  private
    def room_params
      params.require(:room).permit(
        :image,
        :name,
        :introduction,
        :priice,
        :address,
        :user_id
      )
    end

end
