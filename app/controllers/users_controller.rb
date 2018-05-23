class UsersController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @user = current_user
    authorize @user
    @selling_items = Item.where(user_id: current_user.id)
    @favourites =[]
    @user.favourites.each do |fav|
      @favourites << Item.find(fav.item_id)
    end
    @favourites
  end

  def complete_profile
    @user = current_user
    authorize @user
  end

  def save_profile
    @user = current_user
    authorize @user
    @user.update(user_params)
    @user.profile_complete = true
    @user.save
    redirect_to items_path
  end


  def user_params
    params.require(:user).permit(:username, :place, :dob, :description, :avatar)

  end
end
