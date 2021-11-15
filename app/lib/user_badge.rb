class UserBadge
  def initialize(user, options: nil)
    @user = user
    @options = options
  end

  def call
    Badge.create(user: @user)
    @user
  end
end
