class LikesController < ApplicationController

	def create
    @like = Like.new(user_id: current_user.id, drama_id: params[:drama_id])
    @like.save
    redirect_to dramas_path
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, drama_id: params[:drama_id])
    @like.destroy
		redirect_to dramas_path
	end
end

