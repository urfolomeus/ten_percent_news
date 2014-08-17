class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to :root, notice: 'Successfully signed in'
    else
      flash[:alert] = "Couldn't sign in"
      render :new
    end
  end

  def destroy
    logout
    redirect_to :root, notice: 'Signed out'
  end
end

