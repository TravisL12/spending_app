module TransactionsHelper

  def category_sum(transaction)
    trans_sum = {}
    transaction.each do |category, transactions|
      trans_sum[category] = 0
      transactions.each { |trans| trans_sum[category] += trans.amount }
    end
    trans_sum
  end

  def category_count(transactions)

    transaction_cats = transactions.inject([]) do |cats, transaction|
      cats << transaction.category unless cats.include?(transaction.category); cats
    end

    all_cats = transaction_cats.inject({}) do |h, cats|
      h[cats] = transactions.find_all_by_category_id(cats.id); h
    end

    all_cats.sort_by { |k,v| k }
  end

  def transactions_between_dates(begin_date, end_date)
    transactions = current_user.transactions.where(:date => begin_date..end_date)
    transactions = category_count(transactions)
  end

end
