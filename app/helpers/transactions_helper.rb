module TransactionsHelper

  def category_count(transactions)
    transaction_list = {}
    transactions.each do |transaction|
      if transaction_list.has_key?(transaction.trans_category)
        transaction_list[transaction.trans_category] << transaction
      else
        transaction_list[transaction.trans_category] = [transaction]
      end
    end
    transaction_list
  end
  
  def category_sum(transaction)
    trans_sum = {}
    transaction.each do |category, transactions|
      trans_sum[category] = 0
      transactions.each { |trans| trans_sum[category] += trans.amount }
    end
    trans_sum
  end
  
  def transactions_between_dates(begin_date, end_date)
    start_year = begin_date[:year].to_i
    start_month = begin_date[:month].to_i
    start_day = begin_date[:day].to_i

    end_year = end_date[:year].to_i
    end_month = end_date[:month].to_i
    end_day = end_date[:day].to_i

    transactions = current_user.transactions.where(:date => Date.new(start_year, start_month, start_day)..Date.new(end_year, end_month, end_day))
    transactions = category_count(transactions.sort_by! { |sort| sort.trans_category })
  end

  def days_between(begin_date, end_date)
    start_year = begin_date[:year].to_i
    start_month = begin_date[:month].to_i
    start_day = begin_date[:day].to_i
    
    start_day = Date.new(start_year, start_month, start_day).strftime("%Y-%m-%d")

    end_year = end_date[:year].to_i
    end_month = end_date[:month].to_i
    end_day = end_date[:day].to_i
    
    end_day = Date.new(end_year, end_month, end_day).strftime("%Y-%m-%d")
    return (end_day.to_date - start_day.to_date).to_i
  end

end
