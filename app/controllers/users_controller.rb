class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    @user.password = BCrypt::Password.create(params[:user][:password_digest])
    if  @user.save
          session[:user_id] =  @user.id
          redirect_to root_path(), notice: 'Usuario se ha creado con éxito!'
      else
          redirect_to users_sign_up_path,notice: 'Usuario no  ha sido creado !'
      end
  end

  def my_history
    @histories = helpers.current_user.histories
  end

  private

  def user_param
      params.require(:user).permit(:name,:email,:password_digest)
  end
end
