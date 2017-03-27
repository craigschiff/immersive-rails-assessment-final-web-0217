class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
    if params[:episode_id]
      @appearance.episode_id = params[:episode_id]
    end
    if params[:guest_id]
      @appearance.guest_id = params[:guest_id]
    end
  end

  def create
    @appearance = Appearance.new(appearance_params)
    @appearance.user_id = session[:user_id]
    if @appearance.save
      redirect_to episode_path(@appearance.episode)
    else
      redirect_to new_appearance_path
    end
  end

  def show
    @appearance = Appearance.find(params[:id])
  end
#wasnt sure if wanted appearances control - now is hybrid, still redirecting to episode show page and know not restful, just not sure if adds value

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    if @appearance.update(appearance_params)
      redirect_to episode_path(@appearance.episode)
    else
      render :edit
      flash[:alert] = "FAILURE - try again. Rating 1-5 only"
    end
  end


  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

end
