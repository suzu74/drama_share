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

  def search
    if params[:keyword] 
      @items = RakutenWebService::Books::DVD.search(title: params[:keyword]).first(10)
      
    end
  end

  def post
    @item = params[:title]
    @drama = Drama.new
  end

  def create
      @drama = current_user.dramas.build(drama_params)
      if @drama.save
      flash[:success] = 'ドラマを紹介しました！' 
      redirect_to root_path

    else
      redirect_to search_path
    end
  end

  private

    def drama_params
      params.require(:drama).permit(:title, :description, :image)
    end
end
