class UserPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def dashboard?
    @user.id  == @record.id
  end

  def complete_profile?
  @user.id  == @record.id && @user.profile_complete == false
  end

  def save_profile?
    @user.id  == @record.id
  end



end
