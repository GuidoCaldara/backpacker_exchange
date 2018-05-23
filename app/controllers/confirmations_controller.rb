class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
     sign_in(resource)
     complete_profile_path(current_user)
  end
end
