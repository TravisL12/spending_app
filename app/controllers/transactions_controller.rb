class TransactionsController < ApplicationController

  def index
    @user = User.find_by_username(params[:username])
  end

  def show
    @transactions = Transaction.find_by_user_id(params[:user_id])
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
end
