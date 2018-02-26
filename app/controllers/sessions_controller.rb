class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present?
        if   BCrypt::Password.new(@user.password)  == params[:user][:password_digest]
              session[:user_id] =  @user.id
              redirect_to root_path(), notice: 'Usuario se ha creado con éxito!'
        else
              redirect_to users_sign_up_path,notice: 'Usuario no  ha sido creado !'
        end
    else
              redirect_to users_sign_up_path,notice: 'Usuario no  ha sido creado !'
    end
  end
end
