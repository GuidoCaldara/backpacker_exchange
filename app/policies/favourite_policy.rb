class FavouritePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def destroy?
    
   @user.id == @record.id
  end

end
