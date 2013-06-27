class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end
  
  def date_sort
    @category = Category.find(params[:category])
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @transactions = @category.transactions.where(:date => @start_date..@end_date)
  end

end
