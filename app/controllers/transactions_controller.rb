class TransactionsController < ApplicationController
  
  include TransactionsHelper
  def index
    @user = User.find(params[:user_id])

    @start_year = params[:start_date][:year].to_i
    @start_month = params[:start_date][:month].to_i
    @start_day = params[:start_date][:day].to_i

    @end_year = params[:end_date][:year].to_i
    @end_month = params[:end_date][:month].to_i
    @end_day = params[:end_date][:day].to_i

    transactions = @user.transactions.where(:date => Date.new(@start_year, @start_month, @start_day)..Date.new(@end_year, @end_month, @end_day))
    @transactions = category_count(transactions)
    @trans_total_amount = category_sum(@transactions)
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
