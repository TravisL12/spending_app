class TransactionsController < ApplicationController
  
  include TransactionsHelper
  include UsersHelper
  
  def index
    @user = User.find_by_username(current_user.username)
    @start_date = Date.new(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
    @end_date = Date.new(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)

    @days_between = (@end_date - @start_date).to_i

    @transactions = transactions_between_dates(@start_date, @end_date)
    @trans_total_amount = category_sum(@transactions)

    @cat_page = render_to_string :partial => 'transactions/category_summary', :locals => 
                                           {:user => @user,
                                            :start_date => @start_date.to_date.strftime("%b, %d %Y"),
                                            :end_date => @end_date.to_date.strftime("%b, %d %Y"),
                                            :days_between => @days_between,
                                            :transactions => @transactions,
                                            :trans_total_amount => @trans_total_amount}

    render :json => { :category_page => @cat_page }
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
