class FavouritesController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

def destroy
  @favourite = Favourite.find(params[:id])
  authorize @favourite
  @favourite.delete
  redirect_to user_dashboard_path(current_user.id)
end


end
