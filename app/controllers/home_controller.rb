class HomeController < ApplicationController
  def top
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end
end
