class SessionController < ApplicationController
  skip_before_action :authenticate, only: %i[new create]

  def new

  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      # flash.now[:error] = "Invalid email/password combination.\n"
      # @title = flash.now[:error]
      #  render 'new'
      redirect_to signin_url, alert: 'Invalid email/password combination.'

    else
      sign_in user
      redirect_to main_index_path
    end
  end

  def destroy
    sign_out
    redirect_to signin_url
  end
end
