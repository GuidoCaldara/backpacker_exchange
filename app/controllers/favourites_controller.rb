class FavouritesController < ActionController::Base

def destroy
  @favourite = Favourite.find(params[:id])
  @favourite.delete
  redirect_to user_dashboard_path(current_user.id)
end
end
