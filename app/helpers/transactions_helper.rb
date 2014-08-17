module TransactionsHelper

  def category_sum(transactions)
    transactions.inject(Hash.new(0)) do |h, (category, transaction)|
      transaction.each { |trans| h[category] += trans.amount }; h
    end
  end

  def category_count(transactions)

    transaction_cats = transactions.inject([]) do |cats, transaction|
      cats << transaction.category unless cats.include?(transaction.category)
      cats
    end

    all_cats = transaction_cats.inject({}) do |h, cats|
      h[cats] = transactions.where(:category_id => cats.id)
      p h
    end

    all_cats.sort_by { |k,v| k }
  end

  def transactions_between_dates(begin_date, end_date)
    transactions = current_user.transactions.where(:date => begin_date..end_date)
    category_count(transactions)
  end

end
