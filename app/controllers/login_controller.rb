class LoginController < ApplicationController
  def show
    if session[:user]
      # todo: change redirect
      redirect_to channels_path
    end
  end
end
