module TransactionsHelper
  
  def category_count(transactions)
    transaction_list = {}
    transactions.each do |transaction|
      if transaction_list.has_key?(transaction.category)
        transaction_list[transaction.category] << transaction
      else
        transaction_list[transaction.category] = [transaction]
      end
    end
    transaction_list
  end
  
  def category_sum(transaction)
    trans_sum = {}
    transaction.each do |category, transactions|
      trans_sum[category] = 0
      transactions.each do |trans|
        trans_sum[category] += trans.amount
      end
    end
    trans_sum
  end

end
