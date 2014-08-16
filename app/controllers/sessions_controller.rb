class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to :root, notice: 'Successfully signed in'
    else
      render :new
    end
  end
end

