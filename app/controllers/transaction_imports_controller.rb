class TransactionImportsController < ApplicationController

  def new
    @transaction_import = TransactionImport.new
  end

  def create
    @transaction_import = TransactionImport.new(params[:transaction_import], current_user)

    if @transaction_import.save
      flash[:notice] = 'Transactions Imported Successfully'
      redirect_to user_path(current_user.username)
    else
      render :new
    end
  end

end
