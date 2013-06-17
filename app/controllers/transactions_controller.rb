class TransactionsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @transactions = @user.transactions.where(:date => Date.new(@year,@month,1)..Date.new(2009,1,1))
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
end
