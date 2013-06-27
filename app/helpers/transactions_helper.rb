module TransactionsHelper

  def category_count(transactions)
    transaction_list = {}
    transactions.each do |transaction|
      if transaction_list.has_key?(transaction.category_name)
        transaction_list[transaction.category_name] << transaction
      else
        transaction_list[transaction.category_name] = [transaction]
      end
    end
    transaction_list.sort_by { |cat| cat.first.name }
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
    transactions = current_user.transactions.where(:date => begin_date..end_date).all_cached
    transactions = category_count(transactions)
  end

end
