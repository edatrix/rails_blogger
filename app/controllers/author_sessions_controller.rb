class AuthorSessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:username], params[:password])
      redirect_back_or_to(articles_path, message: "successful login")
    else
      flash.now.alert = "login failed"
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, message: 'logged out!')
  end

end
