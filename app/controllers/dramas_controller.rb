class DramasController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @dramas = Drama.all.page(params[:page]).per(6)
  end

  def create
    @drama = current_user.dramas.build(drama_params)
    if @drama.save
      flash[:success] = 'ドラマを紹介しました！' 
      redirect_to current_user
    else
      redirect_to search_path
    end
  end

  def destroy
    @drama.destroy
    flash[:success] = "ドラマを削除しました！"
    redirect_to current_user
  end

  def search
    if params[:keyword]
      @items = RakutenWebService::Books::DVD.search(title: params[:keyword]).first(10)
      @title = params[:keyword]
    else 
      render 'search'
    end
  end

  def post
    @item = params[:title]
    @title = params[:keyword]
    @drama = Drama.new
  end

  private

    def drama_params
      params.require(:drama).permit(:title, :description, :image)
    end

    def correct_user
      @drama = current_user.dramas.find_by(id: params[:id])
      redirect_to root_url if @drama.nil?
    end
end
