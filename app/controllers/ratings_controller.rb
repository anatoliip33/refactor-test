class RatingsController < ApplicationController

  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to root_path}
      else
        format.html { redirect_to root_path, alert: 'You have already rated' }
      end
    end
  end


  private
    def rating_params
      params.require(:rating).permit(:rate, :story_id).merge(user: current_user)
    end

end
