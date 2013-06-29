class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end
  
  def date_sort
    @category = Category.find(params[:category])
    @start_date = params[:start_date].to_date.strftime("%b %d %Y")
    @end_date = params[:end_date].to_date.strftime("%b %d %Y")
    @transactions = @category.transactions.where(:date => @start_date..@end_date)
    
    @cat_summary = render_to_string :partial => 'category_show', :locals => { :category => @category,
                                                                              :start_date => @start_date,
                                                                              :end_date => @end_date,
                                                                              :transactions => @transactions }
    
    render :json => { :cat_summary => @cat_summary }
  end
end
