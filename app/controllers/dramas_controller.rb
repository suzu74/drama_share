class DramasController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @drama = current_user.dramas.build(drama_params)
    if @user.save
      flash[:success] = "ドラマが紹介されました!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def drama_params
      params.require(:drama).permit(:title, :description)
    end
end
