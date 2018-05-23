class ItemPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?

  end

  def new?

  end

  def update?
    @record.user_id == @user.id) || @user.admin
  end

  def edit?
    @record.user_id == @user.id) || @user.admin
  end

  def destroy?
    @record.user_id == @user.id) || @user.admin
  end

end
