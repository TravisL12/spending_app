class UsersController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
  end

  def new
  end
  
  def show
  end

  def login
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def authenticate
    authenticate_user(params) 
  end

end
