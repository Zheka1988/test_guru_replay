class SessionsController < Devise::SessionsController
  def create
    super
    flash[:success] = "Привет, #{current_user.username}!"
  end
end
