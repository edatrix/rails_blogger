class AuthorSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, message: "successfully logged in.")
    else
      flash.now.alert = "login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, message: "you are now logged out.")
  end

end
